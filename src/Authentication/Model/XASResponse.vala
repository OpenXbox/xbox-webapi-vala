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
    public class XASResponse : Object {
        public string Token {get; set;}
        public DateTime IssueInstant {get; set;}
        public DateTime NotAfter { get; set; }
        public HashTable<string, Array<XboxUserInformation>> DisplayClaims {get; set;}

        public XASResponse.from_json (string json) throws Error {
            var parser = new Json.Parser ();
            parser.load_from_data (json);
            var root_object = parser.get_root ().get_object ();

            Token = root_object.get_string_member ("Token");

            string issue_instant_str = root_object.get_string_member ("IssueInstant");
            IssueInstant = new DateTime.from_iso8601 (issue_instant_str, new TimeZone.utc ());

            string not_after_str = root_object.get_string_member ("NotAfter");
            NotAfter = new DateTime.from_iso8601 (not_after_str, new TimeZone.utc ());

            DisplayClaims = new HashTable<string, Array<XboxUserInformation>> (str_hash, str_equal);

            root_object.get_object_member("DisplayClaims")
                .foreach_member((object, name, node) => {
                    var user_informations = new Array<XboxUserInformation>  ();

                    XboxUserInformation user_information = new XboxUserInformation();
                    user_information.user_hash = node.get_array()
                        .get_element(0)
                        .get_object()
                        .get_string_member ("uhs");

                    user_informations.append_val(user_information);

                    DisplayClaims.insert(name, user_informations);
                });
        }

        public string to_string() {
            StringBuilder sb = new StringBuilder();
            sb.append_printf ("%s {\n", this.get_type().name());
            sb.append_printf ("\ttoken=%s,\n", Token);
            sb.append_printf ("\tissue_instant=%s,\n", IssueInstant.to_string ());
            sb.append_printf ("\tnot_after=%s,\n", NotAfter.to_string ());
            sb.append ("\tdisplay_claims = {\n");

            DisplayClaims.foreach((k,v) => {
                sb.append_printf ("\t\t%s = {\n", k);
                for (int i = 0; i < v.length; i++) {
                    sb.append_printf("\t\t\t%s\n", v.index(i).to_string());
                }
                sb.append ("\t\t}\n");
            });

            sb.append ("\t}\n")
                .append ("}\n");

            return sb.str;
        }
    }
}
