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

namespace XboxWebApi.Api { 
    public class XblService : Object {
        private XblApiClient _client;
        public string base_url { get; private set; }

        public XblService(XblApiClient client, string base_url) {
            this._client = client;
            this.base_url = base_url;
        }

        private Soup.Message create_api_request(string method, string url_path) {
            // TODO: Join URL
            string url = base_url + url_path;
            return _client.create_request (method, url);
        }

        internal uint send_message(Soup.Message message) {
            return _client.send_message(message);
        }

        internal Soup.Message create_get_request(string url_path) {
            return create_api_request ("GET", url_path);
        }

        internal Soup.Message create_post_request(string url_path) {
            return create_api_request ("POST", url_path);
        }

        internal Soup.Message create_put_request(string url_path) {
            return create_api_request ("PUT", url_path);
        }

        internal Soup.Message create_delete_request(string url_path) {
            return _client.create_request ("DELETE", url_path);
        }
    }
}