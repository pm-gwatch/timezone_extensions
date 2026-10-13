// Contract tests for Location / TZDateTime English zone-name getters and
// formatUtcOffset. The public API comes from the public library; only the
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

    test('Africa/Casablanca now → null', () {
      expect(getLocation('Africa/Casablanca').timeZoneGenericName, isNull);
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

  group('TZDateTime.timeZoneLongName', () {
    test('Zurich January → Central European Standard Time', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 1, 15, 12);
      expect(z.timeZoneLongName, 'Central European Standard Time');
    });

    test('Zurich July → Central European Summer Time', () {
      final z = TZDateTime(getLocation('Europe/Zurich'), 2026, 7, 15, 12);
      expect(z.timeZoneLongName, 'Central European Summer Time');
    });

    test('Sydney January → daylight, July → standard', () {
      // Southern hemisphere: the name follows isDst, not the calendar month.
      final sydney = getLocation('Australia/Sydney');
      expect(
        TZDateTime(sydney, 2026, 1, 15, 12).timeZoneLongName,
        'Australian Eastern Daylight Time',
      );
      expect(
        TZDateTime(sydney, 2026, 7, 15, 12).timeZoneLongName,
        'Australian Eastern Standard Time',
      );
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

    test('TZDateTime.utc → Coordinated Universal Time', () {
      // package:timezone's UTC constant is built in, not read from the
      // database; its id 'UTC' reaches CLDR through the alias table.
      expect(
        TZDateTime.utc(2026, 7, 15, 12).timeZoneLongName,
        'Coordinated Universal Time',
      );
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

  group('metazone history', () {
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
        TZDateTime.fromMillisecondsSinceEpoch(amman, edge - 1).timeZoneLongName,
        'Eastern European Summer Time',
      );
      expect(
        TZDateTime.fromMillisecondsSinceEpoch(amman, edge).timeZoneLongName,
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
        ).timeZoneLongName,
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

    test('TZDateTime long name null only for known CLDR gaps', () {
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
          if (t.timeZoneLongName == null) actual.add(id);
        }
        return actual;
      }

      expect(nullAt(1), _cldrGaps);
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

    test('seconds are truncated toward zero, never rounded', () {
      expect(
        formatUtcOffset(const Duration(minutes: 9, seconds: 21)),
        'UTC+00:09',
      );
      expect(
        formatUtcOffset(const Duration(minutes: -9, seconds: -21)),
        'UTC-00:09',
      );
      // Under a minute either way is UTC, not 'UTC+00' or 'UTC-00'.
      expect(formatUtcOffset(const Duration(seconds: 59)), 'UTC');
      expect(formatUtcOffset(const Duration(seconds: -59)), 'UTC');
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

    test('Europe/Paris in 1880 has a seconds offset, truncated', () {
      // Paris Mean Time was UTC+0:09:21.
      final paris1880 = TZDateTime(getLocation('Europe/Paris'), 1880, 1, 1);
      expect(paris1880.timeZoneOffset, const Duration(minutes: 9, seconds: 21));
      expect(paris1880.utcOffsetLabel, 'UTC+00:09');
    });
  });
}
