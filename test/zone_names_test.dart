// Contract tests for Location / TZDateTime English zone-name getters.

import 'package:test/test.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/src/timezone_extensions.dart';
import 'package:timezone_extensions/src/generated/metazone_data.dart';

void main() {
  setUpAll(tzdata.initializeTimeZones);

  group('Location.timeZoneGenericName', () {
    test('Europe/Zurich → Central European Time', () {
      expect(
        getLocation('Europe/Zurich').timeZoneGenericName,
        'Central European Time',
      );
    });

    test('America/Santiago → Chile Time', () {
      expect(getLocation('America/Santiago').timeZoneGenericName, 'Chile Time');
    });

    test('Europe/London → Greenwich Mean Time (GMT metazone standard)', () {
      expect(
        getLocation('Europe/London').timeZoneGenericName,
        'Greenwich Mean Time',
      );
    });

    test('Europe/Jersey → Greenwich Mean Time all year', () {
      expect(
        getLocation('Europe/Jersey').timeZoneGenericName,
        'Greenwich Mean Time',
      );
    });

    test('Etc/UTC → Coordinated Universal Time (zone-level only)', () {
      expect(
        getLocation('Etc/UTC').timeZoneGenericName,
        'Coordinated Universal Time',
      );
    });

    test('Asia/Kolkata joins via BCP-47 to India Standard Time', () {
      // India has no CLDR generic and no daylight name, so standard is the
      // season-neutral label.
      expect(
        getLocation('Asia/Kolkata').timeZoneGenericName,
        'India Standard Time',
      );
    });

    test('Europe/Kyiv joins via BCP-47 to Eastern European Time', () {
      expect(
        getLocation('Europe/Kyiv').timeZoneGenericName,
        'Eastern European Time',
      );
    });

    test('Asia/Amman now → null (no current metazone)', () {
      expect(getLocation('Asia/Amman').timeZoneGenericName, isNull);
    });

    test('Africa/Casablanca now → null', () {
      expect(getLocation('Africa/Casablanca').timeZoneGenericName, isNull);
    });

    test('Asia/Urumqi now → null (unnamed metazone in en-001)', () {
      expect(getLocation('Asia/Urumqi').timeZoneGenericName, isNull);
    });
  });

  group('TZDateTime.timeZoneLongName', () {
    test('Zurich January → Central European Standard Time', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 1, 15, 12);
      expect(z.timeZoneLongName, 'Central European Standard Time');
    });

    test('Zurich July → Central European Summer Time', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 7, 15, 12);
      expect(z.timeZoneLongName, 'Central European Summer Time');
    });

    test('London January → Greenwich Mean Time', () {
      final z = TZDateTime(getLocation('Europe/London'), 2026, 1, 15, 12);
      expect(z.timeZoneLongName, 'Greenwich Mean Time');
    });

    test('London July → British Summer Time', () {
      final z = TZDateTime(getLocation('Europe/London'), 2026, 7, 15, 12);
      expect(z.timeZoneLongName, 'British Summer Time');
    });

    test('Dublin July → Irish Standard Time', () {
      final z = TZDateTime(getLocation('Europe/Dublin'), 2026, 7, 15, 12);
      expect(z.timeZoneLongName, 'Irish Standard Time');
    });

    test('Jersey July → null (DST, no daylight string)', () {
      final z = TZDateTime(getLocation('Europe/Jersey'), 2026, 7, 15, 12);
      expect(z.timeZone.isDst, isTrue);
      expect(z.timeZoneLongName, isNull);
    });

    test('Troll July → null', () {
      final z = TZDateTime(getLocation('Antarctica/Troll'), 2026, 7, 15, 12);
      expect(z.timeZoneLongName, isNull);
    });

    test('Kyiv January / July Eastern European Standard / Summer', () {
      final jan = TZDateTime(getLocation('Europe/Kyiv'), 2026, 1, 15, 12);
      final jul = TZDateTime(getLocation('Europe/Kyiv'), 2026, 7, 15, 12);
      expect(jan.timeZoneLongName, 'Eastern European Standard Time');
      expect(jul.timeZoneLongName, 'Eastern European Summer Time');
    });

    test('Amman 2021 still had Eastern European names', () {
      final jan = TZDateTime(getLocation('Asia/Amman'), 2021, 1, 15, 12);
      final jul = TZDateTime(getLocation('Asia/Amman'), 2021, 7, 15, 12);
      expect(jan.timeZoneLongName, 'Eastern European Standard Time');
      expect(jul.timeZoneLongName, 'Eastern European Summer Time');
    });
  });

  group('TZDateTime.utcOffsetLabel', () {
    test('Zurich July → UTC+02 (not CEST)', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 7, 15, 12);
      expect(z.timeZoneName, 'CEST');
      expect(z.utcOffsetLabel, 'UTC+02');
    });

    test('matches formatUtcOffset(timeZoneOffset)', () {
      final z = TZDateTime(getLocation('Asia/Kolkata'), 2026, 9, 9, 12);
      expect(z.utcOffsetLabel, formatUtcOffset(z.timeZoneOffset));
      expect(z.utcOffsetLabel, 'UTC+05:30');
    });

    test('Santiago January → UTC-03, July → UTC-04', () {
      final jan = TZDateTime(getLocation('America/Santiago'), 2026, 1, 15, 12);
      final jul = TZDateTime(getLocation('America/Santiago'), 2026, 7, 15, 12);
      expect(jan.utcOffsetLabel, 'UTC-03');
      expect(jul.utcOffsetLabel, 'UTC-04');
    });

    test('Azores July → UTC', () {
      final z = TZDateTime(getLocation('Atlantic/Azores'), 2026, 7, 15, 12);
      expect(z.utcOffsetLabel, 'UTC');
    });

    test('answers for zones with no CLDR long name', () {
      final casablanca = TZDateTime(
        getLocation('Africa/Casablanca'),
        2026,
        7,
        15,
        12,
      );
      final amman = TZDateTime(getLocation('Asia/Amman'), 2026, 7, 15, 12);
      final utc = TZDateTime(getLocation('Etc/UTC'), 2026, 7, 15, 12);

      expect(casablanca.timeZoneLongName, isNull);
      expect(casablanca.utcOffsetLabel, 'UTC+01');
      expect(amman.timeZoneLongName, isNull);
      expect(amman.utcOffsetLabel, 'UTC+03');
      expect(utc.utcOffsetLabel, 'UTC');
    });
  });

  group('CLDR timestamp parsing', () {
    test('UTC start/end half-open boundaries', () {
      // Europe/Zurich → Europe_Central from 1979-04-01 01:00 UTC onward in
      // modern ranges; pick a known edge from generated data.
      final ranges = zoneMetazoneHistory['Europe/Zurich']!;
      final last = ranges.last;
      expect(last.metazoneId, 'Europe_Central');
      expect(last.end, isNull);
      if (last.start != null) {
        expect(metazoneIdAt('Europe/Zurich', last.start!), 'Europe_Central');
        expect(
          metazoneIdAt('Europe/Zurich', last.start! - 1),
          isNot(equals('Europe_Central')),
        );
      }
    });
  });

  group('coverage', () {
    test('Location name null only for known CLDR gaps', () {
      const expectedNull = {
        'Africa/Casablanca',
        'Africa/El_Aaiun',
        'America/Coyhaique',
        'America/Punta_Arenas',
        'Antarctica/Palmer',
        'Asia/Amman',
        'Asia/Damascus',
        'Asia/Kashgar',
        'Asia/Urumqi',
        'Etc/GMT+1',
        'Etc/GMT+10',
        'Etc/GMT+11',
        'Etc/GMT+12',
        'Etc/GMT+2',
        'Etc/GMT+3',
        'Etc/GMT+4',
        'Etc/GMT+5',
        'Etc/GMT+6',
        'Etc/GMT+7',
        'Etc/GMT+8',
        'Etc/GMT+9',
        'Etc/GMT-1',
        'Etc/GMT-10',
        'Etc/GMT-11',
        'Etc/GMT-12',
        'Etc/GMT-13',
        'Etc/GMT-14',
        'Etc/GMT-2',
        'Etc/GMT-3',
        'Etc/GMT-4',
        'Etc/GMT-5',
        'Etc/GMT-6',
        'Etc/GMT-7',
        'Etc/GMT-8',
        'Etc/GMT-9',
        'Factory',
        'Pacific/Bougainville',
      };
      final actualNull = <String>[];
      for (final id in timeZoneDatabase.locations.keys) {
        final name = getLocation(id).timeZoneGenericName;
        if (name == null) actualNull.add(id);
      }
      expect(actualNull.toSet(), expectedNull);
    });

    test('TZDateTime long name null only for known CLDR gaps', () {
      // January matches the Location allow-list. July adds the four zones
      // that observe DST without a CLDR daylight string.
      const expectedJanuary = {
        'Africa/Casablanca',
        'Africa/El_Aaiun',
        'America/Coyhaique',
        'America/Punta_Arenas',
        'Antarctica/Palmer',
        'Asia/Amman',
        'Asia/Damascus',
        'Asia/Kashgar',
        'Asia/Urumqi',
        'Etc/GMT+1',
        'Etc/GMT+10',
        'Etc/GMT+11',
        'Etc/GMT+12',
        'Etc/GMT+2',
        'Etc/GMT+3',
        'Etc/GMT+4',
        'Etc/GMT+5',
        'Etc/GMT+6',
        'Etc/GMT+7',
        'Etc/GMT+8',
        'Etc/GMT+9',
        'Etc/GMT-1',
        'Etc/GMT-10',
        'Etc/GMT-11',
        'Etc/GMT-12',
        'Etc/GMT-13',
        'Etc/GMT-14',
        'Etc/GMT-2',
        'Etc/GMT-3',
        'Etc/GMT-4',
        'Etc/GMT-5',
        'Etc/GMT-6',
        'Etc/GMT-7',
        'Etc/GMT-8',
        'Etc/GMT-9',
        'Factory',
        'Pacific/Bougainville',
      };
      const expectedJuly = {
        ...expectedJanuary,
        'Antarctica/Troll',
        'Europe/Guernsey',
        'Europe/Isle_of_Man',
        'Europe/Jersey',
      };

      Set<String> nullAt(int month) {
        final actual = <String>{};
        for (final id in timeZoneDatabase.locations.keys) {
          final t = TZDateTime(getLocation(id), 2026, month, 15, 12);
          if (t.timeZoneLongName == null) actual.add(id);
        }
        return actual;
      }

      expect(nullAt(1), expectedJanuary);
      expect(nullAt(7), expectedJuly);
    });
  });

  group('formatUtcOffset', () {
    test('zero / whole hours / half hours', () {
      expect(formatUtcOffset(Duration.zero), 'UTC');
      expect(formatUtcOffset(const Duration(hours: 4)), 'UTC+04');
      expect(
        formatUtcOffset(const Duration(hours: 4, minutes: 30)),
        'UTC+04:30',
      );
      expect(formatUtcOffset(const Duration(hours: -3)), 'UTC-03');
    });

    test('a negative offset with minutes keeps the sign out of the minutes', () {
      // The one shape that can regress unnoticed: the sign is taken from the
      // total and the parts come from its absolute value, so a slip here reads
      // 'UTC-03:-30'. Newfoundland is the real zone that exercises it.
      expect(
        formatUtcOffset(const Duration(hours: -3, minutes: -30)),
        'UTC-03:30',
      );
      expect(
        formatUtcOffset(const Duration(hours: -9, minutes: -30)),
        'UTC-09:30',
      );
    });

    test('quarter-hour offsets, which exist and are not half hours', () {
      expect(
        formatUtcOffset(const Duration(hours: 5, minutes: 45)),
        'UTC+05:45',
      );
      expect(
        formatUtcOffset(const Duration(hours: 12, minutes: 45)),
        'UTC+12:45',
      );
    });

    test('offsets past nine hours keep two digits, not three', () {
      expect(formatUtcOffset(const Duration(hours: 13)), 'UTC+13');
      expect(formatUtcOffset(const Duration(hours: -11)), 'UTC-11');
    });
  });

  group('utcOffsetLabel on real zones with awkward offsets', () {
    test('America/St_Johns is a negative half hour', () {
      final stJohns = getLocation('America/St_Johns');
      expect(TZDateTime(stJohns, 2026, 1, 15).utcOffsetLabel, 'UTC-03:30');
      expect(TZDateTime(stJohns, 2026, 7, 15).utcOffsetLabel, 'UTC-02:30');
    });

    test('Asia/Kathmandu is a quarter hour', () {
      expect(
        TZDateTime(getLocation('Asia/Kathmandu'), 2026, 7, 15).utcOffsetLabel,
        'UTC+05:45',
      );
    });

    test('Pacific/Kiritimati is past twelve', () {
      expect(
        TZDateTime(
          getLocation('Pacific/Kiritimati'),
          2026,
          7,
          15,
        ).utcOffsetLabel,
        'UTC+14',
      );
    });
  });

  group('export', () {
    test('cldrVersion is exported', () {
      expect(cldrVersion, isNotEmpty);
    });
  });
}
