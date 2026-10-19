class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDesc;
  String? categoriesDescAr;
  String? categoriesImage;
  String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesDesc,
      this.categoriesDescAr,
      this.categoriesImage,
      this.categoriesDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'].toString();
    categoriesNameAr = json['categories_name_ar'].toString();
    categoriesDesc = json['categories_desc'].toString();
    categoriesDescAr = json['categories_desc_ar'].toString();
    categoriesImage = json['categories_image'].toString();
    categoriesDatetime = json['categories_datetime'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_desc'] = this.categoriesDesc;
    data['categories_desc_ar'] = this.categoriesDescAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}
