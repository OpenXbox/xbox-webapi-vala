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
    public class XblLanguage {
        /**
         * Human readable representation of the language
         * @return Language name (e.g. "Unites States")
         */
        public string name { get; internal set; }
        /**
         * Short identifier of the language
         * @return Short identifier (e.g. "Unites States")
         */
        public string short_id { get; internal set; }
        /**
         * Identifier of the language
         * @return Identifier (e.g. "Unites States")
         */
        public string identifier { get; internal set; }
        /**
         * Locale string of the language
         * @return Locale (e.g. "Unites States")
         */
        public string locale { get; internal set; }

        public XblLanguage (string name,
                            string short_id,
                            string identifier,
                            string locale) {
            this.name = name;
            this.short_id = short_id;
            this.identifier = identifier;
            this.locale = locale;
        }

        public static XblLanguage Argentina = new XblLanguage ("Argentina", "AR", "es_AR", "es-AR");
        public static XblLanguage Australia = new XblLanguage ("Australia", "AU", "en_AU", "en-AU");
        public static XblLanguage Austria = new XblLanguage ("Austria", "AT", "de_AT", "de-AT");
        public static XblLanguage Belgium = new XblLanguage ("Belgium", "BE", "fr_BE", "fr-BE");
        public static XblLanguage Belgium_NL = new XblLanguage ("Belgium (NL);", "NL", "nl_BE", "nl-BE");
        public static XblLanguage Brazil = new XblLanguage ("Brazil", "BR", "pt_BR", "pt-BR");
        public static XblLanguage Canada = new XblLanguage ("Canada", "CA", "en_CA", "en-CA");
        public static XblLanguage Canada_FR = new XblLanguage ("Canada (FR);", "CA", "fr_CA", "fr-CA");
        public static XblLanguage Czech_Republic = new XblLanguage ("Czech Republic", "CZ", "en_CZ", "en-CZ");
        public static XblLanguage Denmark = new XblLanguage ("Denmark", "DK", "da_DK", "da-DK");
        public static XblLanguage Finland = new XblLanguage ("Finland", "FI", "fi_FI", "fi-FI");
        public static XblLanguage France = new XblLanguage ("France", "FR", "fr_FR", "fr-FR");
        public static XblLanguage Germany = new XblLanguage ("Germany", "DE", "de_DE", "de-DE");
        public static XblLanguage Greece = new XblLanguage ("Greece", "GR", "en_GR", "en-GR");
        public static XblLanguage Hong_Kong = new XblLanguage ("Hong Kong", "HK", "en_HK", "en-HK");
        public static XblLanguage Hungary = new XblLanguage ("Hungary", "HU", "en_HU", "en-HU");
        public static XblLanguage India = new XblLanguage ("India", "IN", "en_IN", "en-IN");
        public static XblLanguage Great_Britain = new XblLanguage ("Great Britain", "GB", "en_GB", "en-GB");
        public static XblLanguage Israel = new XblLanguage ("Israel", "IL", "en_IL", "en-IL");
        public static XblLanguage Italy = new XblLanguage ("Italy", "IT", "it_IT", "it-IT");
        public static XblLanguage Japan = new XblLanguage ("Japan", "JP", "ja_JP", "ja-JP");
        public static XblLanguage Mexico = new XblLanguage ("Mexico", "MX", "es_MX", "es-MX");
        public static XblLanguage Chile = new XblLanguage ("Chile", "CL", "es_CL", "es-CL");
        public static XblLanguage Colombia = new XblLanguage ("Colombia", "CO", "es_CO", "es-CO");
        public static XblLanguage Netherlands = new XblLanguage ("Netherlands", "NL", "nl_NL", "nl-NL");
        public static XblLanguage New_Zealand = new XblLanguage ("New Zealand", "NZ", "en_NZ", "en-NZ");
        public static XblLanguage Norway = new XblLanguage ("Norway", "NO", "nb_NO", "nb-NO");
        public static XblLanguage Poland = new XblLanguage ("Poland", "PL", "pl_PL", "pl-PL");
        public static XblLanguage Portugal = new XblLanguage ("Portugal", "PT", "pt_PT", "pt-PT");
        public static XblLanguage Russia = new XblLanguage ("Russia", "RU", "ru_RU", "ru-RU");
        public static XblLanguage Saudi_Arabia = new XblLanguage ("Saudi Arabia", "SA", "en_SA", "en-SA");
        public static XblLanguage Singapore = new XblLanguage ("Singapore", "SG", "en_SG", "en-SG");
        public static XblLanguage Slovakia = new XblLanguage ("Slovakia", "SK", "en_SK", "en-SK");
        public static XblLanguage South_Africa = new XblLanguage ("South Afrida", "ZA", "en_ZA", "en-ZA");
        public static XblLanguage Korea = new XblLanguage ("Korea", "KR", "ko_KR", "ko-KR");
        public static XblLanguage Spain = new XblLanguage ("Spain", "ES", "es_ES", "es-ES");
        public static XblLanguage Switzerland = new XblLanguage ("Switzerland", "CH", "de_CH", "de-CH");
        public static XblLanguage Switzerland_FR = new XblLanguage ("Switzerland (FR);", "CH", "fr_CH", "fr-CH");
        public static XblLanguage United_Arab_Emirates = new XblLanguage ("United Arab Emirates", "AE", "en_AE", "en-AE");
        public static XblLanguage United_States = new XblLanguage ("United States", "US", "en_US", "en-US");
        public static XblLanguage Ireland = new XblLanguage ("Ireland", "IE", "en_IE", "en-IE");
    }
}