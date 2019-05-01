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
    public class WindowsLiveResponse : Object {
        public string access_token { get; set; }
        public int expires_in { get; set; }
        public string refresh_token { get; set; }
        public string user_id { get; set; }
        public string scope { get; set; }
        public string token_type { get; set; }

        public DateTime creation_time {
            get; private set; default = new DateTime.now ();
        }

        public WindowsLiveResponse.from_query (HashTable<string,string> query_params) {
            creation_time = new DateTime.now ();
            expires_in = int.parse (query_params["expires_in"]);
            access_token = query_params["access_token"];
            token_type = query_params["token_type"];
            scope = query_params["scope"];
            refresh_token = query_params["refresh_token"];
            user_id = query_params["user_id"];
        }

        public string to_string() {
            return new StringBuilder()
                .append("%s {\n".printf(this.get_type().name()))
                .append("\tcreation_time=%s,\n".printf(creation_time.to_string()))
                .append("\texpires_in=%d,\n".printf(expires_in))
                .append("\taccess_token=%s,\n".printf(access_token))
                .append("\ttoken_type=%s,\n".printf(token_type))
                .append("\tscope=%s,\n".printf(scope))
                .append("\trefresh_token=%s,\n".printf(refresh_token))
                .append("\tuser_id=%s\n".printf(user_id))
                .append("}\n").str;
        }
    }
}
