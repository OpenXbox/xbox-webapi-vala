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
    public class XSTSRequest : Object {
        public string relying_party { get; internal set; default="http://xboxlive.com"; }
        public string token_type { get; internal set; default="JWT"; }
        public string sandbox_id { get; internal set; default="RETAIL"; }
        public UserToken user_token { get; set; }
        public DeviceToken device_token { get; set; }
        public TitleToken title_token { get; set; }

        public XSTSRequest.with_tokens (UserToken user_token,
                            DeviceToken? device_token,
                            TitleToken? title_token) {
            this.user_token = user_token;
            this.device_token = device_token;
            this.title_token = title_token;
        }

        public string to_json () {
            Json.Builder builder = new Json.Builder ();

            builder.begin_object ();
            builder.set_member_name ("RelyingParty");
            builder.add_string_value (relying_party);
            
            builder.set_member_name ("TokenType");
            builder.add_string_value (token_type);

            builder.set_member_name ("SandboxId");
            builder.add_string_value (sandbox_id);

            builder.set_member_name ("Properties");
            builder.begin_object ();

            builder.set_member_name ("UserTokens");
            builder.begin_array ();
            builder.add_string_value (user_token.jwt);
            builder.end_array ();

            if (device_token != null) {
                builder.set_member_name("DeviceToken");
                builder.add_string_value(device_token.jwt);
            }

            if (title_token != null) {
                builder.set_member_name("TitleToken");
                builder.add_string_value(title_token.jwt);

            }

            builder.end_object ();
            builder.end_object ();

            Json.Generator generator = new Json.Generator ();
            Json.Node root = builder.get_root ();
            generator.set_root (root);

            return generator.to_data (null);
        }
    }
}
