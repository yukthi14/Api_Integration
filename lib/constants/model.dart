import 'dart:convert';

class ApiModel{
  ApiModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
});
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;


  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
     "albumId":albumId,
      "id":id,
      "title":title,
      "url":url,
      "thumbnailUrl":thumbnailUrl,

  };


}