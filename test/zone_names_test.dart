// Contract tests for Location / TZDateTime English zone-name getters and
// utcOffsetLabel. The public API comes from the public library; only the
// instant-taking lookups and the history table are reached into src/.

import 'package:test/test.dart';
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart';
import 'package:timezone_extensions/timezone_extensions.dart';
import 'package:timezone_extensions/src/timezone_extensions.dart'
    show genericNameAt, metazoneIdAt;
import 'package:timezone_extensions/src/generated/metazone_data.dart'
    show zoneMetazoneHistory;

/// Ids with no current CLDR English name. Mirrors `_knownNullMetazoneNameNow`
/// in tool/generate_metazone_data.dart.
const _cldrGaps = {
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

    test('Asia/Urumqi now → null (unnamed metazone in en-001)', () {
      expect(getLocation('Asia/Urumqi').timeZoneGenericName, isNull);
    });
  });

  // The getter reads the clock, so its tests only see today's season. These
  // pin the instant: a getter that leaked DST into the name fails in every
  // month, not only in summer.
  group('genericNameAt', () {
    int noonUtc(int year, int month) =>
        DateTime.utc(year, month, 15, 12).millisecondsSinceEpoch;

    test('is what the getter returns now', () {
      final now = DateTime.timestamp().millisecondsSinceEpoch;
      for (final id in timeZoneDatabase.locations.keys) {
        expect(
          getLocation(id).timeZoneGenericName,
          genericNameAt(id, now),
          reason: id,
        );
      }
    });

    test('the same name in January and July, in both hemispheres', () {
      for (final (id, name) in [
        ('Europe/Zurich', 'Central European Time'),
        ('America/Los_Angeles', 'Pacific Time'),
        ('Australia/Sydney', 'Australian Eastern Time'),
        ('America/Santiago', 'Chile Time'),
      ]) {
        expect(genericNameAt(id, noonUtc(2026, 1)), name, reason: '$id Jan');
        expect(genericNameAt(id, noonUtc(2026, 7)), name, reason: '$id Jul');
      }
    });

    test('zone-level summer names do not replace it', () {
      // London and Dublin carry their own daylight names (British Summer
      // Time, Irish Standard Time); in July the label is still GMT's.
      for (final id in ['Europe/London', 'Europe/Dublin']) {
        expect(
          genericNameAt(id, noonUtc(2026, 7)),
          'Greenwich Mean Time',
          reason: id,
        );
      }
    });

    test('follows the metazone history at the instant', () {
      expect(
        genericNameAt('Asia/Amman', noonUtc(2021, 7)),
        'Eastern European Time',
      );
      expect(genericNameAt('Asia/Amman', noonUtc(2026, 7)), isNull);
    });

    test('no zone changes name between January and July 2026', () {
      for (final id in timeZoneDatabase.locations.keys) {
        expect(
          genericNameAt(id, noonUtc(2026, 7)),
          genericNameAt(id, noonUtc(2026, 1)),
          reason: id,
        );
      }
    });
  });

  group('TZDateTime.timeZoneSpecificName', () {
    test('timeZoneLongName forwards to timeZoneSpecificName', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 7, 15, 12);
      expect(
        // ignore: deprecated_member_use_from_same_package
        z.timeZoneLongName,
        z.timeZoneSpecificName,
      );
    });

    test('Zurich January → Central European Standard Time', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 1, 15, 12);
      expect(z.timeZoneSpecificName, 'Central European Standard Time');
    });

    test('Zurich July → Central European Summer Time', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 7, 15, 12);
      expect(z.timeZoneSpecificName, 'Central European Summer Time');
    });

    test('Sydney January → daylight, July → standard', () {
      // Southern hemisphere: the name follows isDst, not the calendar month.
      final sydney = getLocation('Australia/Sydney');
      expect(
        TZDateTime(sydney, 2026, 1, 15, 12).timeZoneSpecificName,
        'Australian Eastern Daylight Time',
      );
      expect(
        TZDateTime(sydney, 2026, 7, 15, 12).timeZoneSpecificName,
        'Australian Eastern Standard Time',
      );
    });

    test('London January → Greenwich Mean Time', () {
      final z = TZDateTime(getLocation('Europe/London'), 2026, 1, 15, 12);
      expect(z.timeZoneSpecificName, 'Greenwich Mean Time');
    });

    test('London July → British Summer Time', () {
      final z = TZDateTime(getLocation('Europe/London'), 2026, 7, 15, 12);
      expect(z.timeZoneSpecificName, 'British Summer Time');
    });

    test('Dublin July → Irish Standard Time', () {
      final z = TZDateTime(getLocation('Europe/Dublin'), 2026, 7, 15, 12);
      expect(z.timeZoneSpecificName, 'Irish Standard Time');
    });

    test('Jersey July → null (DST, no daylight string)', () {
      final z = TZDateTime(getLocation('Europe/Jersey'), 2026, 7, 15, 12);
      expect(z.timeZone.isDst, isTrue);
      expect(z.timeZoneSpecificName, isNull);
    });

    test('Kyiv January / July Eastern European Standard / Summer', () {
      final jan = TZDateTime(getLocation('Europe/Kyiv'), 2026, 1, 15, 12);
      final jul = TZDateTime(getLocation('Europe/Kyiv'), 2026, 7, 15, 12);
      expect(jan.timeZoneSpecificName, 'Eastern European Standard Time');
      expect(jul.timeZoneSpecificName, 'Eastern European Summer Time');
    });

    test('Amman 2021 still had Eastern European names', () {
      final jan = TZDateTime(getLocation('Asia/Amman'), 2021, 1, 15, 12);
      final jul = TZDateTime(getLocation('Asia/Amman'), 2021, 7, 15, 12);
      expect(jan.timeZoneSpecificName, 'Eastern European Standard Time');
      expect(jul.timeZoneSpecificName, 'Eastern European Summer Time');
    });

    test('London and Dublin overlays are not dated', () {
      // British and Irish have no en-001 names. The zone daylight strings
      // still apply when isDst is true, including before those zones joined
      // GMT in 1971. In 1968-1971 tzdb treats British Standard Time as
      // standard time, so July 1970 stays null.
      final london = getLocation('Europe/London');
      final dublin = getLocation('Europe/Dublin');

      final londonJan1920 = TZDateTime(london, 1920, 1, 15, 12);
      final dublinJan1920 = TZDateTime(dublin, 1920, 1, 15, 12);
      expect(londonJan1920.timeZone.isDst, isFalse);
      expect(londonJan1920.timeZoneName, 'GMT');
      expect(londonJan1920.timeZoneSpecificName, isNull);
      expect(dublinJan1920.timeZone.isDst, isFalse);
      expect(dublinJan1920.timeZoneName, 'GMT');
      expect(dublinJan1920.timeZoneSpecificName, isNull);

      final londonJul1920 = TZDateTime(london, 1920, 7, 15, 12);
      final dublinJul1920 = TZDateTime(dublin, 1920, 7, 15, 12);
      expect(londonJul1920.timeZone.isDst, isTrue);
      expect(londonJul1920.timeZoneName, 'BST');
      expect(londonJul1920.timeZoneSpecificName, 'British Summer Time');
      expect(dublinJul1920.timeZone.isDst, isTrue);
      expect(dublinJul1920.timeZoneName, 'BST');
      expect(dublinJul1920.timeZoneSpecificName, 'Irish Standard Time');

      final londonJul1970 = TZDateTime(london, 1970, 7, 15, 12);
      final dublinJul1970 = TZDateTime(dublin, 1970, 7, 15, 12);
      expect(londonJul1970.timeZone.isDst, isFalse);
      expect(londonJul1970.timeZoneName, 'BST');
      expect(londonJul1970.timeZoneSpecificName, isNull);
      expect(dublinJul1970.timeZone.isDst, isFalse);
      expect(dublinJul1970.timeZoneName, 'IST');
      expect(dublinJul1970.timeZoneSpecificName, isNull);
    });

    test(
      'built-in UTC and database UTC alias → Coordinated Universal Time',
      () {
        // The built-in UTC constant is Location('Etc/UTC'), so it hits the
        // zone overlay directly. getLocation('UTC') is the database id and
        // reaches that overlay through the alias table.
        expect(UTC.name, 'Etc/UTC');
        expect(UTC.timeZoneGenericName, 'Coordinated Universal Time');
        expect(
          TZDateTime.utc(2026, 7, 15, 12).timeZoneSpecificName,
          'Coordinated Universal Time',
        );

        final dbUtc = getLocation('UTC');
        expect(dbUtc.name, 'UTC');
        expect(dbUtc.timeZoneGenericName, 'Coordinated Universal Time');
        expect(
          TZDateTime(dbUtc, 2026, 7, 15, 12).timeZoneSpecificName,
          'Coordinated Universal Time',
        );
      },
    );
  });

  group('TZDateTime.utcOffsetLabel', () {
    test('Zurich July → UTC+02 (not CEST)', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 7, 15, 12);
      expect(z.timeZoneName, 'CEST');
      expect(z.utcOffsetLabel, 'UTC+02');
    });

    test('Kolkata → UTC+05:30', () {
      final z = TZDateTime(getLocation('Asia/Kolkata'), 2026, 9, 9, 12);
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

      expect(casablanca.timeZoneSpecificName, isNull);
      expect(casablanca.utcOffsetLabel, 'UTC+01');
      expect(amman.timeZoneSpecificName, isNull);
      expect(amman.utcOffsetLabel, 'UTC+03');
    });
  });

  group('metazone history', () {
    test('a key with no history is null', () {
      expect(metazoneIdAt('Etc/UTC', 0), isNull);
      expect(metazoneIdAt('Unknown/Zone', 0), isNull);
    });

    test('a change of metazone is end-exclusive and start-inclusive', () {
      // CLDR: Pacific/Saipan leaves North_Mariana for Chamorro at
      // 2000-12-22 14:00 UTC.
      final edge = DateTime.utc(2000, 12, 22, 14).millisecondsSinceEpoch;
      expect(metazoneIdAt('Pacific/Saipan', edge - 1), 'North_Mariana');
      expect(metazoneIdAt('Pacific/Saipan', edge), 'Chamorro');
    });

    test('a membership with no successor ends in null', () {
      // CLDR: Asia/Amman leaves Europe_Eastern at 2022-10-27 22:00 UTC, when
      // Jordan moved to permanent UTC+03, and joins no other metazone.
      final edge = DateTime.utc(2022, 10, 27, 22).millisecondsSinceEpoch;
      expect(metazoneIdAt('Asia/Amman', edge - 1), 'Europe_Eastern');
      expect(metazoneIdAt('Asia/Amman', edge), isNull);

      final amman = getLocation('Asia/Amman');
      expect(
        TZDateTime.fromMillisecondsSinceEpoch(
          amman,
          edge - 1,
        ).timeZoneSpecificName,
        'Eastern European Summer Time',
      );
      expect(
        TZDateTime.fromMillisecondsSinceEpoch(amman, edge).timeZoneSpecificName,
        isNull,
      );
    });

    test('a gap between two memberships is null', () {
      // CLDR: America/Cordoba (America/Argentina/Cordoba) leaves Argentina at
      // 1991-03-03 02:00 UTC and rejoins it at 1991-10-20 04:00 UTC.
      final gapStart = DateTime.utc(1991, 3, 3, 2).millisecondsSinceEpoch;
      final gapEnd = DateTime.utc(1991, 10, 20, 4).millisecondsSinceEpoch;
      expect(metazoneIdAt('America/Cordoba', gapStart - 1), 'Argentina');
      expect(metazoneIdAt('America/Cordoba', gapStart), isNull);
      expect(metazoneIdAt('America/Cordoba', gapEnd - 1), isNull);
      expect(metazoneIdAt('America/Cordoba', gapEnd), 'Argentina');

      final cordoba = getLocation('America/Argentina/Cordoba');
      expect(
        TZDateTime.fromMillisecondsSinceEpoch(
          cordoba,
          gapStart,
        ).timeZoneSpecificName,
        isNull,
      );
    });

    test('ranges are ordered and do not overlap', () {
      // metazoneIdAt returns the first range that matches, so an overlap
      // would silently shadow the later membership.
      for (final MapEntry(key: zone, value: ranges)
          in zoneMetazoneHistory.entries) {
        for (var i = 0; i < ranges.length; i++) {
          final range = ranges[i];
          if (range.start != null && range.end != null) {
            expect(range.start, lessThan(range.end!), reason: '$zone[$i]');
          }
          if (i == 0) continue;
          final previousEnd = ranges[i - 1].end;
          expect(previousEnd, isNotNull, reason: '$zone[${i - 1}]');
          expect(range.start, isNotNull, reason: '$zone[$i]');
          expect(previousEnd, lessThanOrEqualTo(range.start!), reason: zone);
        }
      }
    });
  });

  group('coverage', () {
    test('Location name null only for known CLDR gaps', () {
      final actualNull = <String>{};
      for (final id in timeZoneDatabase.locations.keys) {
        final name = getLocation(id).timeZoneGenericName;
        if (name == null) actualNull.add(id);
      }
      expect(actualNull, _cldrGaps);
    });

    test('TZDateTime specific name null only for known CLDR gaps', () {
      // January matches the Location allow-list. July adds the four zones
      // that observe DST without a CLDR daylight string.
      const expectedJuly = {
        ..._cldrGaps,
        'Antarctica/Troll',
        'Europe/Guernsey',
        'Europe/Isle_of_Man',
        'Europe/Jersey',
      };

      Set<String> nullAt(int month) {
        final actual = <String>{};
        for (final id in timeZoneDatabase.locations.keys) {
          final t = TZDateTime(getLocation(id), 2026, month, 15, 12);
          if (t.timeZoneSpecificName == null) actual.add(id);
        }
        return actual;
      }

      expect(nullAt(1), _cldrGaps);
      expect(nullAt(7), expectedJuly);
    });

    test('generic is the standard name all year only for these DST zones', () {
      // The timeZoneGenericName dartdoc names the first six and the label
      // Greenwich Mean Time. A CLDR or tzdb update that changes either fails
      // here.
      const expected = {
        'Antarctica/Troll',
        'Europe/Dublin',
        'Europe/Guernsey',
        'Europe/Isle_of_Man',
        'Europe/Jersey',
        'Europe/London',
        // tzdb links that follow London or Dublin.
        'Eire',
        'Europe/Belfast',
        'GB',
        'GB-Eire',
      };

      final actual = <String>{};
      for (final id in timeZoneDatabase.locations.keys) {
        final location = getLocation(id);
        final generic = location.timeZoneGenericName;
        if (generic == null) continue;
        final year = [
          for (var month = 1; month <= 12; month++)
            TZDateTime(location, 2026, month, 15, 12),
        ];
        final standardNames = {
          for (final t in year)
            if (!t.timeZone.isDst) t.timeZoneSpecificName,
        };
        if (year.any((t) => t.timeZone.isDst) &&
            standardNames.contains(generic)) {
          actual.add(id);
        }
      }
      expect(actual, expected);
      for (final id in expected) {
        expect(
          getLocation(id).timeZoneGenericName,
          'Greenwich Mean Time',
          reason: id,
        );
      }
    });
  });

  group('utcOffsetLabel on real zones with awkward offsets', () {
    test('America/St_Johns is a negative half hour', () {
      // The sign is taken from the total and the parts come from its absolute
      // value, so a slip here reads 'UTC-03:-30'.
      final stJohns = getLocation('America/St_Johns');
      expect(TZDateTime(stJohns, 2026, 1, 15).utcOffsetLabel, 'UTC-03:30');
      expect(TZDateTime(stJohns, 2026, 7, 15).utcOffsetLabel, 'UTC-02:30');
    });

    test('Pacific/Marquesas is UTC-09:30', () {
      expect(
        TZDateTime(
          getLocation('Pacific/Marquesas'),
          2026,
          7,
          15,
        ).utcOffsetLabel,
        'UTC-09:30',
      );
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

    test('Europe/Paris in 1880 has a seconds offset, truncated', () {
      // Paris Mean Time was UTC+0:09:21.
      final paris1880 = TZDateTime(getLocation('Europe/Paris'), 1880, 1, 1);
      expect(paris1880.timeZoneOffset, const Duration(minutes: 9, seconds: 21));
      expect(paris1880.utcOffsetLabel, 'UTC+00:09');
    });
  });
}
