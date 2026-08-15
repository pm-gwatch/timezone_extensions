# timezone_extensions

An add-on for [`package:timezone`](https://pub.dev/packages/timezone). It converts a `TZDateTime` from one `Location` to another and reads English time zone names.

## Initialization

⚠️ Load **`latest_all`** tzdata from `package:timezone` first. `latest` drops the tzdb link identifiers.

### VM, CLI, server, Flutter mobile and desktop

```dart
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

void main() {
  tz.initializeTimeZones();
}
```

### Dart web and Flutter web

⚠️ The browser default is `latest.tzf` → Pass `latest_all.tzf`.

```dart
import 'package:timezone/browser.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

Future<void> main() async {
  await tz.initializeTimeZone('packages/timezone/data/latest_all.tzf');
}
```

## API

### Get time zone names

A `Location` is a place. A `TZDateTime` is a place **and** a moment.

- `Location.timeZoneGenericName` — CLDR generic, or standard when the zone is not seasonal (`Pacific Time`, `Azerbaijan Time`). `null` for a handful of zones CLDR leaves unnamed.
- `TZDateTime.timeZoneLongName` — name at this instant (`Pacific Daylight Time`, `Central European Summer Time`). `null` in a few cases; `timeZoneLongName ?? utcOffsetLabel` is never null.
- `TZDateTime.utcOffsetLabel` — `UTC-07` / `UTC+04:30` / `UTC`.
- `formatUtcOffset(Duration)` — the same formatter, for any offset.

> `TZDateTime.timeZoneName` is already on `package:timezone` (tzdb abbreviation: `PDT`, or a numeric form like `-03`).

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

### Convert the same instant to another clock

`toLocation` is the `Location` analogue of `toUtc` / `toLocal`. `offsetDifference` is the signed gap between the two offsets at that instant — not travel time, and not `TZDateTime.difference` (elapsed time). Use `.abs()` for a directionless magnitude.

```dart
final hotel = getLocation('Australia/Sydney');
final callInSydney = call.toLocation(hotel);

print(callInSydney);                  // 2026-08-15 11:30:00.000+1000
print(callInSydney.timeZoneLongName); // Australian Eastern Standard Time
print(callInSydney.timeZoneName);     // AEST
print(callInSydney.utcOffsetLabel);   // UTC+10

print(call.offsetDifference(hotel));  // 17:00:00.000000 — Sydney is ahead
```

Shipped data version: `cldrVersion`. It is independent of the tzdb version inside `package:timezone`.

## Data used

| Dataset | Source | What it answers |
| --- | --- | --- |
| English names | [Unicode CLDR](https://cldr.unicode.org) | `Pacific Time`, `Central European Summer Time`, … |
| Zone rules | `package:timezone` (IANA tzdb) | Offsets, DST, abbreviations |

Regenerate the CLDR tables with `dart run tool/generate_metazone_data.dart`.

## Licenses

- **Code** — MIT ([`LICENSE`](https://github.com/pm-gwatch/timezone_extensions/blob/main/LICENSE)).
- **CLDR English names** — Unicode License v3 ([`THIRD_PARTY_LICENSES`](https://github.com/pm-gwatch/timezone_extensions/blob/main/THIRD_PARTY_LICENSES)).
