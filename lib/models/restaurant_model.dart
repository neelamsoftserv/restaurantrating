class RestaurantListModel {
  List<RestaurantListResponse>? response;

  RestaurantListModel({this.response});

  RestaurantListModel.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <RestaurantListResponse>[];
      json['response'].forEach((v) {
        response!.add( RestaurantListResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (response != null) {
      data['response'] = response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RestaurantListResponse {
  int? iId;
  String? image;
  String? name;
  Contact? contact;
  int? stars;
  List<String>? categories;
  String? noReviews;
  String? address;
  Rating? rating;
  List<Reviews>? reviews;

  RestaurantListResponse(
      {this.iId,
        this.image,
        this.name,
        this.contact,
        this.stars,
        this.categories,
        this.noReviews,
        this.address,
        this.rating,
        this.reviews});

  RestaurantListResponse.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    image = json['image'];
    name = json['name'];
    contact =
    json['contact'] != null ?  Contact.fromJson(json['contact']) : null;
    stars = json['stars'];
    categories = json['categories'].cast<String>();
    noReviews = json['no_reviews'];
    address = json['address'];
    rating = json['rating'] != null ?  Rating.fromJson(json['rating']) : null;
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add( Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['_id'] = iId;
    data['image'] = image;
    data['name'] = name;
    if (contact != null) {
      data['contact'] = contact!.toJson();
    }
    data['stars'] = stars;
    data['categories'] = categories;
    data['no_reviews'] = noReviews;
    data['address'] = address;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contact {
  String? phone;
  String? email;
  List<double>? location;

  Contact({this.phone, this.email, this.location});

  Contact.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    location = json['location'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['phone'] = phone;
    data['email'] = email;
    data['location'] = location;
    return data;
  }
}

class Rating {
  String? one;
  String? two;
  String? three;
  String? four;
  String? five;
  List<Reviews>? reviews;

  Rating({this.one, this.two, this.three, this.four, this.five, this.reviews});

  Rating.fromJson(Map<String, dynamic> json) {
    one = json['one'];
    two = json['two'];
    three = json['three'];
    four = json['four'];
    five = json['five'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add( Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['one'] = one;
    data['two'] = two;
    data['three'] = three;
    data['four'] = four;
    data['five'] = five;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? name;
  String? image;
  num? reviewRating;
  String? title;
  String? text;

  Reviews({this.name, this.image, this.reviewRating, this.title, this.text});

  Reviews.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    reviewRating = json['reviewRating'];
    title = json['title'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['reviewRating'] = reviewRating;
    data['title'] = title;
    data['text'] = text;
    return data;
  }
}
