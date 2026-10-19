import 'package:admin/core/class/crud.dart';
import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/home_data.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCategory);
}

class HomeControllerImp extends SearchMixController {
 



  @override
  void onInit() {
    //getData();
    //initialData();
    super.onInit();
  }

 
}

class SearchMixController extends GetxController {
 
  }

 

