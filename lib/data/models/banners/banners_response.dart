class BannersResponse {
  List<Banners> banners = [];
  String? count;

  BannersResponse({this.banners = const [], this.count});

  BannersResponse.fromJson(Map<String, dynamic> json) {
    banners = <Banners>[];
    if (json['banners'] != null) {
      json['banners'].forEach((v) {
        banners.add(new Banners.fromJson(v));
      });
    } else {
      banners = [];
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banners'] = this.banners.map((v) => v.toJson()).toList();
    data['count'] = this.count;
    return data;
  }
}

class Banners {
  String? id;
  Title? title;
  String? position;
  String? image;
  String? url;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? shipperId;

  Banners({
    this.id,
    this.title,
    this.position,
    this.image,
    this.url,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.shipperId,
  });

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? new Title.fromJson(json['title']) : null;
    position = json['position'];
    image = json['image'];
    url = json['url'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shipperId = json['shipper_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.title != null) {
      data['title'] = this.title!.toJson();
    }
    data['position'] = this.position;
    data['image'] = this.image;
    data['url'] = this.url;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shipper_id'] = this.shipperId;
    return data;
  }
}

class Title {
  String? uz;
  String? ru;
  String? en;

  Title({this.uz, this.ru, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uz'] = this.uz;
    data['ru'] = this.ru;
    data['en'] = this.en;
    return data;
  }
}
