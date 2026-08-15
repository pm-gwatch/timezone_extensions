/// Makes `package:timezone` easier to use: convert a [TZDateTime] from one
/// [Location] to another, and read English time zone labels.
///
/// ```dart
/// final paris = getLocation('Europe/Paris');
/// final newYork = getLocation('America/New_York');
///
/// paris.timeZoneGenericName; // 'Central European Time'
///
/// final takeOff = TZDateTime(paris, 2026, 8, 23, 10, 15);
/// takeOff.toLocation(newYork); // 04:15, the same moment
/// takeOff.timeZoneLongName;    // 'Central European Summer Time'
/// takeOff.utcOffsetLabel;      // 'UTC+02'
/// ```
///
/// Initialize **`latest_all`** tzdata first. `latest` drops the tzdb link
/// identifiers. Convert across places with
/// [TZDateTimeAcrossLocations.toLocation].
library;

export 'src/timezone_extensions.dart'
    show
        LocationZoneNames,
        TZDateTimeAcrossLocations,
        TZDateTimeZoneNames,
        formatUtcOffset,
        cldrVersion;
