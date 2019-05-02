/*
 * Copyright (c) 2019 Team OpenXbox (http://openxbox.org)
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this program; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301 USA
 *
 * Authored by: Gabriel Fróes Franco <gffranco@gmail.com>
 */

using Soup;
using XboxWebApi.Authentication.Model;
using XboxWebApi.Authentication.Token;

namespace XboxWebApi.Authentication {
    public class AuthenticationService : Object {
        public AccessToken access_token { get; set; }
        public RefreshToken refresh_token { get; set; }
        public UserToken user_token { get; set; }
        public XToken x_token { get; set; }
        public XboxUserInformation user_information { get; set; }

        public AuthenticationService() {
        }

        public AuthenticationService.from_windows_live_response (WindowsLiveResponse response) {
            access_token = new AccessToken.from_windows_live_response (response);
            refresh_token = new RefreshToken.from_windows_live_response (response);
        }

        public AuthenticationService.with_tokens (AccessToken access_token,
                                                  RefreshToken refresh_token) {
            this.access_token = access_token;
            this.refresh_token = refresh_token;
        }

        public bool authenticate() {
            try {
                WindowsLiveResponse response = refresh_live_token (refresh_token);
                access_token = new AccessToken.from_windows_live_response (response);
                refresh_token = new RefreshToken.from_windows_live_response (response);
                user_token = authenticate_xasua(access_token);
                x_token = authenticate_xsts (user_token);
                return true;
            } catch (Error e) {
                debug ("ERROR: %s", e.message);
                return false;
            }
        }

        private WindowsLiveResponse refresh_live_token (RefreshToken refresh_token) throws Error {
            var session = new Soup.Session ();

            var url = build_refresh_token_url(refresh_token);
            var message = new Soup.Message ("GET", url);
            session.send_message (message);

            WindowsLiveResponse wlr = Json.gobject_from_data(
                typeof (WindowsLiveResponse),
                (string) message.response_body.data) as WindowsLiveResponse;

            return wlr;
        }

        private UserToken authenticate_xasua (AccessToken access_token)  throws Error {
            var session = new Soup.Session ();

            var url = build_user_authenticate_url ();
            var request_data = new XASURequest (access_token).to_json ();

            var message = new Soup.Message ("POST", url);
            message.request_headers.append ("x-xbl-contract-version", "1");
            message.set_request ("application/json", MemoryUse.COPY, request_data.data);
            session.send_message (message);

            XASResponse xasr = new XASResponse.from_json ((string) message.response_body.data);

            return new UserToken.from_xasresponse (xasr);
        }

        private XToken authenticate_xsts (UserToken user_token) throws Error {
            var session = new Soup.Session ();
        	
            Soup.Logger logger = new Soup.Logger (Soup.LoggerLogLevel.BODY, -1);	
	        session.add_feature (logger);

            var url = build_xsts_authenticate_url();
            var request_data = new XSTSRequest.with_tokens(user_token).to_json();

            var message = new Soup.Message("POST", url);
            message.request_headers.append("x-xbl-contract-version", "1");
            message.set_request ("application/json", MemoryUse.COPY, request_data.data);
            session.send_message (message);

            XASResponse xasr = new XASResponse.from_json ((string) message.response_body.data);

            return new XToken.from_xasresponse(xasr);
        }

        private string build_xsts_authenticate_url () {
            URI uri = new URI (WindowsLiveConstants.XSTS_AUTH_URL);
            uri.set_path (WindowsLiveConstants.XSTS_AUTH_AUTHENTICATE_PATH);
            return uri.to_string(false);
        }

        private string build_user_authenticate_url () {
            URI uri = new URI(WindowsLiveConstants.USER_AUTH_URL);
            uri.set_path(WindowsLiveConstants.USER_AUTH_AUTHENTICATE_PATH);
            return uri.to_string(false);
        }

        private string build_refresh_token_url (RefreshToken refresh_token) {
            URI uri = new URI(WindowsLiveConstants.LOGIN_SERVICE_URL);
            uri.set_path(WindowsLiveConstants.LOGIN_REFRESH_TOKEN_PATH);
            uri.set_query_from_form(new WindowsLiveRefreshQuery(refresh_token).get_query());
            return uri.to_string(false);
        }

        public static string get_authentication_url () {
            URI uri = new URI(WindowsLiveConstants.LOGIN_SERVICE_URL);
            uri.set_path(WindowsLiveConstants.LOGIN_AUTHORIZE_PATH);
            uri.set_query_from_form(new WindowsLiveAuthenticationQuery().get_query());
            return uri.to_string(false);
        }
    }
}
