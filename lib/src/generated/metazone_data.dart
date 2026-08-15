// GENERATED FILE — DO NOT EDIT.
//
// Produced by tool/generate_metazone_data.dart from Unicode CLDR 48.
//
// Derived English metazone display names from Unicode CLDR. Licensed
// under Unicode License v3, not the MIT licence of this package's
// source. See THIRD_PARTY_LICENSES at the package root.
//
// Metazones with no long daylight name: 74.
// Metazone ids in history but not localized in en-001: 31.
library;

/// CLDR release used for English time-zone long names.
const String cldrVersion = '48';

/// CLDR long names: generic, standard, and daylight.
class MetazoneLongNames {
  const MetazoneLongNames({this.generic, this.standard, this.daylight});

  final String? generic;
  final String? standard;
  final String? daylight;
}

/// Metazone membership interval.
class MetazoneRange {
  const MetazoneRange({required this.metazoneId, this.start, this.end});

  final String metazoneId;

  /// Inclusive start as milliseconds since the Unix epoch, or null for −∞.
  final int? start;

  /// Exclusive end as milliseconds since the Unix epoch, or null for +∞.
  final int? end;
}

/// IANA id → CLDR zone key when they differ (BCP-47 alias head).
const Map<String, String> ianaToCldrZoneKey = <String, String>{
  "Africa/Asmara": "Africa/Asmera",
  "Africa/Timbuktu": "Africa/Bamako",
  "America/Argentina/Buenos_Aires": "America/Buenos_Aires",
  "America/Argentina/Catamarca": "America/Catamarca",
  "America/Argentina/ComodRivadavia": "America/Catamarca",
  "America/Argentina/Cordoba": "America/Cordoba",
  "America/Argentina/Jujuy": "America/Jujuy",
  "America/Argentina/Mendoza": "America/Mendoza",
  "America/Atikokan": "America/Coral_Harbour",
  "America/Atka": "America/Adak",
  "America/Ensenada": "America/Tijuana",
  "America/Fort_Wayne": "America/Indianapolis",
  "America/Indiana/Indianapolis": "America/Indianapolis",
  "America/Kentucky/Louisville": "America/Louisville",
  "America/Knox_IN": "America/Indiana/Knox",
  "America/Montreal": "America/Toronto",
  "America/Nipigon": "America/Toronto",
  "America/Nuuk": "America/Godthab",
  "America/Pangnirtung": "America/Iqaluit",
  "America/Porto_Acre": "America/Rio_Branco",
  "America/Rainy_River": "America/Winnipeg",
  "America/Rosario": "America/Cordoba",
  "America/Santa_Isabel": "America/Tijuana",
  "America/Shiprock": "America/Denver",
  "America/Thunder_Bay": "America/Toronto",
  "America/Virgin": "America/St_Thomas",
  "America/Yellowknife": "America/Edmonton",
  "Antarctica/South_Pole": "Antarctica/McMurdo",
  "Asia/Ashkhabad": "Asia/Ashgabat",
  "Asia/Choibalsan": "Asia/Ulaanbaatar",
  "Asia/Chongqing": "Asia/Shanghai",
  "Asia/Chungking": "Asia/Shanghai",
  "Asia/Dacca": "Asia/Dhaka",
  "Asia/Harbin": "Asia/Shanghai",
  "Asia/Ho_Chi_Minh": "Asia/Saigon",
  "Asia/Istanbul": "Europe/Istanbul",
  "Asia/Kashgar": "Asia/Urumqi",
  "Asia/Kathmandu": "Asia/Katmandu",
  "Asia/Kolkata": "Asia/Calcutta",
  "Asia/Macao": "Asia/Macau",
  "Asia/Tel_Aviv": "Asia/Jerusalem",
  "Asia/Thimbu": "Asia/Thimphu",
  "Asia/Ujung_Pandang": "Asia/Makassar",
  "Asia/Ulan_Bator": "Asia/Ulaanbaatar",
  "Asia/Yangon": "Asia/Rangoon",
  "Atlantic/Faroe": "Atlantic/Faeroe",
  "Atlantic/Jan_Mayen": "Arctic/Longyearbyen",
  "Australia/ACT": "Australia/Sydney",
  "Australia/Canberra": "Australia/Sydney",
  "Australia/Currie": "Australia/Hobart",
  "Australia/LHI": "Australia/Lord_Howe",
  "Australia/NSW": "Australia/Sydney",
  "Australia/North": "Australia/Darwin",
  "Australia/Queensland": "Australia/Brisbane",
  "Australia/South": "Australia/Adelaide",
  "Australia/Tasmania": "Australia/Hobart",
  "Australia/Victoria": "Australia/Melbourne",
  "Australia/West": "Australia/Perth",
  "Australia/Yancowinna": "Australia/Broken_Hill",
  "Brazil/Acre": "America/Rio_Branco",
  "Brazil/DeNoronha": "America/Noronha",
  "Brazil/East": "America/Sao_Paulo",
  "Brazil/West": "America/Manaus",
  "CET": "Europe/Brussels",
  "CST6CDT": "America/Chicago",
  "Canada/Atlantic": "America/Halifax",
  "Canada/Central": "America/Winnipeg",
  "Canada/East-Saskatchewan": "America/Regina",
  "Canada/Eastern": "America/Toronto",
  "Canada/Mountain": "America/Edmonton",
  "Canada/Newfoundland": "America/St_Johns",
  "Canada/Pacific": "America/Vancouver",
  "Canada/Saskatchewan": "America/Regina",
  "Canada/Yukon": "America/Whitehorse",
  "Chile/Continental": "America/Santiago",
  "Chile/EasterIsland": "Pacific/Easter",
  "Cuba": "America/Havana",
  "EET": "Europe/Athens",
  "EST": "America/Panama",
  "EST5EDT": "America/New_York",
  "Egypt": "Africa/Cairo",
  "Eire": "Europe/Dublin",
  "Etc/GMT+0": "Etc/GMT",
  "Etc/GMT-0": "Etc/GMT",
  "Etc/GMT0": "Etc/GMT",
  "Etc/Greenwich": "Etc/GMT",
  "Etc/UCT": "Etc/UTC",
  "Etc/Universal": "Etc/UTC",
  "Etc/Zulu": "Etc/UTC",
  "Europe/Belfast": "Europe/London",
  "Europe/Kyiv": "Europe/Kiev",
  "Europe/Nicosia": "Asia/Nicosia",
  "Europe/Tiraspol": "Europe/Chisinau",
  "Europe/Uzhgorod": "Europe/Kiev",
  "Europe/Zaporozhye": "Europe/Kiev",
  "Factory": "Etc/Unknown",
  "GB": "Europe/London",
  "GB-Eire": "Europe/London",
  "GMT": "Etc/GMT",
  "GMT+0": "Etc/GMT",
  "GMT-0": "Etc/GMT",
  "GMT0": "Etc/GMT",
  "Greenwich": "Etc/GMT",
  "HST": "Pacific/Honolulu",
  "Hongkong": "Asia/Hong_Kong",
  "Iceland": "Atlantic/Reykjavik",
  "Iran": "Asia/Tehran",
  "Israel": "Asia/Jerusalem",
  "Jamaica": "America/Jamaica",
  "Japan": "Asia/Tokyo",
  "Kwajalein": "Pacific/Kwajalein",
  "Libya": "Africa/Tripoli",
  "MET": "Europe/Brussels",
  "MST": "America/Phoenix",
  "MST7MDT": "America/Denver",
  "Mexico/BajaNorte": "America/Tijuana",
  "Mexico/BajaSur": "America/Mazatlan",
  "Mexico/General": "America/Mexico_City",
  "NZ": "Pacific/Auckland",
  "NZ-CHAT": "Pacific/Chatham",
  "Navajo": "America/Denver",
  "PRC": "Asia/Shanghai",
  "PST8PDT": "America/Los_Angeles",
  "Pacific/Chuuk": "Pacific/Truk",
  "Pacific/Johnston": "Pacific/Honolulu",
  "Pacific/Kanton": "Pacific/Enderbury",
  "Pacific/Pohnpei": "Pacific/Ponape",
  "Pacific/Samoa": "Pacific/Pago_Pago",
  "Pacific/Yap": "Pacific/Truk",
  "Poland": "Europe/Warsaw",
  "Portugal": "Europe/Lisbon",
  "ROC": "Asia/Taipei",
  "ROK": "Asia/Seoul",
  "Singapore": "Asia/Singapore",
  "Turkey": "Europe/Istanbul",
  "UCT": "Etc/UTC",
  "US/Alaska": "America/Anchorage",
  "US/Aleutian": "America/Adak",
  "US/Arizona": "America/Phoenix",
  "US/Central": "America/Chicago",
  "US/East-Indiana": "America/Indianapolis",
  "US/Eastern": "America/New_York",
  "US/Hawaii": "Pacific/Honolulu",
  "US/Indiana-Starke": "America/Indiana/Knox",
  "US/Michigan": "America/Detroit",
  "US/Mountain": "America/Denver",
  "US/Pacific": "America/Los_Angeles",
  "US/Pacific-New": "America/Los_Angeles",
  "US/Samoa": "Pacific/Pago_Pago",
  "UTC": "Etc/UTC",
  "Universal": "Etc/UTC",
  "W-SU": "Europe/Moscow",
  "WET": "Europe/Lisbon",
  "Zulu": "Etc/UTC",
};

/// Metazone id → en-001 long names.
const Map<String, MetazoneLongNames> metazoneLongNames =
    <String, MetazoneLongNames>{
      "Acre": MetazoneLongNames(
        generic: "Acre Time",
        standard: "Acre Standard Time",
        daylight: "Acre Summer Time",
      ),
      "Afghanistan": MetazoneLongNames(
        generic: null,
        standard: "Afghanistan Time",
        daylight: null,
      ),
      "Africa_Central": MetazoneLongNames(
        generic: null,
        standard: "Central Africa Time",
        daylight: null,
      ),
      "Africa_Eastern": MetazoneLongNames(
        generic: null,
        standard: "East Africa Time",
        daylight: null,
      ),
      "Africa_Southern": MetazoneLongNames(
        generic: null,
        standard: "South Africa Standard Time",
        daylight: null,
      ),
      "Africa_Western": MetazoneLongNames(
        generic: null,
        standard: "West Africa Time",
        daylight: null,
      ),
      "Alaska": MetazoneLongNames(
        generic: "Alaska Time",
        standard: "Alaska Standard Time",
        daylight: "Alaska Daylight Time",
      ),
      "Almaty": MetazoneLongNames(
        generic: "Almaty Time",
        standard: "Almaty Standard Time",
        daylight: "Almaty Summer Time",
      ),
      "Amazon": MetazoneLongNames(
        generic: "Amazon Time",
        standard: "Amazon Standard Time",
        daylight: "Amazon Summer Time",
      ),
      "America_Central": MetazoneLongNames(
        generic: "Central Time",
        standard: "Central Standard Time",
        daylight: "Central Daylight Time",
      ),
      "America_Eastern": MetazoneLongNames(
        generic: "Eastern Time",
        standard: "Eastern Standard Time",
        daylight: "Eastern Daylight Time",
      ),
      "America_Mountain": MetazoneLongNames(
        generic: "Mountain Time",
        standard: "Mountain Standard Time",
        daylight: "Mountain Daylight Time",
      ),
      "America_Pacific": MetazoneLongNames(
        generic: "Pacific Time",
        standard: "Pacific Standard Time",
        daylight: "Pacific Daylight Time",
      ),
      "Anadyr": MetazoneLongNames(
        generic: "Anadyr Time",
        standard: "Anadyr Standard Time",
        daylight: "Anadyr Summer Time",
      ),
      "Apia": MetazoneLongNames(
        generic: "Samoa Time",
        standard: "Samoa Standard Time",
        daylight: "Samoa Daylight Time",
      ),
      "Aqtau": MetazoneLongNames(
        generic: "Aqtau Time",
        standard: "Aqtau Standard Time",
        daylight: "Aqtau Summer Time",
      ),
      "Aqtobe": MetazoneLongNames(
        generic: "Aqtobe Time",
        standard: "Aqtobe Standard Time",
        daylight: "Aqtobe Summer Time",
      ),
      "Arabian": MetazoneLongNames(
        generic: "Arabian Time",
        standard: "Arabian Standard Time",
        daylight: "Arabian Daylight Time",
      ),
      "Argentina": MetazoneLongNames(
        generic: "Argentina Time",
        standard: "Argentina Standard Time",
        daylight: "Argentina Summer Time",
      ),
      "Argentina_Western": MetazoneLongNames(
        generic: "Western Argentina Time",
        standard: "Western Argentina Standard Time",
        daylight: "Western Argentina Summer Time",
      ),
      "Armenia": MetazoneLongNames(
        generic: "Armenia Time",
        standard: "Armenia Standard Time",
        daylight: "Armenia Summer Time",
      ),
      "Atlantic": MetazoneLongNames(
        generic: "Atlantic Time",
        standard: "Atlantic Standard Time",
        daylight: "Atlantic Daylight Time",
      ),
      "Australia_Central": MetazoneLongNames(
        generic: "Australian Central Time",
        standard: "Australian Central Standard Time",
        daylight: "Australian Central Daylight Time",
      ),
      "Australia_CentralWestern": MetazoneLongNames(
        generic: "Australian Central Western Time",
        standard: "Australian Central Western Standard Time",
        daylight: "Australian Central Western Daylight Time",
      ),
      "Australia_Eastern": MetazoneLongNames(
        generic: "Australian Eastern Time",
        standard: "Australian Eastern Standard Time",
        daylight: "Australian Eastern Daylight Time",
      ),
      "Australia_Western": MetazoneLongNames(
        generic: "Australian Western Time",
        standard: "Australian Western Standard Time",
        daylight: "Australian Western Daylight Time",
      ),
      "Azerbaijan": MetazoneLongNames(
        generic: "Azerbaijan Time",
        standard: "Azerbaijan Standard Time",
        daylight: "Azerbaijan Summer Time",
      ),
      "Azores": MetazoneLongNames(
        generic: "Azores Time",
        standard: "Azores Standard Time",
        daylight: "Azores Summer Time",
      ),
      "Bangladesh": MetazoneLongNames(
        generic: "Bangladesh Time",
        standard: "Bangladesh Standard Time",
        daylight: "Bangladesh Summer Time",
      ),
      "Bhutan": MetazoneLongNames(
        generic: null,
        standard: "Bhutan Time",
        daylight: null,
      ),
      "Bolivia": MetazoneLongNames(
        generic: null,
        standard: "Bolivia Time",
        daylight: null,
      ),
      "Brasilia": MetazoneLongNames(
        generic: "Brasilia Time",
        standard: "Brasilia Standard Time",
        daylight: "Brasilia Summer Time",
      ),
      "Brunei": MetazoneLongNames(
        generic: null,
        standard: "Brunei Time",
        daylight: null,
      ),
      "Cape_Verde": MetazoneLongNames(
        generic: "Cape Verde Time",
        standard: "Cape Verde Standard Time",
        daylight: "Cape Verde Summer Time",
      ),
      "Casey": MetazoneLongNames(
        generic: null,
        standard: "Casey Time",
        daylight: null,
      ),
      "Chamorro": MetazoneLongNames(
        generic: null,
        standard: "Chamorro Standard Time",
        daylight: null,
      ),
      "Chatham": MetazoneLongNames(
        generic: "Chatham Time",
        standard: "Chatham Standard Time",
        daylight: "Chatham Daylight Time",
      ),
      "Chile": MetazoneLongNames(
        generic: "Chile Time",
        standard: "Chile Standard Time",
        daylight: "Chile Summer Time",
      ),
      "China": MetazoneLongNames(
        generic: "China Time",
        standard: "China Standard Time",
        daylight: "China Daylight Time",
      ),
      "Christmas": MetazoneLongNames(
        generic: null,
        standard: "Christmas Island Time",
        daylight: null,
      ),
      "Cocos": MetazoneLongNames(
        generic: null,
        standard: "Cocos Islands Time",
        daylight: null,
      ),
      "Colombia": MetazoneLongNames(
        generic: "Colombia Time",
        standard: "Colombia Standard Time",
        daylight: "Colombia Summer Time",
      ),
      "Cook": MetazoneLongNames(
        generic: "Cook Islands Time",
        standard: "Cook Islands Standard Time",
        daylight: "Cook Islands Summer Time",
      ),
      "Cuba": MetazoneLongNames(
        generic: "Cuba Time",
        standard: "Cuba Standard Time",
        daylight: "Cuba Daylight Time",
      ),
      "Davis": MetazoneLongNames(
        generic: null,
        standard: "Davis Time",
        daylight: null,
      ),
      "DumontDUrville": MetazoneLongNames(
        generic: null,
        standard: "Dumont d’Urville Time",
        daylight: null,
      ),
      "East_Timor": MetazoneLongNames(
        generic: null,
        standard: "Timor-Leste Time",
        daylight: null,
      ),
      "Easter": MetazoneLongNames(
        generic: "Easter Island Time",
        standard: "Easter Island Standard Time",
        daylight: "Easter Island Summer Time",
      ),
      "Ecuador": MetazoneLongNames(
        generic: null,
        standard: "Ecuador Time",
        daylight: null,
      ),
      "Europe_Central": MetazoneLongNames(
        generic: "Central European Time",
        standard: "Central European Standard Time",
        daylight: "Central European Summer Time",
      ),
      "Europe_Eastern": MetazoneLongNames(
        generic: "Eastern European Time",
        standard: "Eastern European Standard Time",
        daylight: "Eastern European Summer Time",
      ),
      "Europe_Further_Eastern": MetazoneLongNames(
        generic: null,
        standard: "Further-eastern European Time",
        daylight: null,
      ),
      "Europe_Western": MetazoneLongNames(
        generic: "Western European Time",
        standard: "Western European Standard Time",
        daylight: "Western European Summer Time",
      ),
      "Falkland": MetazoneLongNames(
        generic: "Falkland Islands Time",
        standard: "Falkland Islands Standard Time",
        daylight: "Falkland Islands Summer Time",
      ),
      "Fiji": MetazoneLongNames(
        generic: "Fiji Time",
        standard: "Fiji Standard Time",
        daylight: "Fiji Summer Time",
      ),
      "French_Guiana": MetazoneLongNames(
        generic: null,
        standard: "French Guiana Time",
        daylight: null,
      ),
      "French_Southern": MetazoneLongNames(
        generic: null,
        standard: "French Southern & Antarctic Time",
        daylight: null,
      ),
      "GMT": MetazoneLongNames(
        generic: null,
        standard: "Greenwich Mean Time",
        daylight: null,
      ),
      "Galapagos": MetazoneLongNames(
        generic: null,
        standard: "Galapagos Time",
        daylight: null,
      ),
      "Gambier": MetazoneLongNames(
        generic: null,
        standard: "Gambier Time",
        daylight: null,
      ),
      "Georgia": MetazoneLongNames(
        generic: "Georgia Time",
        standard: "Georgia Standard Time",
        daylight: "Georgia Summer Time",
      ),
      "Gilbert_Islands": MetazoneLongNames(
        generic: null,
        standard: "Gilbert Islands Time",
        daylight: null,
      ),
      "Greenland": MetazoneLongNames(
        generic: "Greenland Time",
        standard: "Greenland Standard Time",
        daylight: "Greenland Summer Time",
      ),
      "Greenland_Eastern": MetazoneLongNames(
        generic: "East Greenland Time",
        standard: "East Greenland Standard Time",
        daylight: "East Greenland Summer Time",
      ),
      "Greenland_Western": MetazoneLongNames(
        generic: "West Greenland Time",
        standard: "West Greenland Standard Time",
        daylight: "West Greenland Summer Time",
      ),
      "Guam": MetazoneLongNames(
        generic: null,
        standard: "Guam Standard Time",
        daylight: null,
      ),
      "Gulf": MetazoneLongNames(
        generic: null,
        standard: "Gulf Standard Time",
        daylight: null,
      ),
      "Guyana": MetazoneLongNames(
        generic: null,
        standard: "Guyana Time",
        daylight: null,
      ),
      "Hawaii": MetazoneLongNames(
        generic: null,
        standard: "Hawaii-Aleutian Standard Time",
        daylight: null,
      ),
      "Hawaii_Aleutian": MetazoneLongNames(
        generic: "Hawaii-Aleutian Time",
        standard: "Hawaii-Aleutian Standard Time",
        daylight: "Hawaii-Aleutian Daylight Time",
      ),
      "Hong_Kong": MetazoneLongNames(
        generic: "Hong Kong Time",
        standard: "Hong Kong Standard Time",
        daylight: "Hong Kong Summer Time",
      ),
      "Hovd": MetazoneLongNames(
        generic: "Khovd Time",
        standard: "Khovd Standard Time",
        daylight: "Khovd Summer Time",
      ),
      "India": MetazoneLongNames(
        generic: null,
        standard: "India Standard Time",
        daylight: null,
      ),
      "Indian_Ocean": MetazoneLongNames(
        generic: null,
        standard: "Indian Ocean Time",
        daylight: null,
      ),
      "Indochina": MetazoneLongNames(
        generic: null,
        standard: "Indochina Time",
        daylight: null,
      ),
      "Indonesia_Central": MetazoneLongNames(
        generic: null,
        standard: "Central Indonesia Time",
        daylight: null,
      ),
      "Indonesia_Eastern": MetazoneLongNames(
        generic: null,
        standard: "Eastern Indonesia Time",
        daylight: null,
      ),
      "Indonesia_Western": MetazoneLongNames(
        generic: null,
        standard: "Western Indonesia Time",
        daylight: null,
      ),
      "Iran": MetazoneLongNames(
        generic: "Iran Time",
        standard: "Iran Standard Time",
        daylight: "Iran Daylight Time",
      ),
      "Irkutsk": MetazoneLongNames(
        generic: "Irkutsk Time",
        standard: "Irkutsk Standard Time",
        daylight: "Irkutsk Summer Time",
      ),
      "Israel": MetazoneLongNames(
        generic: "Israel Time",
        standard: "Israel Standard Time",
        daylight: "Israel Daylight Time",
      ),
      "Japan": MetazoneLongNames(
        generic: "Japan Time",
        standard: "Japan Standard Time",
        daylight: "Japan Daylight Time",
      ),
      "Kamchatka": MetazoneLongNames(
        generic: "Kamchatka Time",
        standard: "Kamchatka Standard Time",
        daylight: "Kamchatka Summer Time",
      ),
      "Kazakhstan": MetazoneLongNames(
        generic: null,
        standard: "Kazakhstan Time",
        daylight: null,
      ),
      "Kazakhstan_Eastern": MetazoneLongNames(
        generic: null,
        standard: "East Kazakhstan Time",
        daylight: null,
      ),
      "Kazakhstan_Western": MetazoneLongNames(
        generic: null,
        standard: "West Kazakhstan Time",
        daylight: null,
      ),
      "Korea": MetazoneLongNames(
        generic: "Korean Time",
        standard: "Korean Standard Time",
        daylight: "Korean Daylight Time",
      ),
      "Kosrae": MetazoneLongNames(
        generic: null,
        standard: "Kosrae Time",
        daylight: null,
      ),
      "Krasnoyarsk": MetazoneLongNames(
        generic: "Krasnoyarsk Time",
        standard: "Krasnoyarsk Standard Time",
        daylight: "Krasnoyarsk Summer Time",
      ),
      "Kyrgystan": MetazoneLongNames(
        generic: null,
        standard: "Kyrgyzstan Time",
        daylight: null,
      ),
      "Lanka": MetazoneLongNames(
        generic: null,
        standard: "Lanka Time",
        daylight: null,
      ),
      "Line_Islands": MetazoneLongNames(
        generic: null,
        standard: "Line Islands Time",
        daylight: null,
      ),
      "Lord_Howe": MetazoneLongNames(
        generic: "Lord Howe Time",
        standard: "Lord Howe Standard Time",
        daylight: "Lord Howe Daylight Time",
      ),
      "Macau": MetazoneLongNames(
        generic: "Macao Time",
        standard: "Macao Standard Time",
        daylight: "Macao Summer Time",
      ),
      "Magadan": MetazoneLongNames(
        generic: "Magadan Time",
        standard: "Magadan Standard Time",
        daylight: "Magadan Summer Time",
      ),
      "Malaysia": MetazoneLongNames(
        generic: null,
        standard: "Malaysia Time",
        daylight: null,
      ),
      "Maldives": MetazoneLongNames(
        generic: null,
        standard: "Maldives Time",
        daylight: null,
      ),
      "Marquesas": MetazoneLongNames(
        generic: null,
        standard: "Marquesas Time",
        daylight: null,
      ),
      "Marshall_Islands": MetazoneLongNames(
        generic: null,
        standard: "Marshall Islands Time",
        daylight: null,
      ),
      "Mauritius": MetazoneLongNames(
        generic: "Mauritius Time",
        standard: "Mauritius Standard Time",
        daylight: "Mauritius Summer Time",
      ),
      "Mawson": MetazoneLongNames(
        generic: null,
        standard: "Mawson Time",
        daylight: null,
      ),
      "Mexico_Pacific": MetazoneLongNames(
        generic: "Mexican Pacific Time",
        standard: "Mexican Pacific Standard Time",
        daylight: "Mexican Pacific Daylight Time",
      ),
      "Mongolia": MetazoneLongNames(
        generic: "Ulaanbaatar Time",
        standard: "Ulaanbaatar Standard Time",
        daylight: "Ulaanbaatar Summer Time",
      ),
      "Moscow": MetazoneLongNames(
        generic: "Moscow Time",
        standard: "Moscow Standard Time",
        daylight: "Moscow Summer Time",
      ),
      "Myanmar": MetazoneLongNames(
        generic: null,
        standard: "Myanmar Time",
        daylight: null,
      ),
      "Nauru": MetazoneLongNames(
        generic: null,
        standard: "Nauru Time",
        daylight: null,
      ),
      "Nepal": MetazoneLongNames(
        generic: null,
        standard: "Nepal Time",
        daylight: null,
      ),
      "New_Caledonia": MetazoneLongNames(
        generic: "New Caledonia Time",
        standard: "New Caledonia Standard Time",
        daylight: "New Caledonia Summer Time",
      ),
      "New_Zealand": MetazoneLongNames(
        generic: "New Zealand Time",
        standard: "New Zealand Standard Time",
        daylight: "New Zealand Daylight Time",
      ),
      "Newfoundland": MetazoneLongNames(
        generic: "Newfoundland Time",
        standard: "Newfoundland Standard Time",
        daylight: "Newfoundland Daylight Time",
      ),
      "Niue": MetazoneLongNames(
        generic: null,
        standard: "Niue Time",
        daylight: null,
      ),
      "Norfolk": MetazoneLongNames(
        generic: "Norfolk Island Time",
        standard: "Norfolk Island Standard Time",
        daylight: "Norfolk Island Daylight Time",
      ),
      "Noronha": MetazoneLongNames(
        generic: "Fernando de Noronha Time",
        standard: "Fernando de Noronha Standard Time",
        daylight: "Fernando de Noronha Summer Time",
      ),
      "North_Mariana": MetazoneLongNames(
        generic: null,
        standard: "Northern Mariana Islands Time",
        daylight: null,
      ),
      "Novosibirsk": MetazoneLongNames(
        generic: "Novosibirsk Time",
        standard: "Novosibirsk Standard Time",
        daylight: "Novosibirsk Summer Time",
      ),
      "Omsk": MetazoneLongNames(
        generic: "Omsk Time",
        standard: "Omsk Standard Time",
        daylight: "Omsk Summer Time",
      ),
      "Pakistan": MetazoneLongNames(
        generic: "Pakistan Time",
        standard: "Pakistan Standard Time",
        daylight: "Pakistan Summer Time",
      ),
      "Palau": MetazoneLongNames(
        generic: null,
        standard: "Palau Time",
        daylight: null,
      ),
      "Papua_New_Guinea": MetazoneLongNames(
        generic: null,
        standard: "Papua New Guinea Time",
        daylight: null,
      ),
      "Paraguay": MetazoneLongNames(
        generic: "Paraguay Time",
        standard: "Paraguay Standard Time",
        daylight: "Paraguay Summer Time",
      ),
      "Peru": MetazoneLongNames(
        generic: "Peru Time",
        standard: "Peru Standard Time",
        daylight: "Peru Summer Time",
      ),
      "Philippines": MetazoneLongNames(
        generic: "Philippine Time",
        standard: "Philippine Standard Time",
        daylight: "Philippine Summer Time",
      ),
      "Phoenix_Islands": MetazoneLongNames(
        generic: null,
        standard: "Phoenix Islands Time",
        daylight: null,
      ),
      "Pierre_Miquelon": MetazoneLongNames(
        generic: "St Pierre & Miquelon Time",
        standard: "St Pierre & Miquelon Standard Time",
        daylight: "St Pierre & Miquelon Daylight Time",
      ),
      "Pitcairn": MetazoneLongNames(
        generic: null,
        standard: "Pitcairn Time",
        daylight: null,
      ),
      "Ponape": MetazoneLongNames(
        generic: null,
        standard: "Pohnpei Time",
        daylight: null,
      ),
      "Pyongyang": MetazoneLongNames(
        generic: null,
        standard: "North Korea Time",
        daylight: null,
      ),
      "Qyzylorda": MetazoneLongNames(
        generic: "Kyzylorda Time",
        standard: "Kyzylorda Standard Time",
        daylight: "Kyzylorda Summer Time",
      ),
      "Reunion": MetazoneLongNames(
        generic: null,
        standard: "Réunion Time",
        daylight: null,
      ),
      "Rothera": MetazoneLongNames(
        generic: null,
        standard: "Rothera Time",
        daylight: null,
      ),
      "Sakhalin": MetazoneLongNames(
        generic: "Sakhalin Time",
        standard: "Sakhalin Standard Time",
        daylight: "Sakhalin Summer Time",
      ),
      "Samara": MetazoneLongNames(
        generic: "Samara Time",
        standard: "Samara Standard Time",
        daylight: "Samara Summer Time",
      ),
      "Samoa": MetazoneLongNames(
        generic: "American Samoa Time",
        standard: "American Samoa Standard Time",
        daylight: "American Samoa Daylight Time",
      ),
      "Seychelles": MetazoneLongNames(
        generic: null,
        standard: "Seychelles Time",
        daylight: null,
      ),
      "Singapore": MetazoneLongNames(
        generic: null,
        standard: "Singapore Standard Time",
        daylight: null,
      ),
      "Solomon": MetazoneLongNames(
        generic: null,
        standard: "Solomon Islands Time",
        daylight: null,
      ),
      "South_Georgia": MetazoneLongNames(
        generic: null,
        standard: "South Georgia Time",
        daylight: null,
      ),
      "Suriname": MetazoneLongNames(
        generic: null,
        standard: "Suriname Time",
        daylight: null,
      ),
      "Syowa": MetazoneLongNames(
        generic: null,
        standard: "Syowa Time",
        daylight: null,
      ),
      "Tahiti": MetazoneLongNames(
        generic: null,
        standard: "Tahiti Time",
        daylight: null,
      ),
      "Taipei": MetazoneLongNames(
        generic: "Taiwan Time",
        standard: "Taiwan Standard Time",
        daylight: "Taiwan Daylight Time",
      ),
      "Tajikistan": MetazoneLongNames(
        generic: null,
        standard: "Tajikistan Time",
        daylight: null,
      ),
      "Tokelau": MetazoneLongNames(
        generic: null,
        standard: "Tokelau Time",
        daylight: null,
      ),
      "Tonga": MetazoneLongNames(
        generic: "Tonga Time",
        standard: "Tonga Standard Time",
        daylight: "Tonga Summer Time",
      ),
      "Truk": MetazoneLongNames(
        generic: null,
        standard: "Chuuk Time",
        daylight: null,
      ),
      "Turkey": MetazoneLongNames(
        generic: "Türkiye Time",
        standard: "Türkiye Standard Time",
        daylight: "Türkiye Summer Time",
      ),
      "Turkmenistan": MetazoneLongNames(
        generic: "Turkmenistan Time",
        standard: "Turkmenistan Standard Time",
        daylight: "Turkmenistan Summer Time",
      ),
      "Tuvalu": MetazoneLongNames(
        generic: null,
        standard: "Tuvalu Time",
        daylight: null,
      ),
      "Uruguay": MetazoneLongNames(
        generic: "Uruguay Time",
        standard: "Uruguay Standard Time",
        daylight: "Uruguay Summer Time",
      ),
      "Uzbekistan": MetazoneLongNames(
        generic: "Uzbekistan Time",
        standard: "Uzbekistan Standard Time",
        daylight: "Uzbekistan Summer Time",
      ),
      "Vanuatu": MetazoneLongNames(
        generic: "Vanuatu Time",
        standard: "Vanuatu Standard Time",
        daylight: "Vanuatu Summer Time",
      ),
      "Venezuela": MetazoneLongNames(
        generic: null,
        standard: "Venezuela Time",
        daylight: null,
      ),
      "Vladivostok": MetazoneLongNames(
        generic: "Vladivostok Time",
        standard: "Vladivostok Standard Time",
        daylight: "Vladivostok Summer Time",
      ),
      "Volgograd": MetazoneLongNames(
        generic: "Volgograd Time",
        standard: "Volgograd Standard Time",
        daylight: "Volgograd Summer Time",
      ),
      "Vostok": MetazoneLongNames(
        generic: null,
        standard: "Vostok Time",
        daylight: null,
      ),
      "Wake": MetazoneLongNames(
        generic: null,
        standard: "Wake Island Time",
        daylight: null,
      ),
      "Wallis": MetazoneLongNames(
        generic: null,
        standard: "Wallis & Futuna Time",
        daylight: null,
      ),
      "Yakutsk": MetazoneLongNames(
        generic: "Yakutsk Time",
        standard: "Yakutsk Standard Time",
        daylight: "Yakutsk Summer Time",
      ),
      "Yekaterinburg": MetazoneLongNames(
        generic: "Yekaterinburg Time",
        standard: "Yekaterinburg Standard Time",
        daylight: "Yekaterinburg Summer Time",
      ),
      "Yukon": MetazoneLongNames(
        generic: null,
        standard: "Yukon Time",
        daylight: null,
      ),
    };

/// Sparse zone-level en-001 long overrides.
const Map<String, MetazoneLongNames> zoneLongNames =
    <String, MetazoneLongNames>{
      "Etc/UTC": MetazoneLongNames(
        generic: null,
        standard: "Coordinated Universal Time",
        daylight: null,
      ),
      "Europe/Dublin": MetazoneLongNames(
        generic: null,
        standard: null,
        daylight: "Irish Standard Time",
      ),
      "Europe/London": MetazoneLongNames(
        generic: null,
        standard: null,
        daylight: "British Summer Time",
      ),
    };

/// CLDR zone key → metazone membership history (oldest first).
const Map<String, List<MetazoneRange>>
zoneMetazoneHistory = <String, List<MetazoneRange>>{
  "Africa/Abidjan": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Accra": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Addis_Ababa": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Algiers": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Western", start: null, end: 246236400000),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 246236400000,
      end: 309740400000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Western",
      start: 309740400000,
      end: 357523200000,
    ),
    MetazoneRange(metazoneId: "Europe_Central", start: 357523200000, end: null),
  ],
  "Africa/Asmera": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Bamako": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Bangui": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Banjul": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Bissau": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Africa_FarWestern",
      start: null,
      end: 157770000000,
    ),
    MetazoneRange(metazoneId: "GMT", start: 157770000000, end: null),
  ],
  "Africa/Blantyre": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Brazzaville": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Bujumbura": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Cairo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Africa/Casablanca": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Western", start: null, end: 448243200000),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 448243200000,
      end: 504918000000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Western",
      start: 504918000000,
      end: 1540692000000,
    ),
  ],
  "Africa/Ceuta": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Western", start: null, end: 448243200000),
    MetazoneRange(metazoneId: "Europe_Central", start: 448243200000, end: null),
  ],
  "Africa/Conakry": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Dakar": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Dar_es_Salaam": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Djibouti": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Douala": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/El_Aaiun": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Africa_FarWestern",
      start: null,
      end: 198291600000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Western",
      start: 198291600000,
      end: 1540692000000,
    ),
  ],
  "Africa/Freetown": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Gaborone": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Harare": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Johannesburg": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Southern", start: null, end: null),
  ],
  "Africa/Juba": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: 947930400000),
    MetazoneRange(
      metazoneId: "Africa_Eastern",
      start: 947930400000,
      end: 1612126800000,
    ),
    MetazoneRange(
      metazoneId: "Africa_Central",
      start: 1612126800000,
      end: null,
    ),
  ],
  "Africa/Kampala": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Khartoum": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: 947930400000),
    MetazoneRange(
      metazoneId: "Africa_Eastern",
      start: 947930400000,
      end: 1509483600000,
    ),
    MetazoneRange(
      metazoneId: "Africa_Central",
      start: 1509483600000,
      end: null,
    ),
  ],
  "Africa/Kigali": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Kinshasa": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Lagos": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Libreville": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Lome": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Luanda": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Lubumbashi": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Lusaka": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Malabo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Maputo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Central", start: null, end: null),
  ],
  "Africa/Maseru": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Southern", start: null, end: null),
  ],
  "Africa/Mbabane": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Southern", start: null, end: null),
  ],
  "Africa/Mogadishu": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Monrovia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Liberia", start: null, end: 63593100000),
    MetazoneRange(metazoneId: "GMT", start: 63593100000, end: null),
  ],
  "Africa/Nairobi": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Africa/Ndjamena": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Niamey": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Nouakchott": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Ouagadougou": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Africa/Porto-Novo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Western", start: null, end: null),
  ],
  "Africa/Sao_Tome": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: 1514768400000),
    MetazoneRange(
      metazoneId: "Africa_Western",
      start: 1514768400000,
      end: 1546304400000,
    ),
    MetazoneRange(metazoneId: "GMT", start: 1546304400000, end: null),
  ],
  "Africa/Tripoli": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: 378684000000),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 378684000000,
      end: 641775600000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 641775600000,
      end: 844034400000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 844034400000,
      end: 875916000000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 875916000000,
      end: 1352505600000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 1352505600000,
      end: 1382659200000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 1382659200000,
      end: null,
    ),
  ],
  "Africa/Tunis": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Africa/Windhoek": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Africa_Southern",
      start: null,
      end: 637970400000,
    ),
    MetazoneRange(
      metazoneId: "Africa_Central",
      start: 637970400000,
      end: 764200800000,
    ),
    MetazoneRange(
      metazoneId: "Africa_Western",
      start: 764200800000,
      end: 1508796000000,
    ),
    MetazoneRange(
      metazoneId: "Africa_Central",
      start: 1508796000000,
      end: null,
    ),
  ],
  "America/Adak": <MetazoneRange>[
    MetazoneRange(metazoneId: "Bering", start: null, end: 436363200000),
    MetazoneRange(
      metazoneId: "Hawaii_Aleutian",
      start: 439034400000,
      end: null,
    ),
  ],
  "America/Anchorage": <MetazoneRange>[
    MetazoneRange(metazoneId: "Alaska_Hawaii", start: null, end: 436359600000),
    MetazoneRange(metazoneId: "Alaska", start: 439030800000, end: null),
  ],
  "America/Anguilla": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Antigua": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Araguaina": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Argentina/La_Rioja": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 667792800000),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 667792800000,
      end: 673588800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 673588800000,
      end: 1086058800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1086058800000,
      end: 1087704000000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1087704000000, end: null),
  ],
  "America/Argentina/Rio_Gallegos": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 1086058800000),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1086058800000,
      end: 1087704000000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1087704000000, end: null),
  ],
  "America/Argentina/Salta": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 667965600000),
    MetazoneRange(metazoneId: "Argentina", start: 687931200000, end: null),
  ],
  "America/Argentina/San_Juan": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 667792800000),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 667792800000,
      end: 673588800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 673588800000,
      end: 1085972400000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1085972400000,
      end: 1090728000000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1090728000000, end: null),
  ],
  "America/Argentina/San_Luis": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 637380000000),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 637380000000,
      end: 675748800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 675748800000,
      end: 938919600000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 938919600000,
      end: 952052400000,
    ),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 952052400000,
      end: 1085972400000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1085972400000,
      end: 1090728000000,
    ),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 1090728000000,
      end: 1200880800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1200880800000,
      end: 1255233600000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1255233600000, end: null),
  ],
  "America/Argentina/Tucuman": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 667965600000),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 687931200000,
      end: 1086058800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1086058800000,
      end: 1087099200000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1087099200000, end: null),
  ],
  "America/Argentina/Ushuaia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 1085886000000),
    MetazoneRange(metazoneId: "Argentina", start: 1087704000000, end: null),
  ],
  "America/Aruba": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Asuncion": <MetazoneRange>[
    MetazoneRange(metazoneId: "Paraguay", start: null, end: null),
  ],
  "America/Bahia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Bahia_Banderas": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: null,
      end: 1270371600000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1270371600000,
      end: null,
    ),
  ],
  "America/Barbados": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Belem": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Belize": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Blanc-Sablon": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Boa_Vista": <MetazoneRange>[
    MetazoneRange(metazoneId: "Amazon", start: null, end: null),
  ],
  "America/Bogota": <MetazoneRange>[
    MetazoneRange(metazoneId: "Colombia", start: null, end: null),
  ],
  "America/Boise": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Mountain", start: null, end: null),
  ],
  "America/Buenos_Aires": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: null),
  ],
  "America/Cambridge_Bay": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: null,
      end: 941356800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 941356800000,
      end: 972802800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 972802800000,
      end: 973400400000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 973400400000,
      end: 986115600000,
    ),
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: 986115600000,
      end: null,
    ),
  ],
  "America/Campo_Grande": <MetazoneRange>[
    MetazoneRange(metazoneId: "Amazon", start: null, end: null),
  ],
  "America/Cancun": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 378201600000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 378201600000,
      end: 410504400000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 410504400000,
      end: 877849200000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 877849200000,
      end: 902037600000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 902037600000,
      end: 1422777600000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 1422777600000,
      end: null,
    ),
  ],
  "America/Caracas": <MetazoneRange>[
    MetazoneRange(metazoneId: "Venezuela", start: null, end: null),
  ],
  "America/Catamarca": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 667965600000),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 687931200000,
      end: 1086058800000,
    ),
    MetazoneRange(
      metazoneId: "Argentina_Western",
      start: 1086058800000,
      end: 1087704000000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1087704000000, end: null),
  ],
  "America/Cayenne": <MetazoneRange>[
    MetazoneRange(metazoneId: "French_Guiana", start: null, end: null),
  ],
  "America/Cayman": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Chicago": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Chihuahua": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 891766800000,
    ),
    MetazoneRange(
      metazoneId: "Mexico_Pacific",
      start: 891766800000,
      end: 1667116800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1667116800000,
      end: null,
    ),
  ],
  "America/Ciudad_Juarez": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 891766800000,
    ),
    MetazoneRange(
      metazoneId: "Mexico_Pacific",
      start: 891766800000,
      end: 1667116800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1667116800000,
      end: 1669788000000,
    ),
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: 1669788000000,
      end: null,
    ),
  ],
  "America/Coral_Harbour": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Cordoba": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 667965600000),
    MetazoneRange(metazoneId: "Argentina", start: 687931200000, end: null),
  ],
  "America/Costa_Rica": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Coyhaique": <MetazoneRange>[
    MetazoneRange(metazoneId: "Chile", start: null, end: 1742439600000),
  ],
  "America/Creston": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Mountain", start: null, end: null),
  ],
  "America/Cuiaba": <MetazoneRange>[
    MetazoneRange(metazoneId: "Amazon", start: null, end: null),
  ],
  "America/Curacao": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Danmarkshavn": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Greenland_Western",
      start: null,
      end: 820465200000,
    ),
    MetazoneRange(metazoneId: "GMT", start: 820465200000, end: null),
  ],
  "America/Dawson": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: 120646800000,
      end: 1604214000000,
    ),
    MetazoneRange(metazoneId: "Yukon", start: 1604214000000, end: null),
  ],
  "America/Dawson_Creek": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Pacific", start: null, end: 84013200000),
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: 84013200000,
      end: null,
    ),
  ],
  "America/Denver": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Mountain", start: null, end: null),
  ],
  "America/Detroit": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Dominica": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Edmonton": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Mountain", start: null, end: null),
  ],
  "America/Eirunepe": <MetazoneRange>[
    MetazoneRange(metazoneId: "Acre", start: null, end: 1214283600000),
    MetazoneRange(
      metazoneId: "Amazon",
      start: 1214283600000,
      end: 1384056000000,
    ),
    MetazoneRange(metazoneId: "Acre", start: 1384056000000, end: null),
  ],
  "America/El_Salvador": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Fort_Nelson": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: null,
      end: 1425808800000,
    ),
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: 1425808800000,
      end: null,
    ),
  ],
  "America/Fortaleza": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Glace_Bay": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Godthab": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Greenland_Western",
      start: null,
      end: 1711414800000,
    ),
    MetazoneRange(metazoneId: "Greenland", start: 1711414800000, end: null),
  ],
  "America/Goose_Bay": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: 576043260000),
    MetazoneRange(
      metazoneId: "Goose_Bay",
      start: 576043260000,
      end: 594180060000,
    ),
    MetazoneRange(metazoneId: "Atlantic", start: 594180060000, end: null),
  ],
  "America/Grand_Turk": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 1425798000000,
    ),
    MetazoneRange(
      metazoneId: "Atlantic",
      start: 1425798000000,
      end: 1520751600000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 1520751600000,
      end: null,
    ),
  ],
  "America/Grenada": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Guadeloupe": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Guatemala": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Guayaquil": <MetazoneRange>[
    MetazoneRange(metazoneId: "Ecuador", start: null, end: null),
  ],
  "America/Guyana": <MetazoneRange>[
    MetazoneRange(metazoneId: "Guyana", start: null, end: null),
  ],
  "America/Halifax": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Havana": <MetazoneRange>[
    MetazoneRange(metazoneId: "Cuba", start: null, end: null),
  ],
  "America/Hermosillo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Mexico_Pacific", start: null, end: null),
  ],
  "America/Indiana/Knox": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 688546800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 688546800000,
      end: 1143961200000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1143961200000,
      end: null,
    ),
  ],
  "America/Indiana/Marengo": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 126687600000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 126687600000,
      end: 152089200000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 152089200000,
      end: null,
    ),
  ],
  "America/Indiana/Petersburg": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 247042800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 247042800000,
      end: 1143961200000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1143961200000,
      end: 1194159600000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 1194159600000,
      end: null,
    ),
  ],
  "America/Indiana/Tell_City": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 1143961200000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1143961200000,
      end: null,
    ),
  ],
  "America/Indiana/Vevay": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Indiana/Vincennes": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 1143961200000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1143961200000,
      end: 1194159600000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 1194159600000,
      end: null,
    ),
  ],
  "America/Indiana/Winamac": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 1143961200000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1143961200000,
      end: 1173600000000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 1173600000000,
      end: null,
    ),
  ],
  "America/Indianapolis": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Inuvik": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: null,
      end: 294228000000,
    ),
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: 294228000000,
      end: null,
    ),
  ],
  "America/Iqaluit": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 941349600000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 941349600000,
      end: 972802800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 972802800000,
      end: null,
    ),
  ],
  "America/Jamaica": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Jujuy": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 636516000000),
    MetazoneRange(metazoneId: "Argentina", start: 686721600000, end: null),
  ],
  "America/Juneau": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: null,
      end: 325677600000,
    ),
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: 341402400000,
      end: 436352400000,
    ),
    MetazoneRange(metazoneId: "Alaska", start: 439030800000, end: null),
  ],
  "America/Kentucky/Monticello": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 972802800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 972802800000,
      end: null,
    ),
  ],
  "America/Kralendijk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/La_Paz": <MetazoneRange>[
    MetazoneRange(metazoneId: "Bolivia", start: null, end: null),
  ],
  "America/Lima": <MetazoneRange>[
    MetazoneRange(metazoneId: "Peru", start: null, end: null),
  ],
  "America/Los_Angeles": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Pacific", start: null, end: null),
  ],
  "America/Louisville": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 126687600000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 126687600000,
      end: 152089200000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 152089200000,
      end: null,
    ),
  ],
  "America/Lower_Princes": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Maceio": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Managua": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 105084000000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 105084000000,
      end: 161758800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 161758800000,
      end: 694260000000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 694260000000,
      end: 717310800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 717310800000,
      end: 725868000000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 725868000000,
      end: 852094800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 852094800000,
      end: null,
    ),
  ],
  "America/Manaus": <MetazoneRange>[
    MetazoneRange(metazoneId: "Amazon", start: null, end: null),
  ],
  "America/Marigot": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Martinique": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Matamoros": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Mazatlan": <MetazoneRange>[
    MetazoneRange(metazoneId: "Mexico_Pacific", start: null, end: null),
  ],
  "America/Mendoza": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 636516000000),
    MetazoneRange(
      metazoneId: "Argentina",
      start: 719380800000,
      end: 1085281200000,
    ),
    MetazoneRange(metazoneId: "Argentina", start: 1096171200000, end: null),
  ],
  "America/Menominee": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: null,
      end: 104914800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 104914800000,
      end: null,
    ),
  ],
  "America/Merida": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 378201600000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 378201600000,
      end: 405068400000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 405068400000,
      end: null,
    ),
  ],
  "America/Metlakatla": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: null,
      end: 1446372000000,
    ),
    MetazoneRange(
      metazoneId: "Alaska",
      start: 1446372000000,
      end: 1541325600000,
    ),
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: 1541325600000,
      end: 1547978400000,
    ),
    MetazoneRange(metazoneId: "Alaska", start: 1547978400000, end: null),
  ],
  "America/Mexico_City": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Miquelon": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: 326001600000),
    MetazoneRange(
      metazoneId: "Pierre_Miquelon",
      start: 326001600000,
      end: null,
    ),
  ],
  "America/Moncton": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Monterrey": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Montevideo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Uruguay", start: null, end: null),
  ],
  "America/Montserrat": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Nassau": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/New_York": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Nome": <MetazoneRange>[
    MetazoneRange(metazoneId: "Bering", start: null, end: 436363200000),
    MetazoneRange(metazoneId: "Alaska", start: 439030800000, end: null),
  ],
  "America/Noronha": <MetazoneRange>[
    MetazoneRange(metazoneId: "Noronha", start: null, end: null),
  ],
  "America/North_Dakota/Beulah": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: null,
      end: 1289116800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1289116800000,
      end: null,
    ),
  ],
  "America/North_Dakota/Center": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: null,
      end: 720000000000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 720000000000,
      end: null,
    ),
  ],
  "America/North_Dakota/New_Salem": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: null,
      end: 1067155200000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1067155200000,
      end: null,
    ),
  ],
  "America/Ojinaga": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 891766800000,
    ),
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: 891766800000,
      end: 1667116800000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1667116800000,
      end: null,
    ),
  ],
  "America/Panama": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Paramaribo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Dutch_Guiana", start: null, end: 185686200000),
    MetazoneRange(metazoneId: "Suriname", start: 185686200000, end: null),
  ],
  "America/Phoenix": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Mountain", start: null, end: null),
  ],
  "America/Port-au-Prince": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Port_of_Spain": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Porto_Velho": <MetazoneRange>[
    MetazoneRange(metazoneId: "Amazon", start: null, end: null),
  ],
  "America/Puerto_Rico": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Punta_Arenas": <MetazoneRange>[
    MetazoneRange(metazoneId: "Chile", start: null, end: 1480806000000),
  ],
  "America/Rankin_Inlet": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 972802800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 972802800000,
      end: 986112000000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 986112000000,
      end: null,
    ),
  ],
  "America/Recife": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Regina": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Resolute": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Central",
      start: null,
      end: 972802800000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 972802800000,
      end: 986112000000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 986112000000,
      end: 1162105200000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 1162105200000,
      end: 1173600000000,
    ),
    MetazoneRange(
      metazoneId: "America_Central",
      start: 1173600000000,
      end: null,
    ),
  ],
  "America/Rio_Branco": <MetazoneRange>[
    MetazoneRange(metazoneId: "Acre", start: null, end: 1214283600000),
    MetazoneRange(
      metazoneId: "Amazon",
      start: 1214283600000,
      end: 1384056000000,
    ),
    MetazoneRange(metazoneId: "Acre", start: 1384056000000, end: null),
  ],
  "America/Santarem": <MetazoneRange>[
    MetazoneRange(metazoneId: "Amazon", start: null, end: 1214280000000),
    MetazoneRange(metazoneId: "Brasilia", start: 1214280000000, end: null),
  ],
  "America/Santiago": <MetazoneRange>[
    MetazoneRange(metazoneId: "Chile", start: null, end: null),
  ],
  "America/Santo_Domingo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Dominican", start: null, end: 152082000000),
    MetazoneRange(
      metazoneId: "Atlantic",
      start: 152082000000,
      end: 972799200000,
    ),
    MetazoneRange(
      metazoneId: "America_Eastern",
      start: 972799200000,
      end: 975823200000,
    ),
    MetazoneRange(metazoneId: "Atlantic", start: 975823200000, end: null),
  ],
  "America/Sao_Paulo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brasilia", start: null, end: null),
  ],
  "America/Scoresbysund": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Greenland_Central",
      start: null,
      end: 354679200000,
    ),
    MetazoneRange(
      metazoneId: "Greenland_Eastern",
      start: 354679200000,
      end: 1711846800000,
    ),
    MetazoneRange(metazoneId: "Greenland", start: 1711846800000, end: null),
  ],
  "America/Sitka": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: null,
      end: 436352400000,
    ),
    MetazoneRange(metazoneId: "Alaska", start: 439030800000, end: null),
  ],
  "America/St_Barthelemy": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/St_Johns": <MetazoneRange>[
    MetazoneRange(metazoneId: "Newfoundland", start: null, end: null),
  ],
  "America/St_Kitts": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/St_Lucia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/St_Thomas": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/St_Vincent": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Swift_Current": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Mountain",
      start: null,
      end: 73472400000,
    ),
    MetazoneRange(metazoneId: "America_Central", start: 73472400000, end: null),
  ],
  "America/Tegucigalpa": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Thule": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Tijuana": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Pacific", start: null, end: null),
  ],
  "America/Toronto": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Eastern", start: null, end: null),
  ],
  "America/Tortola": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "America/Vancouver": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Pacific", start: null, end: null),
  ],
  "America/Whitehorse": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "America_Pacific",
      start: null,
      end: 1604214000000,
    ),
    MetazoneRange(metazoneId: "Yukon", start: 1604214000000, end: null),
  ],
  "America/Winnipeg": <MetazoneRange>[
    MetazoneRange(metazoneId: "America_Central", start: null, end: null),
  ],
  "America/Yakutat": <MetazoneRange>[
    MetazoneRange(metazoneId: "Alaska", start: 439030800000, end: null),
  ],
  "Antarctica/Casey": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: null,
      end: 1255802400000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1255802400000,
      end: 1267714800000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1267714800000,
      end: 1319738400000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1319738400000,
      end: 1329843600000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1329843600000,
      end: 1477065600000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1477065600000,
      end: 1520701200000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1520701200000,
      end: 1538856000000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1538856000000,
      end: 1552752000000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1552752000000,
      end: 1570129200000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1570129200000,
      end: 1583596800000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1583596800000,
      end: 1601740860000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1601740860000,
      end: 1615640400000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1615640400000,
      end: 1633190460000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1633190460000,
      end: 1647090000000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1647090000000,
      end: 1664640060000,
    ),
    MetazoneRange(
      metazoneId: "Casey",
      start: 1664640060000,
      end: 1678291200000,
    ),
    MetazoneRange(
      metazoneId: "Australia_Western",
      start: 1678291200000,
      end: null,
    ),
  ],
  "Antarctica/Davis": <MetazoneRange>[
    MetazoneRange(metazoneId: "Davis", start: null, end: null),
  ],
  "Antarctica/DumontDUrville": <MetazoneRange>[
    MetazoneRange(metazoneId: "DumontDUrville", start: null, end: null),
  ],
  "Antarctica/Macquarie": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Eastern", start: null, end: null),
  ],
  "Antarctica/Mawson": <MetazoneRange>[
    MetazoneRange(metazoneId: "Mawson", start: null, end: null),
  ],
  "Antarctica/McMurdo": <MetazoneRange>[
    MetazoneRange(metazoneId: "New_Zealand", start: null, end: null),
  ],
  "Antarctica/Palmer": <MetazoneRange>[
    MetazoneRange(metazoneId: "Argentina", start: null, end: 389070000000),
    MetazoneRange(metazoneId: "Chile", start: 389070000000, end: 1480820400000),
  ],
  "Antarctica/Rothera": <MetazoneRange>[
    MetazoneRange(metazoneId: "Rothera", start: null, end: null),
  ],
  "Antarctica/Syowa": <MetazoneRange>[
    MetazoneRange(metazoneId: "Syowa", start: null, end: null),
  ],
  "Antarctica/Troll": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Antarctica/Vostok": <MetazoneRange>[
    MetazoneRange(metazoneId: "Vostok", start: null, end: null),
  ],
  "Arctic/Longyearbyen": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Asia/Aden": <MetazoneRange>[
    MetazoneRange(metazoneId: "Arabian", start: null, end: null),
  ],
  "Asia/Almaty": <MetazoneRange>[
    MetazoneRange(metazoneId: "Almaty", start: null, end: 1099166400000),
    MetazoneRange(
      metazoneId: "Kazakhstan_Eastern",
      start: 1099166400000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Amman": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: null,
      end: 1666908000000,
    ),
  ],
  "Asia/Anadyr": <MetazoneRange>[
    MetazoneRange(metazoneId: "Anadyr", start: null, end: 1269698400000),
    MetazoneRange(
      metazoneId: "Magadan",
      start: 1269698400000,
      end: 1301151600000,
    ),
    MetazoneRange(metazoneId: "Kamchatka", start: 1301151600000, end: null),
  ],
  "Asia/Aqtau": <MetazoneRange>[
    MetazoneRange(metazoneId: "Shevchenko", start: null, end: 692823600000),
    MetazoneRange(metazoneId: "Aqtau", start: 692823600000, end: 1099173600000),
    MetazoneRange(
      metazoneId: "Kazakhstan_Western",
      start: 1099173600000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Aqtobe": <MetazoneRange>[
    MetazoneRange(metazoneId: "Aktyubinsk", start: null, end: 692823600000),
    MetazoneRange(
      metazoneId: "Aqtobe",
      start: 692823600000,
      end: 1099170000000,
    ),
    MetazoneRange(
      metazoneId: "Kazakhstan_Western",
      start: 1099170000000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Ashgabat": <MetazoneRange>[
    MetazoneRange(metazoneId: "Ashkhabad", start: null, end: 695772000000),
    MetazoneRange(metazoneId: "Turkmenistan", start: 695772000000, end: null),
  ],
  "Asia/Atyrau": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Kazakhstan_Western",
      start: 1099173600000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Baghdad": <MetazoneRange>[
    MetazoneRange(metazoneId: "Arabian", start: null, end: null),
  ],
  "Asia/Bahrain": <MetazoneRange>[
    MetazoneRange(metazoneId: "Gulf", start: null, end: 76190400000),
    MetazoneRange(metazoneId: "Arabian", start: 76190400000, end: null),
  ],
  "Asia/Baku": <MetazoneRange>[
    MetazoneRange(metazoneId: "Baku", start: null, end: 670370400000),
    MetazoneRange(metazoneId: "Azerbaijan", start: 670370400000, end: null),
  ],
  "Asia/Bangkok": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indochina", start: null, end: null),
  ],
  "Asia/Barnaul": <MetazoneRange>[
    MetazoneRange(metazoneId: "Krasnoyarsk", start: 1459022400000, end: null),
  ],
  "Asia/Beirut": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Asia/Bishkek": <MetazoneRange>[
    MetazoneRange(metazoneId: "Frunze", start: null, end: 670363200000),
    MetazoneRange(metazoneId: "Kyrgystan", start: 670363200000, end: null),
  ],
  "Asia/Brunei": <MetazoneRange>[
    MetazoneRange(metazoneId: "Brunei", start: null, end: null),
  ],
  "Asia/Calcutta": <MetazoneRange>[
    MetazoneRange(metazoneId: "India", start: null, end: null),
  ],
  "Asia/Chita": <MetazoneRange>[
    MetazoneRange(metazoneId: "Yakutsk", start: null, end: 1414252800000),
    MetazoneRange(
      metazoneId: "Irkutsk",
      start: 1414256400000,
      end: 1459015200000,
    ),
    MetazoneRange(metazoneId: "Yakutsk", start: 1459015200000, end: null),
  ],
  "Asia/Colombo": <MetazoneRange>[
    MetazoneRange(metazoneId: "India", start: null, end: 832962600000),
    MetazoneRange(metazoneId: "Lanka", start: 832962600000, end: 1145039400000),
    MetazoneRange(metazoneId: "India", start: 1145039400000, end: null),
  ],
  "Asia/Damascus": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: null,
      end: 1666904400000,
    ),
  ],
  "Asia/Dhaka": <MetazoneRange>[
    MetazoneRange(metazoneId: "Dacca", start: null, end: 38772000000),
    MetazoneRange(metazoneId: "Bangladesh", start: 38772000000, end: null),
  ],
  "Asia/Dili": <MetazoneRange>[
    MetazoneRange(metazoneId: "East_Timor", start: null, end: 199897200000),
    MetazoneRange(
      metazoneId: "Indonesia_Central",
      start: 199897200000,
      end: 969120000000,
    ),
    MetazoneRange(metazoneId: "East_Timor", start: 969120000000, end: null),
  ],
  "Asia/Dubai": <MetazoneRange>[
    MetazoneRange(metazoneId: "Gulf", start: null, end: null),
  ],
  "Asia/Dushanbe": <MetazoneRange>[
    MetazoneRange(metazoneId: "Dushanbe", start: null, end: 684363600000),
    MetazoneRange(metazoneId: "Tajikistan", start: 684363600000, end: null),
  ],
  "Asia/Famagusta": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: null,
      end: 1473282000000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 1509238800000,
      end: null,
    ),
  ],
  "Asia/Gaza": <MetazoneRange>[
    MetazoneRange(metazoneId: "Israel", start: null, end: 820447200000),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 820447200000, end: null),
  ],
  "Asia/Hebron": <MetazoneRange>[
    MetazoneRange(metazoneId: "Israel", start: null, end: 820447200000),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 820447200000, end: null),
  ],
  "Asia/Hong_Kong": <MetazoneRange>[
    MetazoneRange(metazoneId: "Hong_Kong", start: null, end: null),
  ],
  "Asia/Hovd": <MetazoneRange>[
    MetazoneRange(metazoneId: "Hovd", start: null, end: null),
  ],
  "Asia/Irkutsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Irkutsk", start: null, end: null),
  ],
  "Asia/Jakarta": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indonesia_Western", start: null, end: null),
  ],
  "Asia/Jayapura": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indonesia_Eastern", start: null, end: null),
  ],
  "Asia/Jerusalem": <MetazoneRange>[
    MetazoneRange(metazoneId: "Israel", start: null, end: null),
  ],
  "Asia/Kabul": <MetazoneRange>[
    MetazoneRange(metazoneId: "Afghanistan", start: null, end: null),
  ],
  "Asia/Kamchatka": <MetazoneRange>[
    MetazoneRange(metazoneId: "Kamchatka", start: null, end: null),
  ],
  "Asia/Karachi": <MetazoneRange>[
    MetazoneRange(metazoneId: "Karachi", start: null, end: 38775600000),
    MetazoneRange(metazoneId: "Pakistan", start: 38775600000, end: null),
  ],
  "Asia/Katmandu": <MetazoneRange>[
    MetazoneRange(metazoneId: "Nepal", start: null, end: null),
  ],
  "Asia/Khandyga": <MetazoneRange>[
    MetazoneRange(metazoneId: "Yakutsk", start: null, end: 1072882800000),
    MetazoneRange(
      metazoneId: "Vladivostok",
      start: 1072882800000,
      end: 1315832400000,
    ),
    MetazoneRange(metazoneId: "Yakutsk", start: 1315832400000, end: null),
  ],
  "Asia/Krasnoyarsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Krasnoyarsk", start: null, end: null),
  ],
  "Asia/Kuala_Lumpur": <MetazoneRange>[
    MetazoneRange(metazoneId: "Malaya", start: null, end: 378662400000),
    MetazoneRange(metazoneId: "Malaysia", start: 378662400000, end: null),
  ],
  "Asia/Kuching": <MetazoneRange>[
    MetazoneRange(metazoneId: "Borneo", start: null, end: 378662400000),
    MetazoneRange(metazoneId: "Malaysia", start: 378662400000, end: null),
  ],
  "Asia/Kuwait": <MetazoneRange>[
    MetazoneRange(metazoneId: "Arabian", start: null, end: null),
  ],
  "Asia/Macau": <MetazoneRange>[
    MetazoneRange(metazoneId: "Macau", start: null, end: 945619200000),
    MetazoneRange(metazoneId: "China", start: 945619200000, end: null),
  ],
  "Asia/Magadan": <MetazoneRange>[
    MetazoneRange(metazoneId: "Magadan", start: null, end: null),
  ],
  "Asia/Makassar": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indonesia_Central", start: null, end: null),
  ],
  "Asia/Manila": <MetazoneRange>[
    MetazoneRange(metazoneId: "Philippines", start: null, end: null),
  ],
  "Asia/Muscat": <MetazoneRange>[
    MetazoneRange(metazoneId: "Gulf", start: null, end: null),
  ],
  "Asia/Nicosia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Asia/Novokuznetsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Krasnoyarsk", start: null, end: 1269716400000),
    MetazoneRange(
      metazoneId: "Novosibirsk",
      start: 1269716400000,
      end: 1414263600000,
    ),
    MetazoneRange(metazoneId: "Krasnoyarsk", start: 1414263600000, end: null),
  ],
  "Asia/Novosibirsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Novosibirsk", start: null, end: 1469304000000),
    MetazoneRange(metazoneId: "Krasnoyarsk", start: 1469304000000, end: null),
  ],
  "Asia/Omsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Omsk", start: null, end: null),
  ],
  "Asia/Oral": <MetazoneRange>[
    MetazoneRange(metazoneId: "Uralsk", start: null, end: 692827200000),
    MetazoneRange(metazoneId: "Oral", start: 692827200000, end: 1099173600000),
    MetazoneRange(
      metazoneId: "Kazakhstan_Western",
      start: 1099173600000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Phnom_Penh": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indochina", start: null, end: null),
  ],
  "Asia/Pontianak": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Indonesia_Central",
      start: null,
      end: 567964800000,
    ),
    MetazoneRange(
      metazoneId: "Indonesia_Western",
      start: 567964800000,
      end: null,
    ),
  ],
  "Asia/Pyongyang": <MetazoneRange>[
    MetazoneRange(metazoneId: "Korea", start: null, end: 1439564400000),
    MetazoneRange(
      metazoneId: "Pyongyang",
      start: 1439564400000,
      end: 1525446000000,
    ),
    MetazoneRange(metazoneId: "Korea", start: 1525446000000, end: null),
  ],
  "Asia/Qatar": <MetazoneRange>[
    MetazoneRange(metazoneId: "Gulf", start: null, end: 76190400000),
    MetazoneRange(metazoneId: "Arabian", start: 76190400000, end: null),
  ],
  "Asia/Qostanay": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Kazakhstan_Eastern",
      start: 1099170000000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Qyzylorda": <MetazoneRange>[
    MetazoneRange(metazoneId: "Kizilorda", start: null, end: 692823600000),
    MetazoneRange(
      metazoneId: "Qyzylorda",
      start: 692823600000,
      end: 1099170000000,
    ),
    MetazoneRange(
      metazoneId: "Kazakhstan_Eastern",
      start: 1099170000000,
      end: 1545328800000,
    ),
    MetazoneRange(
      metazoneId: "Kazakhstan_Western",
      start: 1545328800000,
      end: 1709229600000,
    ),
    MetazoneRange(metazoneId: "Kazakhstan", start: 1709229600000, end: null),
  ],
  "Asia/Rangoon": <MetazoneRange>[
    MetazoneRange(metazoneId: "Myanmar", start: null, end: null),
  ],
  "Asia/Riyadh": <MetazoneRange>[
    MetazoneRange(metazoneId: "Arabian", start: null, end: null),
  ],
  "Asia/Saigon": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indochina", start: 171820800000, end: null),
  ],
  "Asia/Sakhalin": <MetazoneRange>[
    MetazoneRange(metazoneId: "Sakhalin", start: null, end: 1414249200000),
    MetazoneRange(
      metazoneId: "Magadan",
      start: 1414249200000,
      end: 1459008000000,
    ),
    MetazoneRange(metazoneId: "Magadan", start: 1461686400000, end: null),
  ],
  "Asia/Samarkand": <MetazoneRange>[
    MetazoneRange(metazoneId: "Samarkand", start: null, end: 370720800000),
    MetazoneRange(
      metazoneId: "Tashkent",
      start: 370720800000,
      end: 386445600000,
    ),
    MetazoneRange(
      metazoneId: "Samarkand",
      start: 386445600000,
      end: 683661600000,
    ),
    MetazoneRange(metazoneId: "Uzbekistan", start: 683661600000, end: null),
  ],
  "Asia/Seoul": <MetazoneRange>[
    MetazoneRange(metazoneId: "Korea", start: null, end: null),
  ],
  "Asia/Shanghai": <MetazoneRange>[
    MetazoneRange(metazoneId: "China", start: null, end: null),
  ],
  "Asia/Singapore": <MetazoneRange>[
    MetazoneRange(metazoneId: "Singapore", start: null, end: null),
  ],
  "Asia/Srednekolymsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Magadan", start: null, end: 1414245600000),
    MetazoneRange(metazoneId: "Magadan", start: 1461427200000, end: null),
  ],
  "Asia/Taipei": <MetazoneRange>[
    MetazoneRange(metazoneId: "Taipei", start: null, end: null),
  ],
  "Asia/Tashkent": <MetazoneRange>[
    MetazoneRange(metazoneId: "Tashkent", start: null, end: 670363200000),
    MetazoneRange(metazoneId: "Uzbekistan", start: 670363200000, end: null),
  ],
  "Asia/Tbilisi": <MetazoneRange>[
    MetazoneRange(metazoneId: "Tbilisi", start: null, end: 670370400000),
    MetazoneRange(metazoneId: "Georgia", start: 670370400000, end: null),
  ],
  "Asia/Tehran": <MetazoneRange>[
    MetazoneRange(metazoneId: "Iran", start: null, end: null),
  ],
  "Asia/Thimphu": <MetazoneRange>[
    MetazoneRange(metazoneId: "India", start: null, end: 560025000000),
    MetazoneRange(metazoneId: "Bhutan", start: 560025000000, end: null),
  ],
  "Asia/Tokyo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Japan", start: null, end: null),
  ],
  "Asia/Tomsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Krasnoyarsk", start: 1464465600000, end: null),
  ],
  "Asia/Ulaanbaatar": <MetazoneRange>[
    MetazoneRange(metazoneId: "Mongolia", start: null, end: null),
  ],
  "Asia/Urumqi": <MetazoneRange>[
    MetazoneRange(metazoneId: "Urumqi", start: null, end: null),
  ],
  "Asia/Ust-Nera": <MetazoneRange>[
    MetazoneRange(metazoneId: "Yakutsk", start: null, end: 354898800000),
    MetazoneRange(
      metazoneId: "Magadan",
      start: 354898800000,
      end: 1315828800000,
    ),
    MetazoneRange(metazoneId: "Vladivostok", start: 1315828800000, end: null),
  ],
  "Asia/Vientiane": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indochina", start: null, end: null),
  ],
  "Asia/Vladivostok": <MetazoneRange>[
    MetazoneRange(metazoneId: "Vladivostok", start: null, end: null),
  ],
  "Asia/Yakutsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Yakutsk", start: null, end: null),
  ],
  "Asia/Yekaterinburg": <MetazoneRange>[
    MetazoneRange(metazoneId: "Sverdlovsk", start: null, end: 695772000000),
    MetazoneRange(metazoneId: "Yekaterinburg", start: 695772000000, end: null),
  ],
  "Asia/Yerevan": <MetazoneRange>[
    MetazoneRange(metazoneId: "Yerevan", start: null, end: 670370400000),
    MetazoneRange(metazoneId: "Armenia", start: 670370400000, end: null),
  ],
  "Atlantic/Azores": <MetazoneRange>[
    MetazoneRange(metazoneId: "Azores", start: null, end: 725421600000),
    MetazoneRange(
      metazoneId: "Europe_Western",
      start: 725421600000,
      end: 740278800000,
    ),
    MetazoneRange(metazoneId: "Azores", start: 740278800000, end: null),
  ],
  "Atlantic/Bermuda": <MetazoneRange>[
    MetazoneRange(metazoneId: "Atlantic", start: null, end: null),
  ],
  "Atlantic/Canary": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Western", start: null, end: null),
  ],
  "Atlantic/Cape_Verde": <MetazoneRange>[
    MetazoneRange(metazoneId: "Cape_Verde", start: null, end: null),
  ],
  "Atlantic/Faeroe": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Western", start: null, end: null),
  ],
  "Atlantic/Madeira": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Western", start: null, end: null),
  ],
  "Atlantic/Reykjavik": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Atlantic/South_Georgia": <MetazoneRange>[
    MetazoneRange(metazoneId: "South_Georgia", start: null, end: null),
  ],
  "Atlantic/St_Helena": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Atlantic/Stanley": <MetazoneRange>[
    MetazoneRange(metazoneId: "Falkland", start: null, end: null),
  ],
  "Australia/Adelaide": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Central", start: null, end: null),
  ],
  "Australia/Brisbane": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Eastern", start: null, end: null),
  ],
  "Australia/Broken_Hill": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Central", start: null, end: null),
  ],
  "Australia/Darwin": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Central", start: null, end: null),
  ],
  "Australia/Eucla": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Australia_CentralWestern",
      start: null,
      end: null,
    ),
  ],
  "Australia/Hobart": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Eastern", start: null, end: null),
  ],
  "Australia/Lindeman": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Eastern", start: null, end: null),
  ],
  "Australia/Lord_Howe": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Australia_Eastern",
      start: null,
      end: 352216800000,
    ),
    MetazoneRange(metazoneId: "Lord_Howe", start: 352216800000, end: null),
  ],
  "Australia/Melbourne": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Eastern", start: null, end: null),
  ],
  "Australia/Perth": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Western", start: null, end: null),
  ],
  "Australia/Sydney": <MetazoneRange>[
    MetazoneRange(metazoneId: "Australia_Eastern", start: null, end: null),
  ],
  "Etc/GMT": <MetazoneRange>[
    MetazoneRange(metazoneId: "GMT", start: null, end: null),
  ],
  "Europe/Amsterdam": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Andorra": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Astrakhan": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Moscow",
      start: 701820000000,
      end: 1459033200000,
    ),
    MetazoneRange(metazoneId: "Samara", start: 1459033200000, end: null),
  ],
  "Europe/Athens": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Europe/Belgrade": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Berlin": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Bratislava": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Brussels": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Bucharest": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Europe/Budapest": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Busingen": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Chisinau": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 641944800000),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 641944800000, end: null),
  ],
  "Europe/Copenhagen": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Dublin": <MetazoneRange>[
    MetazoneRange(metazoneId: "Irish", start: null, end: 57722400000),
    MetazoneRange(metazoneId: "GMT", start: 57722400000, end: null),
  ],
  "Europe/Gibraltar": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Guernsey": <MetazoneRange>[
    MetazoneRange(metazoneId: "British", start: null, end: 57722400000),
    MetazoneRange(metazoneId: "GMT", start: 57722400000, end: null),
  ],
  "Europe/Helsinki": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Europe/Isle_of_Man": <MetazoneRange>[
    MetazoneRange(metazoneId: "British", start: null, end: 57722400000),
    MetazoneRange(metazoneId: "GMT", start: 57722400000, end: null),
  ],
  "Europe/Istanbul": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: 267915600000),
    MetazoneRange(metazoneId: "Turkey", start: 267915600000, end: 468111600000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 468111600000,
      end: 1473195600000,
    ),
    MetazoneRange(metazoneId: "Turkey", start: 1473195600000, end: null),
  ],
  "Europe/Jersey": <MetazoneRange>[
    MetazoneRange(metazoneId: "British", start: null, end: 57722400000),
    MetazoneRange(metazoneId: "GMT", start: 57722400000, end: null),
  ],
  "Europe/Kaliningrad": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 606870000000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 606870000000,
      end: 1301184000000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Further_Eastern",
      start: 1301184000000,
      end: 1414278000000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 1414278000000,
      end: null,
    ),
  ],
  "Europe/Kiev": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 646783200000),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 646783200000, end: null),
  ],
  "Europe/Kirov": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: 1414274400000, end: null),
  ],
  "Europe/Lisbon": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: 212544000000),
    MetazoneRange(
      metazoneId: "Europe_Western",
      start: 212544000000,
      end: 717555600000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 717555600000,
      end: 828234000000,
    ),
    MetazoneRange(metazoneId: "Europe_Western", start: 828234000000, end: null),
  ],
  "Europe/Ljubljana": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/London": <MetazoneRange>[
    MetazoneRange(metazoneId: "British", start: null, end: 57722400000),
    MetazoneRange(metazoneId: "GMT", start: 57722400000, end: null),
  ],
  "Europe/Luxembourg": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Madrid": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Malta": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Mariehamn": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Europe/Minsk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 670374000000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 670374000000,
      end: 1301184000000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Further_Eastern",
      start: 1301184000000,
      end: 1414360800000,
    ),
    MetazoneRange(metazoneId: "Moscow", start: 1414360800000, end: null),
  ],
  "Europe/Monaco": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Moscow": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 670374000000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 670374000000,
      end: 695779200000,
    ),
    MetazoneRange(metazoneId: "Moscow", start: 695779200000, end: null),
  ],
  "Europe/Oslo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Paris": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Podgorica": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Prague": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Riga": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 606870000000),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 606870000000, end: null),
  ],
  "Europe/Rome": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Samara": <MetazoneRange>[
    MetazoneRange(metazoneId: "Kuybyshev", start: null, end: 606866400000),
    MetazoneRange(metazoneId: "Moscow", start: 606866400000, end: 670374000000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 670374000000,
      end: 686102400000,
    ),
    MetazoneRange(metazoneId: "Samara", start: 686102400000, end: null),
  ],
  "Europe/San_Marino": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Sarajevo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Saratov": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Moscow",
      start: 701820000000,
      end: 1480806000000,
    ),
    MetazoneRange(metazoneId: "Samara", start: 1480806000000, end: null),
  ],
  "Europe/Simferopol": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 646786800000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 646786800000,
      end: 767739600000,
    ),
    MetazoneRange(metazoneId: "Moscow", start: 767739600000, end: 859683600000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 859683600000,
      end: 1396137600000,
    ),
    MetazoneRange(metazoneId: "Moscow", start: 1396137600000, end: null),
  ],
  "Europe/Skopje": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Sofia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Eastern", start: null, end: null),
  ],
  "Europe/Stockholm": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Tallinn": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 606870000000),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 606870000000, end: null),
  ],
  "Europe/Tirane": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Ulyanovsk": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Moscow",
      start: 695779200000,
      end: 1459033200000,
    ),
    MetazoneRange(metazoneId: "Samara", start: 1459033200000, end: null),
  ],
  "Europe/Vaduz": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Vatican": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Vienna": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Vilnius": <MetazoneRange>[
    MetazoneRange(metazoneId: "Moscow", start: null, end: 606870000000),
    MetazoneRange(
      metazoneId: "Europe_Eastern",
      start: 606870000000,
      end: 891133200000,
    ),
    MetazoneRange(
      metazoneId: "Europe_Central",
      start: 891133200000,
      end: 941331600000,
    ),
    MetazoneRange(metazoneId: "Europe_Eastern", start: 941331600000, end: null),
  ],
  "Europe/Volgograd": <MetazoneRange>[
    MetazoneRange(metazoneId: "Volgograd", start: null, end: 1609020000000),
    MetazoneRange(metazoneId: "Moscow", start: 1609020000000, end: null),
  ],
  "Europe/Warsaw": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Zagreb": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Europe/Zurich": <MetazoneRange>[
    MetazoneRange(metazoneId: "Europe_Central", start: null, end: null),
  ],
  "Indian/Antananarivo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Indian/Chagos": <MetazoneRange>[
    MetazoneRange(metazoneId: "Indian_Ocean", start: null, end: null),
  ],
  "Indian/Christmas": <MetazoneRange>[
    MetazoneRange(metazoneId: "Christmas", start: null, end: null),
  ],
  "Indian/Cocos": <MetazoneRange>[
    MetazoneRange(metazoneId: "Cocos", start: null, end: null),
  ],
  "Indian/Comoro": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Indian/Kerguelen": <MetazoneRange>[
    MetazoneRange(metazoneId: "French_Southern", start: null, end: null),
  ],
  "Indian/Mahe": <MetazoneRange>[
    MetazoneRange(metazoneId: "Seychelles", start: null, end: null),
  ],
  "Indian/Maldives": <MetazoneRange>[
    MetazoneRange(metazoneId: "Maldives", start: null, end: null),
  ],
  "Indian/Mauritius": <MetazoneRange>[
    MetazoneRange(metazoneId: "Mauritius", start: null, end: null),
  ],
  "Indian/Mayotte": <MetazoneRange>[
    MetazoneRange(metazoneId: "Africa_Eastern", start: null, end: null),
  ],
  "Indian/Reunion": <MetazoneRange>[
    MetazoneRange(metazoneId: "Reunion", start: null, end: null),
  ],
  "Pacific/Apia": <MetazoneRange>[
    MetazoneRange(metazoneId: "Apia", start: null, end: null),
  ],
  "Pacific/Auckland": <MetazoneRange>[
    MetazoneRange(metazoneId: "New_Zealand", start: null, end: null),
  ],
  "Pacific/Bougainville": <MetazoneRange>[
    MetazoneRange(
      metazoneId: "Papua_New_Guinea",
      start: null,
      end: 1419696000000,
    ),
  ],
  "Pacific/Chatham": <MetazoneRange>[
    MetazoneRange(metazoneId: "Chatham", start: null, end: null),
  ],
  "Pacific/Easter": <MetazoneRange>[
    MetazoneRange(metazoneId: "Easter", start: null, end: null),
  ],
  "Pacific/Efate": <MetazoneRange>[
    MetazoneRange(metazoneId: "Vanuatu", start: null, end: null),
  ],
  "Pacific/Enderbury": <MetazoneRange>[
    MetazoneRange(metazoneId: "Phoenix_Islands", start: null, end: null),
  ],
  "Pacific/Fakaofo": <MetazoneRange>[
    MetazoneRange(metazoneId: "Tokelau", start: null, end: null),
  ],
  "Pacific/Fiji": <MetazoneRange>[
    MetazoneRange(metazoneId: "Fiji", start: null, end: null),
  ],
  "Pacific/Funafuti": <MetazoneRange>[
    MetazoneRange(metazoneId: "Tuvalu", start: null, end: null),
  ],
  "Pacific/Galapagos": <MetazoneRange>[
    MetazoneRange(metazoneId: "Ecuador", start: null, end: 504939600000),
    MetazoneRange(metazoneId: "Galapagos", start: 504939600000, end: null),
  ],
  "Pacific/Gambier": <MetazoneRange>[
    MetazoneRange(metazoneId: "Gambier", start: null, end: null),
  ],
  "Pacific/Guadalcanal": <MetazoneRange>[
    MetazoneRange(metazoneId: "Solomon", start: null, end: null),
  ],
  "Pacific/Guam": <MetazoneRange>[
    MetazoneRange(metazoneId: "Guam", start: null, end: 977493600000),
    MetazoneRange(metazoneId: "Chamorro", start: 977493600000, end: null),
  ],
  "Pacific/Honolulu": <MetazoneRange>[
    MetazoneRange(metazoneId: "Hawaii", start: null, end: null),
  ],
  "Pacific/Kiritimati": <MetazoneRange>[
    MetazoneRange(metazoneId: "Line_Islands", start: null, end: null),
  ],
  "Pacific/Kosrae": <MetazoneRange>[
    MetazoneRange(metazoneId: "Kosrae", start: null, end: null),
  ],
  "Pacific/Kwajalein": <MetazoneRange>[
    MetazoneRange(metazoneId: "Kwajalein", start: null, end: 745934400000),
    MetazoneRange(
      metazoneId: "Marshall_Islands",
      start: 745934400000,
      end: null,
    ),
  ],
  "Pacific/Majuro": <MetazoneRange>[
    MetazoneRange(metazoneId: "Marshall_Islands", start: null, end: null),
  ],
  "Pacific/Marquesas": <MetazoneRange>[
    MetazoneRange(metazoneId: "Marquesas", start: null, end: null),
  ],
  "Pacific/Midway": <MetazoneRange>[
    MetazoneRange(metazoneId: "Bering", start: null, end: 436363200000),
    MetazoneRange(metazoneId: "Samoa", start: 436363200000, end: null),
  ],
  "Pacific/Nauru": <MetazoneRange>[
    MetazoneRange(metazoneId: "Nauru", start: null, end: null),
  ],
  "Pacific/Niue": <MetazoneRange>[
    MetazoneRange(metazoneId: "Niue", start: null, end: null),
  ],
  "Pacific/Norfolk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Norfolk", start: null, end: null),
  ],
  "Pacific/Noumea": <MetazoneRange>[
    MetazoneRange(metazoneId: "New_Caledonia", start: null, end: null),
  ],
  "Pacific/Pago_Pago": <MetazoneRange>[
    MetazoneRange(metazoneId: "Bering", start: null, end: 436363200000),
    MetazoneRange(metazoneId: "Samoa", start: 436363200000, end: null),
  ],
  "Pacific/Palau": <MetazoneRange>[
    MetazoneRange(metazoneId: "Palau", start: null, end: null),
  ],
  "Pacific/Pitcairn": <MetazoneRange>[
    MetazoneRange(metazoneId: "Pitcairn", start: null, end: null),
  ],
  "Pacific/Ponape": <MetazoneRange>[
    MetazoneRange(metazoneId: "Ponape", start: null, end: null),
  ],
  "Pacific/Port_Moresby": <MetazoneRange>[
    MetazoneRange(metazoneId: "Papua_New_Guinea", start: null, end: null),
  ],
  "Pacific/Rarotonga": <MetazoneRange>[
    MetazoneRange(metazoneId: "Cook", start: null, end: null),
  ],
  "Pacific/Saipan": <MetazoneRange>[
    MetazoneRange(metazoneId: "North_Mariana", start: null, end: 977493600000),
    MetazoneRange(metazoneId: "Chamorro", start: 977493600000, end: null),
  ],
  "Pacific/Tahiti": <MetazoneRange>[
    MetazoneRange(metazoneId: "Tahiti", start: null, end: null),
  ],
  "Pacific/Tarawa": <MetazoneRange>[
    MetazoneRange(metazoneId: "Gilbert_Islands", start: null, end: null),
  ],
  "Pacific/Tongatapu": <MetazoneRange>[
    MetazoneRange(metazoneId: "Tonga", start: null, end: null),
  ],
  "Pacific/Truk": <MetazoneRange>[
    MetazoneRange(metazoneId: "Truk", start: null, end: null),
  ],
  "Pacific/Wake": <MetazoneRange>[
    MetazoneRange(metazoneId: "Wake", start: null, end: null),
  ],
  "Pacific/Wallis": <MetazoneRange>[
    MetazoneRange(metazoneId: "Wallis", start: null, end: null),
  ],
};
