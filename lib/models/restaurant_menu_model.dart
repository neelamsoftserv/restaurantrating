class RestaurantMenuModel {
  List<RestaurantMenuListResponse>? response = [];

  RestaurantMenuModel({this.response});

  RestaurantMenuModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <RestaurantMenuListResponse>[];
      json['response'].forEach((v) {
        response!.add( RestaurantMenuListResponse.fromJson(v));
      });
    }
    else{
      response!.add( RestaurantMenuListResponse.fromJson(json));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantMenuListResponse {
  List<Dishes>? dishes;
  List<Wines>? wines;
  // List<Null>? reservation;

  RestaurantMenuListResponse({this.dishes, this.wines, });

  RestaurantMenuListResponse.fromJson(Map<String, dynamic> json) {
    if (json['dishes'] != null) {
      dishes = <Dishes>[];
      json['dishes'].forEach((v) {
        dishes!.add(new Dishes.fromJson(v));
      });
    }
    if (json['wines'] != null) {
      wines = <Wines>[];
      json['wines'].forEach((v) {
        wines!.add(new Wines.fromJson(v));
      });
    }
   /* if (json['reservation'] != null) {
      reservation = <Null>[];
      json['reservation'].forEach((v) {
        reservation!.add(new Null.fromJson(v));
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dishes != null) {
      data['dishes'] = this.dishes!.map((v) => v.toJson()).toList();
    }
    if (this.wines != null) {
      data['wines'] = this.wines!.map((v) => v.toJson()).toList();
    }
   /* if (this.reservation != null) {
      data['reservation'] = this.reservation!.map((v) => v.toJson()).toList();
    }*/
    return data;
  }
}

class Dishes {
  String? image;
  String? category;
  String? name;
  String? price;
  String? ingredients;
  String? description;

  Dishes(
      {this.image,
        this.category,
        this.name,
        this.price,
        this.ingredients,
        this.description});

  Dishes.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    category = json['category'];
    name = json['name'];
    price = json['price'];
    ingredients = json['ingredients'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['category'] = this.category;
    data['name'] = this.name;
    data['price'] = this.price;
    data['ingredients'] = this.ingredients;
    data['description'] = this.description;
    return data;
  }
}

class Wines {
  String? category;
  String? name;
  String? price;
  String? ingredients;
  String? description;

  Wines(
      {this.category,
        this.name,
        this.price,
        this.ingredients,
        this.description});

  Wines.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    name = json['name'];
    price = json['price'];
    ingredients = json['ingredients'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['name'] = this.name;
    data['price'] = this.price;
    data['ingredients'] = this.ingredients;
    data['description'] = this.description;
    return data;
  }
}
