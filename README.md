# timezone_extensions

An add-on for [`package:timezone`](https://pub.dev/packages/timezone): convert a `TZDateTime` to another `Location`, and read English time zone names.

## Initialization

⚠️ Load the **`latest_all`** tzdata from `package:timezone`, not the default `latest`. `latest` omits tzdb links, including `Europe/Amsterdam`, `Europe/Stockholm`, and `US/Pacific`.

### VM and Flutter (including Flutter web)

```dart
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

void main() {
  tz.initializeTimeZones();
}
```

### Web (Dart)

```dart
import 'package:timezone/browser.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

Future<void> main() async {
  await tz.initializeTimeZone('packages/timezone/data/latest_all.tzf');
}
```

## API

### Time zone names

A `Location` is a place. A `TZDateTime` is a place **and** a moment.

- `Location.timeZoneGenericName` — one name all year (`Pacific Time`, `India Standard Time`); a zone that observes DST inside a metazone with no daylight name gets the standard name (`Europe/London` is `Greenwich Mean Time`).
- `TZDateTime.timeZoneSpecificName` — standard or daylight name at that moment: `Pacific Daylight Time`, `Central European Summer Time`.
- `TZDateTime.utcOffsetLabel` — `UTC-07`, `UTC+04:30`, `UTC`.

The name getters return `null` when CLDR has no label (or no daylight label during DST, as in Jersey in July). `timeZoneSpecificName ?? utcOffsetLabel` is never null. The abbreviation (`PDT`, `-03`) is `TZDateTime.timeZoneName` from `package:timezone`.

```dart
final officeLocation = getLocation('America/Los_Angeles');

print(officeLocation.name);                // America/Los_Angeles
print(officeLocation.timeZoneGenericName); // Pacific Time

final confCallStart = TZDateTime(officeLocation, 2026, 8, 14, 18, 30);

print(confCallStart);                      // 2026-08-14 18:30:00.000-0700
print(confCallStart.timeZoneSpecificName); // Pacific Daylight Time
print(confCallStart.timeZoneName);         // PDT
print(confCallStart.utcOffsetLabel);       // UTC-07
```

### Convert to another clock

- `TZDateTime.toLocation(location)` — the same instant on `location`'s clock, like `toUtc` / `toLocal`.
- `TZDateTime.offsetDifference(location)` — how far ahead `location`'s clock is at this instant (negative if behind). Not `difference`.

```dart
final clientLocation = getLocation('Australia/Sydney');
final confCallStartForClient = confCallStart.toLocation(clientLocation);

print(confCallStartForClient);                      // 2026-08-15 11:30:00.000+1000
print(confCallStartForClient.timeZoneSpecificName); // Australian Eastern Standard Time
print(confCallStartForClient.timeZoneName);         // AEST
print(confCallStartForClient.utcOffsetLabel);       // UTC+10
```

## Data

English names come from [Unicode CLDR](https://cldr.unicode.org). `cldrVersion` is that release, not the tzdb version in `package:timezone`. Offsets, DST rules, and abbreviations (`TZDateTime.timeZoneName`) come from `package:timezone`.

## Licenses

- **Code** — MIT ([`LICENSE`](https://github.com/pm-gwatch/timezone_extensions/blob/main/LICENSE)).
- **CLDR English names** — Unicode License v3 ([`THIRD_PARTY_LICENSES`](https://github.com/pm-gwatch/timezone_extensions/blob/main/THIRD_PARTY_LICENSES)).
