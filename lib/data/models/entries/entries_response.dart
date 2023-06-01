import 'package:json_annotation/json_annotation.dart';

import '../../sources/network/interfaces/base_network_model.dart';


part 'entries_response.g.dart';

@JsonSerializable()
class EntriesResponse extends BaseNetworkModel<EntriesResponse> {
  EntriesResponse({
    this.count,
    this.entries,
  });

  int? count;
  List<Entry>? entries;

  factory EntriesResponse.fromJson(Map<String, dynamic> json) =>
      EntriesResponse(
        count: json["count"],
        entries: List<Entry>.from(
            json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "count": count,
        if(entries != null)
          "entries": List<dynamic>.from(
              entries!.map((x) => x.toJson())),
      };

  @override
  EntriesResponse fromJson(Map<String, dynamic> json) {
    return EntriesResponse.fromJson(json);
  }
}


class Entry {
  Entry({
    this.api,
    this.description,
    this.https,
    this.link,
    this.category,
  });

  String? api;
  String? description;
  bool? https;
  String?link;
  String? category;

  factory Entry.fromJson(Map<String, dynamic> json) =>
      Entry(
        api: json["API"],
        description: json["Description"],
        https: json["HTTPS"],
        link: json["Link"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() =>
      {
        "API": api,
        "Description": description,
        "HTTPS": https,
        "Link": link,
        "Category": category,
      };
}



