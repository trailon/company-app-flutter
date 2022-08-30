class BrandsModel {
  bool? success;
  List<Data>? data;
  String? message;

  BrandsModel({this.success, this.data, this.message});

  BrandsModel.fromJson(Map<String, dynamic> json) {
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
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.brandName,
      this.imageFile,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    imageFile = json['image_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand_name'] = brandName;
    data['image_file'] = imageFile;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
