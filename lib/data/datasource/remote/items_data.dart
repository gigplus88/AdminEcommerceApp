import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/linkApi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);

  get() async {
    var response = await crud.postData(AppLink.itemsView, {});
    return response.fold((l) => l, (r) => r);
  }

  add(Map data, dynamic file) async {
    var response = await crud.addRequestWithImageOne(AppLink.itemsAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  edit(Map data, dynamic? file) async {
    var response;
    if (file == null) {
      response = await crud.postData(AppLink.itemsEdit, data);
    } else {
      response = await crud.addRequestWithImageOne(AppLink.itemsEdit, data, file);
    }
    return response.fold((l) => l, (r) => r);
  }

  delete(Map data) async {
    var response = await crud.postData(AppLink.itemsDelete, data);
    return response.fold((l) => l, (r) => r);
  }
}