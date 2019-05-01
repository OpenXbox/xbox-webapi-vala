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
        public string age_group;
        public string gamertag;
        public string privileges;
        public string user_settings_restrictions;
        public string user_title_restrictions;
        public ulong xbox_user_id;
        public string user_hash;

        public string to_string () {
            StringBuilder sb = new StringBuilder ();
            sb.append_printf ("Gamertag: %s\n", gamertag);
            sb.append_printf ("Xbox User Id: %s\n", xbox_user_id.to_string ());
            sb.append_printf ("Userhash: %s\n", user_hash);
            sb.append_printf ("Privileges: %s\n", privileges);
            sb.append_printf ("User System Restrictions: %s\n", user_settings_restrictions);
            sb.append_printf ("User Title Restrictions: %s\n", user_title_restrictions);
            return sb.str;
        }
    }
}
