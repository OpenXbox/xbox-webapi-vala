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

namespace XboxWebApi.Api.Services { 
    public class PresenceService : XblService {
        public const string contract_version = "3";

        public PresenceService(XblApiClient client)
        {
            base (client, "https://userpresence.xboxlive.com");
        }

        public Soup.MessageBody GetPresence()
        {
            Soup.Message request = base.create_get_request ("users/me");
            request.request_headers.append ("x-xbl-contract-version", contract_version);
            base.send_message(request);
            return request.response_body;
        }
    }
}