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

namespace XboxWebApi.Authentication.WindowsLiveConstants {
    public const string CLIENT_ID = "0000000048093EE3";
    public const string DISPLAY = "touch";
    public const string LOCALE = "en";

    public const string LOGIN_AUTH_RESPONSE_TYPE = "token";
    public const string LOGIN_AUTH_SCOPE = "service::user.auth.xboxlive.com::MBI_SSL";
    public const string LOGIN_AUTHORIZE_PATH = "/oauth20_authorize.srf";
    public const string LOGIN_GRANT_TYPE = "refresh_token";
    public const string LOGIN_REDIRECT_URL = "https://login.live.com/oauth20_desktop.srf";
    public const string LOGIN_REFRESH_TOKEN_PATH = "/oauth20_token.srf";
    public const string LOGIN_SERVICE_URL = "https://login.live.com";

    public const string USER_AUTH_URL = "https://user.auth.xboxlive.com";
    public const string USER_AUTH_AUTHENTICATE_PATH = "/user/authenticate";
}
