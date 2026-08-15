/// [TZDateTime] → another clock, English CLDR labels on [Location] and
/// [TZDateTime].
library;

import 'package:timezone/timezone.dart';

import 'generated/metazone_data.dart';

export 'generated/metazone_data.dart' show cldrVersion;

/// Relates this instant to another place: its wall clock, and its offset.
extension TZDateTimeAcrossLocations on TZDateTime {
  /// This same instant on [location]'s clock — the [Location] analogue of
  /// [TZDateTime.toUtc] and [TZDateTime.toLocal].
  ///
  /// ```dart
  /// final takeOff = TZDateTime(paris, 2026, 8, 23, 10, 15);
  /// takeOff.toLocation(newYork); // 04:15, the same moment
  /// ```
  ///
  /// The instant is preserved. To keep the wall clock and change the moment,
  /// construct a new [TZDateTime] with the other location.
  TZDateTime toLocation(Location location) => TZDateTime.from(this, location);

  /// Signed gap between this clock's offset and [location]'s at this
  /// instant (positive = [location] ahead).
  ///
  /// Not travel time and not [TZDateTime.difference]. Equals
  /// `toLocation(location).timeZoneOffset - timeZoneOffset`; use `.abs()` for
  /// a directionless magnitude.
  ///
  /// ```dart
  /// final call = TZDateTime(paris, 2026, 8, 3, 15);
  /// call.offsetDifference(tokyo); // 7 hours
  /// ```
  Duration offsetDifference(Location location) =>
      toLocation(location).timeZoneOffset - timeZoneOffset;
}

/// English display name for a [Location].
///
/// Paris, Madrid and Zurich share *Central European Time*: CLDR's
/// season-neutral label for that group.
extension LocationZoneNames on Location {
  /// Season-neutral English long name as of now, or `null` if CLDR has none.
  ///
  /// Generic when present (*Central European Time*). Else standard, but only
  /// if that group has no daylight name (*India Standard Time*). A DST group
  /// with no generic is not given the winter label all year. Zone-level summer
  /// overlays (*British Summer Time*) do not hide this label.
  ///
  /// Not DST-aware. No abbreviation on [Location] — use
  /// [TZDateTime.timeZoneName] at an instant.
  String? get timeZoneGenericName {
    // CLDR keeps dated metazone memberships; now picks the current one.
    final now = DateTime.timestamp().millisecondsSinceEpoch;
    final lookup = _mergedLongNames(name, now);
    if (lookup.names.generic != null) return lookup.names.generic;
    if (lookup.meta?.daylight != null) return null;
    return lookup.names.standard;
  }
}

/// English labels for a [TZDateTime] at its instant.
extension TZDateTimeZoneNames on TZDateTime {
  /// English long name at this instant from CLDR, or `null` if CLDR has none.
  ///
  /// Uses the daylight string when [TimeZone.isDst] is true (and returns
  /// `null` if that string is missing — no fallback to standard); otherwise
  /// `standard ?? generic`. For a label that is never null, use
  /// `timeZoneLongName ?? utcOffsetLabel`.
  String? get timeZoneLongName {
    final names = _mergedLongNames(location.name, millisecondsSinceEpoch).names;
    if (timeZone.isDst) return names.daylight;
    return names.standard ?? names.generic;
  }

  /// Numeric UTC label at this instant. See [formatUtcOffset].
  ///
  /// Never a letter code like `CEST`. Use `timeZoneOffset` for the exact
  /// [Duration]; [TZDateTimeAcrossLocations.offsetDifference] for the gap to
  /// another place.
  String get utcOffsetLabel => formatUtcOffset(timeZoneOffset);
}

/// CLDR zone overlay plus the metazone record at [utcMilliseconds].
({MetazoneLongNames names, MetazoneLongNames? meta}) _mergedLongNames(
  String ianaId,
  int utcMilliseconds,
) {
  final cldrKey = ianaToCldrZoneKey[ianaId] ?? ianaId;
  final metazoneId = metazoneIdAt(cldrKey, utcMilliseconds);
  final zone = zoneLongNames[cldrKey] ?? zoneLongNames[ianaId];
  final meta = metazoneId == null ? null : metazoneLongNames[metazoneId];
  return (
    names: MetazoneLongNames(
      generic: zone?.generic ?? meta?.generic,
      standard: zone?.standard ?? meta?.standard,
      daylight: zone?.daylight ?? meta?.daylight,
    ),
    meta: meta,
  );
}

/// Metazone id whose half-open UTC range contains [utcMilliseconds].
String? metazoneIdAt(String cldrZoneKey, int utcMilliseconds) {
  final ranges = zoneMetazoneHistory[cldrZoneKey];
  if (ranges == null) return null;
  for (final range in ranges) {
    final start = range.start;
    final end = range.end;
    if (start != null && utcMilliseconds < start) continue;
    if (end != null && utcMilliseconds >= end) continue;
    return range.metazoneId;
  }
  return null;
}

/// Formats a UTC offset as `UTC`, `UTC+04`, `UTC+04:30`, or `UTC-03`.
///
/// Truncated to whole minutes. Pre-standardisation leftovers (Paris 1880
/// `0:09:21`) print as `UTC+00:09`. Truncating, not rounding, avoids inventing
/// a minute.
String formatUtcOffset(Duration duration) {
  // Driven off inMinutes so the truncation is visible rather than falling out
  // of the arithmetic below.
  final totalMinutes = duration.inMinutes;
  if (totalMinutes == 0) return 'UTC';
  final sign = totalMinutes.isNegative ? '-' : '+';
  final abs = totalMinutes.abs();
  final hours = abs ~/ 60;
  final minutes = abs % 60;
  final hourPart = hours.toString().padLeft(2, '0');
  if (minutes == 0) return 'UTC$sign$hourPart';
  final minutePart = minutes.toString().padLeft(2, '0');
  return 'UTC$sign$hourPart:$minutePart';
}
