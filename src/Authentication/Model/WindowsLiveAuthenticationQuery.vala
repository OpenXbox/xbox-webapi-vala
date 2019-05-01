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

using XboxWebApi.Authentication;
using XboxWebApi.Authentication.Token;

namespace XboxWebApi.Authentication.Model {
    public class WindowsLiveAuthenticationQuery {
        public string response_type { get; internal set; }
        public string scope { get; internal set; }
        public string redirect_uri { get; internal set; }
        public string client_id { get; internal set; }
        public string display { get; internal set; }
        public string locale { get; internal set; }

        public WindowsLiveAuthenticationQuery (
            string response_type = WindowsLiveConstants.LOGIN_AUTH_RESPONSE_TYPE,
            string scope = WindowsLiveConstants.LOGIN_AUTH_SCOPE,
            string redirect_uri = WindowsLiveConstants.LOGIN_REDIRECT_URL,
            string client_id = WindowsLiveConstants.CLIENT_ID,
            string display = WindowsLiveConstants.DISPLAY,
            string locale = WindowsLiveConstants.LOCALE
        ) {
            this.response_type = response_type;
            this.scope = scope;
            this.redirect_uri = redirect_uri;
            this.client_id = client_id;
            this.display = display;
            this.locale = locale;
        }

        public HashTable<string,string> get_query () {
            var query = new HashTable<string,string> (str_hash, str_equal);
            query.insert ("response_type", response_type);
            query.insert ("scope", scope);
            query.insert ("redirect_uri",redirect_uri);
            query.insert ("client_id", client_id);
            query.insert ("display", display);
            query.insert ("locale", locale);
            return query;
        }
    }
}
