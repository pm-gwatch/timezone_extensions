// Location / TZDateTime helpers: toLocation, offsetDifference.
// Uses latest_all (latest is a separate process in timezone_finder).

import 'package:test/test.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';

void main() {
  // Bound in setUpAll, not at declaration: group bodies run while tests are
  // being collected, which is before any setUpAll has initialized the
  // database.
  late final Location paris;
  late final Location newYork;
  late final Location tokyo;
  late final Location kathmandu;
  late final Location niue;
  late final Location kiritimati;

  setUpAll(() {
    tzdata.initializeTimeZones();
    paris = getLocation('Europe/Paris');
    newYork = getLocation('America/New_York');
    tokyo = getLocation('Asia/Tokyo');
    kathmandu = getLocation('Asia/Kathmandu');
    niue = getLocation('Pacific/Niue');
    kiritimati = getLocation('Pacific/Kiritimati');
  });

  group('TZDateTime.toLocation', () {
    test('keeps the instant and changes the wall clock', () {
      final takeOff = TZDateTime(paris, 2026, 8, 23, 10, 15);
      final there = takeOff.toLocation(newYork);

      expect(
        there.millisecondsSinceEpoch,
        takeOff.millisecondsSinceEpoch,
        reason: 'toLocation must not move the moment',
      );
      expect(there.location, same(newYork));
      expect(there.hour, 4); // 10:15 CEST is 04:15 EDT
      expect(there.day, 23);
    });

    test('crosses the date line where the zones require it', () {
      final evening = TZDateTime(paris, 2026, 8, 23, 23, 30);
      expect(evening.toLocation(tokyo).day, 24);
      expect(evening.toLocation(newYork).day, 23);
    });

    test('is a no-op onto its own location', () {
      final start = TZDateTime(paris, 2026, 8, 23, 17, 30);
      expect(start.toLocation(paris), start);
    });

    test('tracks daylight saving rather than a fixed offset', () {
      // The reason a Location is not an offset: the same pair of zones is
      // 6 hours apart in August and 6 hours apart in January only because
      // both happen to shift. New York alone moves by an hour.
      final summer = TZDateTime(paris, 2026, 8, 23, 12).toLocation(newYork);
      final winter = TZDateTime(paris, 2026, 1, 23, 12).toLocation(newYork);
      expect(summer.timeZoneOffset, const Duration(hours: -4));
      expect(winter.timeZoneOffset, const Duration(hours: -5));
    });
  });

  group('TZDateTime.offsetDifference', () {
    test('positive when the other location is ahead', () {
      final call = TZDateTime(paris, 2026, 8, 3, 15);
      expect(call.offsetDifference(tokyo), const Duration(hours: 7));
    });

    test('preserves sub-hour offsets', () {
      final call = TZDateTime(paris, 2026, 8, 1, 12);
      expect(
        call.offsetDifference(kathmandu),
        const Duration(hours: 3, minutes: 45),
      );
    });

    test('preserves gaps larger than a day', () {
      final call = TZDateTime(niue, 2026, 8, 1, 12);
      expect(call.offsetDifference(kiritimati), const Duration(hours: 25));
    });

    test('changes exactly at a DST transition', () {
      final before = TZDateTime.from(
        DateTime.utc(2026, 3, 29, 0, 59, 59, 999),
        paris,
      );
      final after = TZDateTime.from(DateTime.utc(2026, 3, 29, 1), paris);
      expect(before.offsetDifference(tokyo), const Duration(hours: 8));
      expect(after.offsetDifference(tokyo), const Duration(hours: 7));
    });

    test('is zero for the same location', () {
      final call = TZDateTime(paris, 2026, 8, 3, 15);
      expect(call.offsetDifference(paris), Duration.zero);
    });

    test('is the negation of the reverse pair', () {
      final call = TZDateTime(paris, 2026, 8, 3, 15);
      expect(
        call.offsetDifference(newYork),
        -call.toLocation(newYork).offsetDifference(paris),
      );
      // Both sides must read the same instant. Noon in Niue and noon in
      // Kiritimati are 25 hours apart, so comparing those two would test the
      // stability of the pair rather than the sign convention.
      final noon = TZDateTime(niue, 2026, 8, 1, 12);
      expect(
        noon.offsetDifference(kiritimati),
        -noon.toLocation(kiritimati).offsetDifference(niue),
      );
    });
  });

  // There is no Location.offsetDifference: a clock gap is a fact about an
  // instant, and TZDateTime is the receiver that carries one. Holding two
  // places and no moment, ask TZDateTime.now(a).offsetDifference(b).
}
