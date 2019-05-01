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

using XboxWebApi.Authentication.Model;

namespace XboxWebApi.Authentication.Token {
    public class BaseAuthToken : Object {
        public string jwt { get; set; }
        public DateTime issued { get; set; }
        public DateTime expires { get; set; }
        public XboxUserInformation user_information { get; set; }

        public bool is_valid () {
            var now = new DateTime.now ();
            return (expires != null && expires.compare (now) >= 0);
        }

        public bool has_user_information () {
            return (user_information != null);
        }

        public string to_string () {
            return "<%s Jwt=%s, Issued=%s, Expires=%s>".printf (
                this.get_type ().name (),
                jwt,
                issued.to_string (),
                expires.to_string ());
        }
    }
}
