class ScheduleModel {
  bool? success;
  Data? data;

  ScheduleModel({this.success, this.data});

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? totalBill;
  List<Providers>? providers;

  Data({this.totalBill, this.providers});

  Data.fromJson(Map<String, dynamic> json) {
    totalBill = json['total_bill'];
    if (json['providers'] != null) {
      providers = <Providers>[];
      json['providers'].forEach((v) {
        providers!.add(new Providers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_bill'] = this.totalBill;
    if (this.providers != null) {
      data['providers'] = this.providers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Providers {
  String? providerIcon;
  String? providerName;
  String? price;
  Subscription? subscription;

  Providers(
      {this.providerIcon, this.providerName, this.price, this.subscription});

  Providers.fromJson(Map<String, dynamic> json) {
    providerIcon = json['provider_icon'];
    providerName = json['provider_name'];
    price = json['price'];
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['provider_icon'] = this.providerIcon;
    data['provider_name'] = this.providerName;
    data['price'] = this.price;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    return data;
  }
}

class Subscription {
  int? id;
  String? name;
  String? description;
  String? startDate;
  String? renewalDate;
  String? billingCycle;
  String? reminder;
  Category? category;

  Subscription(
      {this.id,
        this.name,
        this.description,
        this.startDate,
        this.renewalDate,
        this.billingCycle,
        this.reminder,
        this.category});

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    startDate = json['start_date'];
    renewalDate = json['renewal_date'];
    billingCycle = json['billing_cycle'];
    reminder = json['reminder'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['start_date'] = this.startDate;
    data['renewal_date'] = this.renewalDate;
    data['billing_cycle'] = this.billingCycle;
    data['reminder'] = this.reminder;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
