class ProductsModel {
  bool? success;
  List<Data>? data;
  String? message;

  ProductsModel({this.success, this.data, this.message});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? brandName;
  String? imageFile;
  String? localekey;
  String? title;
  String? description;

  Data(
      {this.id,
      this.brandName,
      this.imageFile,
      this.localekey,
      this.title,
      this.description});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    imageFile = json['image_file'];
    localekey = json['localekey'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand_name'] = brandName;
    data['image_file'] = imageFile;
    data['localekey'] = localekey;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
