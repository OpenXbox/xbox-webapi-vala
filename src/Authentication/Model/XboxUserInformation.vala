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
    public class XboxUserInformation : Object {
        public string age_group { get; set; }
        public string gamertag { get; set; }
        public string privileges { get; set; }
        public string user_settings_restrictions { get; set; }
        public string user_title_restrictions { get; set; }
        public string xbox_user_id { get; set; }
        public string user_hash { get; set; }

        public string to_string () {
            return "%s = { age_group: %s, gamertag: %s, privileges: %s, user_settings_restrictions: %s, user_title_restrictions: %s, xbox_user_id: %s, user_hash: %s  }"
                .printf(
                    this.get_type().name(),
                    age_group,
                    gamertag,
                    privileges,
                    user_settings_restrictions,
                    user_title_restrictions,
                    xbox_user_id,
                    user_hash
                );
        }
    }
}
