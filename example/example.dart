import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

void main() {
  tz.initializeTimeZones();

  final paris = getLocation('Europe/Paris');
  final newYork = getLocation('America/New_York');

  print('${paris.name} → ${paris.timeZoneGenericName}');
  // Europe/Paris → Central European Time

  final takeOff = TZDateTime(paris, 2026, 8, 23, 10, 15);
  final there = takeOff.toLocation(newYork);

  print(takeOff); // 2026-08-23 10:15:00.000+0200
  print(takeOff.timeZoneLongName); // Central European Summer Time
  print(takeOff.utcOffsetLabel); // UTC+02

  print(there); // 2026-08-23 04:15:00.000-0400
  print(there.timeZoneLongName); // Eastern Daylight Time
  print(there.utcOffsetLabel); // UTC-04

  print(takeOff.offsetDifference(newYork)); // -6:00:00.000000
  print('CLDR: $cldrVersion');
}
