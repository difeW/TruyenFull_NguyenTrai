class StoryModel {
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
  List<Categories>? categories;

  StoryModel(
      {this.id,
        this.title,
        this.author,
        this.slug,
        this.description,
        this.poster,
        this.categoryList,
        this.status,
        this.uploadDate,
        this.updatedDate,
        this.categories});

  StoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    author = json['author'];
    slug = json['slug'];
    description = json['description'].cast<String>();
    poster = json['poster'];
    categoryList = json['categoryList'].cast<String>();
    status = json['status'];
    uploadDate = json['uploadDate'];
    updatedDate = json['updatedDate'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
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
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  String? description;

  Categories({this.id, this.name, this.slug, this.description});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['description'] = this.description;
    return data;
  }
}