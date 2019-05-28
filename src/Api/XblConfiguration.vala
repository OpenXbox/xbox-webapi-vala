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
using XboxWebApi.Authentication.Token;

namespace XboxWebApi.Api {
    public class XblConfiguration {
        public XToken xtoken { get; internal set; }
        public XblLanguage locale { get; internal set; }

        public XboxUserInformation user_info {
            get { return xtoken.user_information; }
        }
        public string xbox_user_id {
            get { return user_info.xbox_user_id; }
        }
        public string user_hash {
            get { return user_info.user_hash; }
        }
        public bool token_valid {
            get { return xtoken.is_valid(); }
        }

        public XblConfiguration(XToken xtoken, XblLanguage locale) {
            this.xtoken = xtoken;
            this.locale = locale;
        }

        public string get_authorization_header() {
            return @"XBL3.0 x=$user_hash;$xtoken.jwt";
        }
    }
}