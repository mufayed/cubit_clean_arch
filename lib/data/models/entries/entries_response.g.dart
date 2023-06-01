// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntriesResponse _$EntriesResponseFromJson(Map<String, dynamic> json) {
  return EntriesResponse(
    count: json['count'] as int?,
    entries: (json['entries'] as List<dynamic>?)
        ?.map((e) => Entry.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$EntriesResponseToJson(EntriesResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'entries': instance.entries,
    };
