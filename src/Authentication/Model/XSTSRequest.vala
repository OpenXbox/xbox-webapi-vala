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

using Gee;
using XboxWebApi.Authentication.Token;

namespace XboxWebApi.Authentication.Model {
    public class XSTSRequest {
        public string relying_party { get; internal set; }
        public string token_type { get; internal set; }
        public XSTSProperties properties { get; internal set; }

        public XSTSRequest (UserToken user_token,
                            string relying_party = "http://xboxlive.com",
                            string token_type = "JWT",
                            string sandbox_id = "RETAIL",
                            DeviceToken device_token,
                            TitleToken title_token) {
            this.relying_party = relying_party;
            this.token_type = token_type;
            this.properties = new XSTSProperties (user_token.jwt,
                                                  sandbox_id,
                                                  device_token.jwt,
                                                  title_token.jwt);
        }
    }

    public class XSTSProperties {
        public string[] user_tokens { get; set; }
        public string sandbox_id { get; set; }
        public string device_token { get; set; }
        public string title_token { get; set; }

        public XSTSProperties (string user_token,
                               string sandbox_id,
                               string device_token,
                               string title_token) {
            this.user_tokens = { user_token };
            this.sandbox_id = sandbox_id;
            this.device_token = device_token;
            this.title_token = title_token;
        }
    }
}
