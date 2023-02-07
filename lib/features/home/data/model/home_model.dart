
class HomeModel {
  List<Projects>? projects;
  List<Skills>? skills;

  HomeModel({this.projects, this.skills});

  HomeModel.fromJson(Map<String, dynamic> json) {
    if(json["projects"] is List) {
      projects = json["projects"] == null ? null : (json["projects"] as List).map((e) => Projects.fromJson(e)).toList();
    }
    if(json["skills"] is List) {
      skills = json["skills"] == null ? null : (json["skills"] as List).map((e) => Skills.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(projects != null) {
      _data["projects"] = projects?.map((e) => e.toJson()).toList();
    }
    if(skills != null) {
      _data["skills"] = skills?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Skills {
  String? title;
  String? description;
  List<SkillItems>? skillItems;

  Skills({this.title, this.description, this.skillItems});

  Skills.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["skillItems"] is List) {
      skillItems = json["skillItems"] == null ? null : (json["skillItems"] as List).map((e) => SkillItems.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    if(skillItems != null) {
      _data["skillItems"] = skillItems?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class SkillItems {
  String? title;
  bool? long;
  String? image;

  SkillItems({this.title, this.long, this.image});

  SkillItems.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["long"] is bool) {
      long = json["long"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["long"] = long;
    _data["image"] = image;
    return _data;
  }
}

class Projects {
  String? title;
  String? description;
  String? banner;
  bool? isOpenSource;
  String? link;
  List<String>? technologies;
  List<String>? images;

  Projects({this.title, this.description, this.banner, this.isOpenSource, this.link, this.technologies, this.images});

  Projects.fromJson(Map<String, dynamic> json) {
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["banner"] is String) {
      banner = json["banner"];
    }
    if(json["isOpenSource"] is bool) {
      isOpenSource = json["isOpenSource"];
    }
    if(json["link"] is String) {
      link = json["link"];
    }
    if(json["technologies"] is List) {
      technologies = json["technologies"] == null ? null : List<String>.from(json["technologies"]);
    }
    if(json["images"] is List) {
      images = json["images"] == null ? null : List<String>.from(json["images"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    _data["banner"] = banner;
    _data["isOpenSource"] = isOpenSource;
    _data["link"] = link;
    if(technologies != null) {
      _data["technologies"] = technologies;
    }
    if(images != null) {
      _data["images"] = images;
    }
    return _data;
  }
}