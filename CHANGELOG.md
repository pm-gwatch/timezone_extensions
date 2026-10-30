## 0.2.0

- `Location.timeZoneGenericName` and `TZDateTime.timeZoneSpecificName` are Unicode CLDR's pair of long names. Generic is the name of a place, the same all year (`Pacific Time`). Specific is the standard or daylight name at an instant (`Pacific Daylight Time`). `TZDateTime.timeZoneLongName` was the specific name. It is deprecated and forwards to `timeZoneSpecificName`.
- `formatUtcOffset` is no longer public.

## 0.1.0

- Initial version.
