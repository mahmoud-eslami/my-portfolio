class HomeModel {
  List<Projects>? projects;

  HomeModel({this.projects});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if (json["projects"] is List) {
      projects = json["projects"] == null
          ? null
          : (json["projects"] as List)
              .map((e) => Projects.fromJson(e))
              .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (projects != null) {
      data["projects"] = projects?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String? title;
  String? description;
  String? banner;
  List<dynamic>? images;

  Projects({this.title, this.description, this.banner, this.images});

  Projects.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["description"] is String) {
      description = json["description"];
    }
    if (json["banner"] is String) {
      banner = json["banner"];
    }
    if (json["images"] is List) {
      images = json["images"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["description"] = description;
    data["banner"] = banner;
    if (images != null) {
      data["images"] = images;
    }
    return data;
  }
}
