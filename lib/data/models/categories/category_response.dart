class CategoryResponse {
  List<Categories> categories = [];
  String? count;

  CategoryResponse({this.categories = const [], this.count});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    categories = <Categories>[];
    if (json['categories'] != null) {
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories'] = this.categories.map((v) => v.toJson()).toList();
    data['count'] = this.count;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? slug;
  bool isChecked = false;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? shipperId;
  String? iikoId;
  List<Products> products = [];
  String? orderNo;
  List<ChildCategories> childCategories = [];

  Categories({
    this.id,
    this.name,
    this.slug,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.shipperId,
    this.iikoId,
    this.products = const [],
    this.isChecked = false,
    this.orderNo,
    this.childCategories = const [],
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shipperId = json['shipper_id'];
    isChecked = false;
    iikoId = json['iiko_id'];
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    } else {
      products = [];
    }
    orderNo = json['order_no'];
    childCategories = <ChildCategories>[];
    if (json['child_categories'] != null) {
      json['child_categories'].forEach((v) {
        childCategories.add(new ChildCategories.fromJson(v));
      });
    } else {
      childCategories = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shipper_id'] = this.shipperId;
    data['iiko_id'] = this.iikoId;
    data['products'] = this.products.map((v) => v.toJson()).toList();
    data['order_no'] = this.orderNo;
    data['child_categories'] =
        this.childCategories.map((v) => v.toJson()).toList();
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? slug;
  String? categoryId;
  String? description;
  String? orderNo;
  bool? isActive;
  String? price;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? shipperId;
  String? rkeeperProductId;
  String? jowiId;
  String? iikoId;

  Products({
    this.id,
    this.name,
    this.slug,
    this.categoryId,
    this.description,
    this.orderNo,
    this.isActive,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.image,
    this.shipperId,
    this.rkeeperProductId,
    this.jowiId,
    this.iikoId,
  });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    categoryId = json['category_id'];
    description = json['description'];
    orderNo = json['order_no'];
    isActive = json['is_active'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    shipperId = json['shipper_id'];
    rkeeperProductId = json['rkeeper_product_id'];
    jowiId = json['jowi_id'];
    iikoId = json['iiko_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['category_id'] = this.categoryId;
    data['description'] = this.description;
    data['order_no'] = this.orderNo;
    data['is_active'] = this.isActive;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image'] = this.image;
    data['shipper_id'] = this.shipperId;
    data['rkeeper_product_id'] = this.rkeeperProductId;
    data['jowi_id'] = this.jowiId;
    data['iiko_id'] = this.iikoId;
    return data;
  }
}

class ChildCategories {
  String? id;
  String? name;
  String? slug;
  String? parentId;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  String? orderNo;
  String? shipperId;
  String? iikoId;
  List<Products> products = [];

  ChildCategories({
    this.id,
    this.name,
    this.slug,
    this.parentId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.orderNo,
    this.shipperId,
    this.iikoId,
    this.products = const [],
  });

  ChildCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parentId = json['parent_id'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    orderNo = json['order_no'];
    shipperId = json['shipper_id'];
    iikoId = json['iiko_id'];
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    } else {
      products = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent_id'] = this.parentId;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order_no'] = this.orderNo;
    data['shipper_id'] = this.shipperId;
    data['iiko_id'] = this.iikoId;
    data['products'] = this.products.map((v) => v.toJson()).toList();
    return data;
  }
}
