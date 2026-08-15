/// Builds `lib/src/generated/metazone_data.dart` from Unicode CLDR JSON.
///
///     dart run tool/generate_metazone_data.dart
///
/// Fetches metaZones, en-001 timeZoneNames, and BCP-47 timezone aliases from
/// `unicode-org/cldr-json` **main** (not a pinned CLDR release). Emits the
/// full tables. Fails unless every `package:timezone` `latest_all` id has a
/// current generic name — or standard when the metazone has no daylight
/// name — except the known gaps in [_knownNullMetazoneNameNow].
library;

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:timezone/data/latest_all.dart' as tzdata;
import 'package:timezone/timezone.dart';

const _cldrJsonBase =
    'https://raw.githubusercontent.com/unicode-org/cldr-json/main/cldr-json';

/// Ids whose current `Location.timeZoneGenericName` is expected to be null
/// (no current membership, or a current metazone with no en-001 long names).
const _knownNullMetazoneNameNow = <String>{
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

Future<void> main(List<String> args) async {
  stdout.writeln('Fetching CLDR JSON …');
  final metaZones = await _getJson(
    '$_cldrJsonBase/cldr-core/supplemental/metaZones.json',
  );
  final timeZoneNames = await _getJson(
    '$_cldrJsonBase/cldr-dates-full/main/en-001/timeZoneNames.json',
  );
  final bcp47 = await _getJson('$_cldrJsonBase/cldr-bcp47/bcp47/timezone.json');

  tzdata.initializeTimeZones();
  final locationNames = timeZoneDatabase.locations.keys.toList()..sort();

  final cldrVersion =
      metaZones['supplemental']['version']['_cldrVersion'] as String;
  stdout.writeln(
    'CLDR $cldrVersion · ${locationNames.length} timezone locations',
  );

  final aliasToCanonical = _buildAliasMap(bcp47);
  final history = <String, List<Map<String, dynamic>>>{};
  _walkHistory(
    metaZones['supplemental']['metaZones']['metazoneInfo']['timezone']
        as Map<String, dynamic>,
    <String>[],
    history,
  );

  final metazoneLong = _extractMetazoneLong(
    timeZoneNames['main']['en-001']['dates']['timeZoneNames']['metazone']
        as Map<String, dynamic>,
  );
  final zoneLong = _extractZoneLong(
    timeZoneNames['main']['en-001']['dates']['timeZoneNames']['zone']
        as Map<String, dynamic>,
  );

  final ianaToCldr = <String, String>{};
  for (final MapEntry(:key, :value) in aliasToCanonical.entries) {
    if (key != value) ianaToCldr[key] = value;
  }

  final parsedHistory = <String, List<_Range>>{
    for (final MapEntry(:key, :value) in history.entries)
      key: _parseRanges(value),
  };

  final nowMs = DateTime.timestamp().millisecondsSinceEpoch;
  final nullNow = <String>[];
  final unexpectedNull = <String>[];
  final unexpectedNamed = <String>[];

  for (final name in locationNames) {
    final cldrKey = ianaToCldr[name] ?? name;
    final ranges = parsedHistory[cldrKey] ?? parsedHistory[name];
    final mzId = ranges == null ? null : _metazoneAt(ranges, nowMs);
    final zone = zoneLong[cldrKey] ?? zoneLong[name];
    final meta = mzId == null ? null : metazoneLong[mzId];
    final generic = zone?.generic ?? meta?.generic;
    final standard = zone?.standard ?? meta?.standard;
    final selected = generic ?? (meta?.daylight == null ? standard : null);
    final allowNull = _knownNullMetazoneNameNow.contains(name);
    if (selected == null) {
      nullNow.add(name);
      if (!allowNull) unexpectedNull.add(name);
    } else if (allowNull) {
      unexpectedNamed.add(name);
    }
  }

  if (unexpectedNull.isNotEmpty || unexpectedNamed.isNotEmpty) {
    if (unexpectedNull.isNotEmpty) {
      stderr.writeln(
        'Build gate failed — null timeZoneGenericName at now, not on allow-list:',
      );
      for (final f in unexpectedNull) {
        stderr.writeln('  $f');
      }
    }
    if (unexpectedNamed.isNotEmpty) {
      stderr.writeln(
        'Build gate failed — allow-listed ids now have a name '
        '(remove from allow-list):',
      );
      for (final f in unexpectedNamed) {
        stderr.writeln('  $f');
      }
    }
    exitCode = 1;
    return;
  }

  stdout.writeln(
    'Null Location.timeZoneGenericName at now: ${nullNow.length} '
    '(${nullNow.join(', ')})',
  );

  final referencedMetazoneIds = <String>{};
  for (final ranges in parsedHistory.values) {
    for (final r in ranges) {
      referencedMetazoneIds.add(r.metazoneId);
    }
  }
  final unlocalized =
      referencedMetazoneIds
          .where((id) => !metazoneLong.containsKey(id))
          .toList()
        ..sort();

  final noDaylight =
      metazoneLong.entries
          .where((e) => e.value.daylight == null)
          .map((e) => e.key)
          .toList()
        ..sort();

  final out = StringBuffer()
    ..writeln('// GENERATED FILE — DO NOT EDIT.')
    ..writeln('//')
    ..writeln(
      '// Produced by tool/generate_metazone_data.dart from Unicode CLDR '
      '$cldrVersion.',
    )
    ..writeln('//')
    ..writeln(
      '// Derived English metazone display names from Unicode CLDR. Licensed',
    )
    ..writeln(
      '// under Unicode License v3, not the MIT licence of this package\'s',
    )
    ..writeln('// source. See THIRD_PARTY_LICENSES at the package root.')
    ..writeln('//')
    ..writeln('// Metazones with no long daylight name: ${noDaylight.length}.')
    ..writeln(
      '// Metazone ids in history but not localized in en-001: '
      '${unlocalized.length}.',
    )
    ..writeln('library;')
    ..writeln()
    ..writeln('/// CLDR release used for English time-zone long names.')
    ..writeln("const String cldrVersion = '$cldrVersion';")
    ..writeln()
    ..writeln('/// CLDR long names: generic, standard, and daylight.')
    ..writeln('class MetazoneLongNames {')
    ..writeln('  const MetazoneLongNames({')
    ..writeln('    this.generic,')
    ..writeln('    this.standard,')
    ..writeln('    this.daylight,')
    ..writeln('  });')
    ..writeln()
    ..writeln('  final String? generic;')
    ..writeln('  final String? standard;')
    ..writeln('  final String? daylight;')
    ..writeln('}')
    ..writeln()
    ..writeln('/// Metazone membership interval.')
    ..writeln('class MetazoneRange {')
    ..writeln('  const MetazoneRange({')
    ..writeln('    required this.metazoneId,')
    ..writeln('    this.start,')
    ..writeln('    this.end,')
    ..writeln('  });')
    ..writeln()
    ..writeln('  final String metazoneId;')
    ..writeln()
    ..writeln(
      '  /// Inclusive start as milliseconds since the Unix epoch, or null for −∞.',
    )
    ..writeln('  final int? start;')
    ..writeln()
    ..writeln(
      '  /// Exclusive end as milliseconds since the Unix epoch, or null for +∞.',
    )
    ..writeln('  final int? end;')
    ..writeln('}')
    ..writeln()
    ..writeln(
      '/// IANA id → CLDR zone key when they differ (BCP-47 alias head).',
    )
    ..writeln(
      'const Map<String, String> ianaToCldrZoneKey = <String, String>{',
    );
  final aliasKeys = ianaToCldr.keys.toList()..sort();
  for (final k in aliasKeys) {
    out.writeln('  ${_q(k)}: ${_q(ianaToCldr[k]!)},');
  }
  out
    ..writeln('};')
    ..writeln()
    ..writeln('/// Metazone id → en-001 long names.')
    ..writeln(
      'const Map<String, MetazoneLongNames> metazoneLongNames = '
      '<String, MetazoneLongNames>{',
    );
  final mzKeys = metazoneLong.keys.toList()..sort();
  for (final k in mzKeys) {
    out.writeln('  ${_q(k)}: ${_emitTriple(metazoneLong[k]!)},');
  }
  out
    ..writeln('};')
    ..writeln()
    ..writeln('/// Sparse zone-level en-001 long overrides.')
    ..writeln(
      'const Map<String, MetazoneLongNames> zoneLongNames = '
      '<String, MetazoneLongNames>{',
    );
  final zKeys = zoneLong.keys.toList()..sort();
  for (final k in zKeys) {
    out.writeln('  ${_q(k)}: ${_emitTriple(zoneLong[k]!)},');
  }
  out
    ..writeln('};')
    ..writeln()
    ..writeln('/// CLDR zone key → metazone membership history (oldest first).')
    ..writeln(
      'const Map<String, List<MetazoneRange>> zoneMetazoneHistory = '
      '<String, List<MetazoneRange>>{',
    );
  final hKeys = parsedHistory.keys.toList()..sort();
  for (final k in hKeys) {
    out.writeln('  ${_q(k)}: <MetazoneRange>[');
    for (final r in parsedHistory[k]!) {
      out.writeln(
        '    MetazoneRange(metazoneId: ${_q(r.metazoneId)}, '
        'start: ${r.start}, end: ${r.end}),',
      );
    }
    out.writeln('  ],');
  }
  out.writeln('};');

  final dest = File('lib/src/generated/metazone_data.dart');
  dest.parent.createSync(recursive: true);
  dest.writeAsStringSync(out.toString());
  stdout.writeln('Wrote ${dest.path} (${dest.lengthSync()} bytes)');
  stdout.writeln('\nNow run: dart format lib/src/generated && dart analyze');
}

Future<Map<String, dynamic>> _getJson(String url) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode != 200) {
    throw StateError('GET $url → ${response.statusCode}');
  }
  return jsonDecode(response.body) as Map<String, dynamic>;
}

Map<String, String> _buildAliasMap(Map<String, dynamic> bcp47) {
  final out = <String, String>{};
  final tz = bcp47['keyword']['u']['tz'] as Map<String, dynamic>;
  for (final entry in tz.values) {
    if (entry is! Map<String, dynamic>) continue;
    final alias = entry['_alias'];
    if (alias is! String) continue;
    final parts = alias.split(RegExp(r'\s+'));
    if (parts.isEmpty) continue;
    final canon = parts.first;
    for (final p in parts) {
      out[p] = canon;
    }
  }
  return out;
}

void _walkHistory(
  Map<String, dynamic> node,
  List<String> parts,
  Map<String, List<Map<String, dynamic>>> out,
) {
  for (final MapEntry(:key, :value) in node.entries) {
    if (value is List) {
      out[[...parts, key].join('/')] = [
        for (final e in value)
          (e as Map<String, dynamic>)['usesMetazone'] as Map<String, dynamic>,
      ];
    } else if (value is Map<String, dynamic>) {
      _walkHistory(value, [...parts, key], out);
    }
  }
}

Map<String, _Triple> _extractMetazoneLong(Map<String, dynamic> meta) {
  final out = <String, _Triple>{};
  for (final MapEntry(:key, :value) in meta.entries) {
    if (value is! Map<String, dynamic>) continue;
    final long = value['long'];
    if (long is! Map<String, dynamic>) continue;
    out[key] = _Triple.fromLong(long);
  }
  return out;
}

Map<String, _Triple> _extractZoneLong(Map<String, dynamic> zone) {
  final out = <String, _Triple>{};
  void walk(Map<String, dynamic> node, List<String> parts) {
    final long = node['long'];
    if (long is Map<String, dynamic>) {
      out[parts.join('/')] = _Triple.fromLong(long);
    }
    for (final MapEntry(:key, :value) in node.entries) {
      if (key.startsWith('_')) continue;
      if (value is Map<String, dynamic>) {
        walk(value, [...parts, key]);
      }
    }
  }

  walk(zone, <String>[]);
  return out;
}

List<_Range> _parseRanges(List<Map<String, dynamic>> entries) {
  return [
    for (final u in entries)
      _Range(
        metazoneId: u['_mzone'] as String,
        start: _parseCldrUtc(u['_from'] as String?),
        end: _parseCldrUtc(u['_to'] as String?),
      ),
  ];
}

/// Parses CLDR `yyyy-MM-dd HH:mm` as UTC milliseconds, or null.
int? _parseCldrUtc(String? raw) {
  if (raw == null) return null;
  final match = RegExp(
    r'^(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2})$',
  ).firstMatch(raw);
  if (match == null) {
    throw FormatException('Bad CLDR metazone timestamp', raw);
  }
  return DateTime.utc(
    int.parse(match[1]!),
    int.parse(match[2]!),
    int.parse(match[3]!),
    int.parse(match[4]!),
    int.parse(match[5]!),
  ).millisecondsSinceEpoch;
}

String? _metazoneAt(List<_Range> ranges, int ms) {
  for (final r in ranges) {
    if (r.start != null && ms < r.start!) continue;
    if (r.end != null && ms >= r.end!) continue;
    return r.metazoneId;
  }
  return null;
}

String _q(String s) => jsonEncode(s);

String _emitTriple(_Triple t) {
  return 'MetazoneLongNames('
      'generic: ${t.generic == null ? 'null' : _q(t.generic!)}, '
      'standard: ${t.standard == null ? 'null' : _q(t.standard!)}, '
      'daylight: ${t.daylight == null ? 'null' : _q(t.daylight!)})';
}

final class _Triple {
  const _Triple({this.generic, this.standard, this.daylight});

  factory _Triple.fromLong(Map<String, dynamic> long) => _Triple(
    generic: long['generic'] as String?,
    standard: long['standard'] as String?,
    daylight: long['daylight'] as String?,
  );

  final String? generic;
  final String? standard;
  final String? daylight;
}

final class _Range {
  const _Range({
    required this.metazoneId,
    required this.start,
    required this.end,
  });

  final String metazoneId;
  final int? start;
  final int? end;
}
