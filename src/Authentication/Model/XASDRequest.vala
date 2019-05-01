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

using XboxWebApi.Authentication.Token;

namespace XboxWebApi.Authentication.Model {
    public class XASDRequest {
        public string relying_party { get; internal set; }
        public string token_type { get; internal set; }
        public XASDProperties properties { get; internal set; }

        public XASDRequest (AccessToken access_token,
                           string relying_party="http://auth.xboxlive.com",
                           string token_type="JWT",
                           string auth_method="RPS",
                           string site_name="user.auth.xboxlive.com") {
            this.relying_party = relying_party;
            this.token_type = token_type;
            this.properties = new XASDProperties (auth_method,
                                                  site_name,
                                                  access_token.jwt);
        }
    }

    public class XASDProperties {
        public string auth_method { get; internal set; }
        public string site_name { get; internal set; }
        public string rps_ticket { get; internal set; }

        public XASDProperties (string auth_method,
                               string site_name,
                               string rps_ticket) {
            this.auth_method = auth_method;
            this.site_name = site_name;
            this.rps_ticket = rps_ticket;
        }
    }
}
