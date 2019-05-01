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
    public class WindowsLiveRefreshQuery {
        public string grant_type { get; internal set; }
        public string client_id { get; internal set; }
        public string scope { get; internal set; }
        public string refresh_token { get; internal set; }

        public WindowsLiveRefreshQuery (
            RefreshToken refresh_token,
            string grant_type = WindowsLiveConstants.LOGIN_GRANT_TYPE,
            string client_id = WindowsLiveConstants.CLIENT_ID,
            string scope = WindowsLiveConstants.LOGIN_AUTH_SCOPE) {
            this.grant_type = grant_type;
            this.client_id = client_id;
            this.scope = scope;
            this.refresh_token = refresh_token.jwt;
        }

        public HashTable<string,string> get_query () {
            var query = new HashTable<string,string> (str_hash, str_equal);
            query.set ("grant_type", grant_type);
            query.set ("client_id", client_id);
            query.set ("scope", scope);
            query.set ("refresh_token", refresh_token);
            return query;
        }
    }
}
