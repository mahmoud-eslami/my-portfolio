typedef HomeData = HomeModel;
typedef SocialItemData = Socials;
typedef ExperienceItemData = Experiences;
typedef ProjectItemData = Projects;

class HomeModel {
  String? mainTitle;
  String? aboutMe;
  String? resumeLink;
  List<Socials>? socials;
  List<Projects>? projects;
  List<Skills>? skills;
  List<Experiences>? experiences;

  HomeModel(
      {this.mainTitle,
      this.aboutMe,
      this.resumeLink,
      this.socials,
      this.projects,
      this.skills,
      this.experiences});

  HomeModel.fromJson(Map<String, dynamic> json) {
    mainTitle = json["main_title"];
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
    experiences = json["experiences"] == null
        ? null
        : (json["experiences"] as List)
            .map((e) => Experiences.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["main_title"] = mainTitle;
    data["about_me"] = aboutMe;
    data["resume_link"] = resumeLink;
    if (socials != null) {
      data["socials"] = socials?.map((e) => e.toJson()).toList();
    }
    if (projects != null) {
      data["projects"] = projects?.map((e) => e.toJson()).toList();
    }
    if (skills != null) {
      data["skills"] = skills?.map((e) => e.toJson()).toList();
    }
    if (experiences != null) {
      data["experiences"] = experiences?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Experiences {
  String? companyName;
  String? role;
  String? date;
  String? description;

  Experiences({this.companyName, this.role, this.date, this.description});

  Experiences.fromJson(Map<String, dynamic> json) {
    companyName = json["company_name"];
    role = json["role"];
    date = json["date"];
    description = json["description"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["company_name"] = companyName;
    data["role"] = role;
    data["date"] = date;
    data["description"] = description;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["description"] = description;
    if (skillItems != null) {
      data["skillItems"] = skillItems?.map((e) => e.toJson()).toList();
    }
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["long"] = long;
    data["image"] = image;
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["description"] = description;
    data["banner"] = banner;
    if (images != null) {
      data["images"] = images;
    }
    data["isOpenSource"] = isOpenSource;
    data["link"] = link;
    if (technologies != null) {
      data["technologies"] = technologies;
    }
    return data;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["link"] = link;
    data["username"] = username;
    return data;
  }
}
