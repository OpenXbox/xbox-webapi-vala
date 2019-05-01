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
    public class XASURequest : Object {
        public string RelyingParty { get; internal set; }
        public string TokenType { get; internal set; }
        public XASUProperties Properties { get; internal set; }

        public XASURequest (AccessToken access_token,
                           string relying_party="http://auth.xboxlive.com",
                           string token_type="JWT",
                           string auth_method="RPS",
                           string site_name="user.auth.xboxlive.com") {
            this.RelyingParty = relying_party;
            this.TokenType = token_type;
            this.Properties = new XASUProperties (auth_method,
                                                 site_name,
                                                 access_token.jwt);
        }

        public string to_json () {
            Json.Node root = Json.gobject_serialize (this);
            Json.Generator generator = new Json.Generator ();
            generator.set_root (root);
            return generator.to_data (null);
        }
    }

    public class XASUProperties : Object {
        public string AuthMethod { get; internal set; }
        public string SiteName { get; internal set; }
        public string RpsTicket { get; internal set; }

        public XASUProperties (string auth_method,
                               string site_name,
                               string rps_ticket) {
            this.AuthMethod = auth_method;
            this.SiteName = site_name;
            this.RpsTicket = rps_ticket;
        }
    }
}
