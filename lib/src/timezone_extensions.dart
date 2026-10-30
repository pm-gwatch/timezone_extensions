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
  /// English long name for this place as of now, the same string in summer
  /// and winter, or `null` if CLDR has none.
  ///
  /// The metazone's generic name when it has one (*Central European Time*).
  /// Otherwise the standard name (*India Standard Time*), including where
  /// this zone observes DST and the metazone has no daylight name. In CLDR
  /// 48 that is *Greenwich Mean Time* all year for London, Dublin, Jersey,
  /// Guernsey, the Isle of Man, and Antarctica/Troll. A metazone with a
  /// daylight name and no generic would return null rather than the winter
  /// label. A zone-level summer overlay (*British Summer Time*) does not
  /// replace this name.
  ///
  /// No abbreviation on [Location] — use [TZDateTime.timeZoneName] at an
  /// instant.
  String? get timeZoneGenericName =>
      // CLDR keeps dated metazone memberships; now picks the current one.
      genericNameAt(name, DateTime.timestamp().millisecondsSinceEpoch);
}

/// [LocationZoneNames.timeZoneGenericName] for [ianaId] at [utcMilliseconds]
/// instead of now, so the rule can be checked at fixed instants.
String? genericNameAt(String ianaId, int utcMilliseconds) {
  final lookup = _mergedLongNames(ianaId, utcMilliseconds);
  if (lookup.names.generic != null) return lookup.names.generic;
  if (lookup.meta?.daylight != null) return null;
  return lookup.names.standard;
}

/// English labels for a [TZDateTime] at its instant.
extension TZDateTimeZoneNames on TZDateTime {
  /// CLDR long specific name at this instant, or `null` if CLDR has none.
  ///
  /// The daylight string when [TimeZone.isDst] is true (*Pacific Daylight
  /// Time*), or `null` if that string is missing. Otherwise `standard ??
  /// generic` (*Pacific Standard Time*). For a label that is never null, use
  /// `timeZoneSpecificName ?? utcOffsetLabel`.
  ///
  /// The string is CLDR's label, not a DST flag: Dublin's daylight name is
  /// *Irish Standard Time*. To branch on daylight saving, read
  /// [TimeZone.isDst]. Zone overlays are undated, so a daylight string can
  /// label an earlier metazone: Dublin in July 1920 is *Irish Standard Time*,
  /// and the tzdb abbreviation is `BST`.
  String? get timeZoneSpecificName {
    final names = _mergedLongNames(location.name, millisecondsSinceEpoch).names;
    if (timeZone.isDst) return names.daylight;
    return names.standard ?? names.generic;
  }

  /// CLDR long specific name at this instant.
  ///
  /// Use [timeZoneSpecificName] instead.
  @Deprecated('Use timeZoneSpecificName instead.')
  String? get timeZoneLongName => timeZoneSpecificName;

  /// Numeric UTC label at this instant: `UTC`, `UTC+04`, `UTC+04:30`, or
  /// `UTC-03`.
  ///
  /// Truncated to whole minutes. Never a letter code like `CEST`. Use
  /// [TZDateTime.timeZoneOffset] for the exact [Duration];
  /// [TZDateTimeAcrossLocations.offsetDifference] for the gap to another
  /// place.
  String get utcOffsetLabel => _formatUtcOffset(timeZoneOffset);
}

/// CLDR zone overlay plus the metazone record at [utcMilliseconds].
///
/// `ianaToCldrZoneKey[ianaId] ?? ianaId` is the CLDR zone id. Both tables
/// are keyed by that id.
({MetazoneLongNames names, MetazoneLongNames? meta}) _mergedLongNames(
  String ianaId,
  int utcMilliseconds,
) {
  final cldrKey = ianaToCldrZoneKey[ianaId] ?? ianaId;
  final metazoneId = metazoneIdAt(cldrKey, utcMilliseconds);
  final zone = zoneLongNames[cldrKey];
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

/// Metazone id whose half-open UTC range contains [utcMilliseconds], or `null`
/// if [cldrZoneKey] belongs to no metazone at that instant.
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
String _formatUtcOffset(Duration duration) {
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
