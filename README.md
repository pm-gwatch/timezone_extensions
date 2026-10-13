# timezone_extensions

An add-on for [`package:timezone`](https://pub.dev/packages/timezone): convert a `TZDateTime` to another `Location`, and read English time zone names.

These helpers first shipped in [`timezone_finder` 0.2.0](https://pub.dev/packages/timezone_finder/versions/0.2.0). They live here so you can use them without its `Location` search.

## Initialization

⚠️ Load the **`latest_all`** tzdata from `package:timezone`, not the default `latest`, which drops the tzdb link identifiers.

### Native (VM, Flutter mobile and desktop)

```dart
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

void main() {
  tz.initializeTimeZones();
}
```

### Web (Dart and Flutter)

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

- `Location.timeZoneGenericName` — season-neutral name: `Pacific Time`, `India Standard Time`.
- `TZDateTime.timeZoneLongName` — name at that moment: `Pacific Daylight Time`, `Central European Summer Time`.
- `TZDateTime.utcOffsetLabel` — `UTC-07`, `UTC+04:30`, `UTC`.
- `formatUtcOffset(Duration)` — the same label for any offset.

Both are `null` for the few zones CLDR leaves unnamed. `timeZoneLongName` is also `null` during daylight saving time when CLDR has no daylight name, as in Jersey in July. `timeZoneLongName ?? utcOffsetLabel` is never null. The abbreviation (`PDT`, `-03`) is `TZDateTime.timeZoneName`, already in `package:timezone`.

```dart
final home = getLocation('America/Los_Angeles');

print('${home.name} → ${home.timeZoneGenericName}');
// America/Los_Angeles → Pacific Time

final call = TZDateTime(home, 2026, 8, 14, 18, 30);

print(call);                  // 2026-08-14 18:30:00.000-0700
print(call.timeZoneLongName); // Pacific Daylight Time
print(call.timeZoneName);     // PDT
print(call.utcOffsetLabel);   // UTC-07
```

### Convert to another clock

- `toLocation(location)` — the same instant on `location`'s clock, like `toUtc` / `toLocal`.
- `offsetDifference(location)` — how far ahead `location`'s clock is at this instant (negative if behind). Not elapsed time: that is `difference`.

```dart
final hotel = getLocation('Australia/Sydney');
final callInSydney = call.toLocation(hotel);

print(callInSydney);                  // 2026-08-15 11:30:00.000+1000
print(callInSydney.timeZoneLongName); // Australian Eastern Standard Time
print(callInSydney.timeZoneName);     // AEST
print(callInSydney.utcOffsetLabel);   // UTC+10

print(call.offsetDifference(hotel));  // 17:00:00.000000 — Sydney is ahead
```

## Data

| Dataset | Source | Used for |
| --- | --- | --- |
| English names | [Unicode CLDR](https://cldr.unicode.org) | `Pacific Time`, `Central European Summer Time`, … |
| Zone rules | `package:timezone` (IANA tzdb) | Offsets, DST, abbreviations |

`cldrVersion` reports the bundled CLDR release, independent of the tzdb version in `package:timezone`. Regenerate the CLDR tables with `dart run tool/generate_metazone_data.dart`.

## Licenses

- **Code** — MIT ([`LICENSE`](https://github.com/pm-gwatch/timezone_extensions/blob/main/LICENSE)).
- **CLDR English names** — Unicode License v3 ([`THIRD_PARTY_LICENSES`](https://github.com/pm-gwatch/timezone_extensions/blob/main/THIRD_PARTY_LICENSES)).
