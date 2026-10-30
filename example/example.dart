import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

void main() {
  tz.initializeTimeZones();

  final paris = getLocation('Europe/Paris');
  final newYork = getLocation('America/New_York');

  print('${paris.name} → ${paris.timeZoneGenericName}');
  // Europe/Paris → Central European Time
  print('${newYork.name} → ${newYork.timeZoneGenericName}');
  // America/New_York → Eastern Time

  final takeOff = TZDateTime(paris, 2026, 8, 23, 10, 15);

  print(takeOff); // 2026-08-23 10:15:00.000+0200
  print(takeOff.timeZoneSpecificName); // Central European Summer Time
  print(takeOff.utcOffsetLabel); // UTC+02

  final flightDuration = Duration(hours: 8, minutes: 30);
  final arrival = takeOff.add(flightDuration).toLocation(newYork);

  print(arrival); // 2026-08-23 12:45:00.000-0400
  print(arrival.timeZoneSpecificName); // Eastern Daylight Time
  print(arrival.utcOffsetLabel); // UTC-04

  print('Unicode CLDR: $cldrVersion');
}
