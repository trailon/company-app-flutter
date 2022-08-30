class ExamineProductModel {
  bool? success;
  Data? data;
  String? message;

  ExamineProductModel({this.success, this.data, this.message});

  ExamineProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? brandName;
  String? imageFile;
  List<String>? productImages;
  String? localekey;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? description;
  String? usedTechs;

  Data(
      {this.id,
      this.brandName,
      this.imageFile,
      this.productImages,
      this.localekey,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.usedTechs});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brand_name'];
    imageFile = json['image_file'];
    productImages = json['product_images'].cast<String>();
    localekey = json['localekey'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    description = json['description'];
    usedTechs = json['used_techs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand_name'] = brandName;
    data['image_file'] = imageFile;
    data['product_images'] = productImages;
    data['localekey'] = localekey;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['description'] = description;
    data['used_techs'] = usedTechs;
    return data;
  }
}
