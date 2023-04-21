class StoriesParam {
  String? s;
  int? page;
  int? limit;

  StoriesParam({this.s, this.page, this.limit});

  StoriesParam.fromJson(Map<String, dynamic> json) {
    s = json['s'];
    page = json['page'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['s'] = this.s;
    data['page'] = this.page;
    data['limit'] = this.limit;
    return data;
  }
}