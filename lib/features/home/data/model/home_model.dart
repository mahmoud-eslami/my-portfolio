typedef HomeData = HomeModel;
typedef SocialItemData = Socials;

class HomeModel {
  String? jobTitle;
  String? aboutMe;
  String? resumeLink;
  List<Socials>? socials;
  List<Projects>? projects;
  List<Skills>? skills;

  HomeModel(
      {this.jobTitle,
      this.aboutMe,
      this.resumeLink,
      this.socials,
      this.projects,
      this.skills});

  HomeModel.fromJson(Map<String, dynamic> json) {
    jobTitle = json["job_title"];
    aboutMe = json["about_me"];
    resumeLink = json["resume_link"];
    socials = json["socials"] == null
        ? null
        : (json["socials"] as List).map((e) => Socials.fromJson(e)).toList();
    projects = json["projects"] == null
        ? null
        : (json["projects"] as List).map((e) => Projects.fromJson(e)).toList();
    skills = json["skills"] == null
        ? null
        : (json["skills"] as List).map((e) => Skills.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["job_title"] = jobTitle;
    _data["about_me"] = aboutMe;
    _data["resume_link"] = resumeLink;
    if (socials != null) {
      _data["socials"] = socials?.map((e) => e.toJson()).toList();
    }
    if (projects != null) {
      _data["projects"] = projects?.map((e) => e.toJson()).toList();
    }
    if (skills != null) {
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
    title = json["title"];
    description = json["description"];
    skillItems = json["skillItems"] == null
        ? null
        : (json["skillItems"] as List)
            .map((e) => SkillItems.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    if (skillItems != null) {
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
    title = json["title"];
    long = json["long"];
    image = json["image"];
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
  List<dynamic>? images;
  bool? isOpenSource;
  String? link;
  List<String>? technologies;

  Projects(
      {this.title,
      this.description,
      this.banner,
      this.images,
      this.isOpenSource,
      this.link,
      this.technologies});

  Projects.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    description = json["description"];
    banner = json["banner"];
    images = json["images"] ?? [];
    isOpenSource = json["isOpenSource"];
    link = json["link"];
    technologies = json["technologies"] == null
        ? null
        : List<String>.from(json["technologies"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["title"] = title;
    _data["description"] = description;
    _data["banner"] = banner;
    if (images != null) {
      _data["images"] = images;
    }
    _data["isOpenSource"] = isOpenSource;
    _data["link"] = link;
    if (technologies != null) {
      _data["technologies"] = technologies;
    }
    return _data;
  }
}

class Socials {
  String? name;
  String? link;
  String? username;

  Socials({this.name, this.link, this.username});

  Socials.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    link = json["link"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["name"] = name;
    _data["link"] = link;
    _data["username"] = username;
    return _data;
  }
}
