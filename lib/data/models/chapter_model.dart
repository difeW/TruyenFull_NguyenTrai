class ChapterModel {
  int? id;
  String? header;
  String? slug;
  List<String>? body;
  int? viewCount;
  String? uploadDate;
  String? updatedDate;
  Story? story;

  ChapterModel(
      {this.id,
        this.header,
        this.slug,
        this.body,
        this.viewCount,
        this.uploadDate,
        this.updatedDate,
        this.story});

  ChapterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    header = json['header'];
    slug = json['slug'];
    body = json['body']== null? [] : List<String>.from(json["body"].map((x) => x));
    viewCount = json['viewCount'];
    uploadDate = json['uploadDate'];
    updatedDate = json['updatedDate'];
    story = json['story'] != null ? new Story.fromJson(json['story']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['header'] = this.header;
    data['slug'] = this.slug;
    data['body'] = this.body;
    data['viewCount'] = this.viewCount;
    data['uploadDate'] = this.uploadDate;
    data['updatedDate'] = this.updatedDate;
    if (this.story != null) {
      data['story'] = this.story!.toJson();
    }
    return data;
  }
}

class Story {
  int? id;
  String? title;
  String? author;
  String? slug;
  List<String>? description;
  String? poster;
  List<String>? categoryList;
  String? status;
  String? uploadDate;
  String? updatedDate;

  Story(
      {this.id,
        this.title,
        this.author,
        this.slug,
        this.description,
        this.poster,
        this.categoryList,
        this.status,
        this.uploadDate,
        this.updatedDate});

  Story.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    slug = json['slug'];
    description = json['description']== null? [] : List<String>.from(json["description"].map((x) => x));
    poster = json['poster'];
    categoryList = json['categoryList']== null? [] : List<String>.from(json["categoryList"].map((x) => x));
    status = json['status'];
    uploadDate = json['uploadDate'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['author'] = this.author;
    data['slug'] = this.slug;
    data['description'] = this.description;
    data['poster'] = this.poster;
    data['categoryList'] = this.categoryList;
    data['status'] = this.status;
    data['uploadDate'] = this.uploadDate;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}