import 'dart:async';

import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/functions/handlingdatacontroller.dart';
import 'package:admin/data/datasource/remote/orders/details_data.dart';
import 'package:admin/data/model/ordersmodel.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  //List<CartModel> data = [];
  List data = [];

  late StatusRequest statusRequest;

  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  initialData() {
    completercontroller = Completer<GoogleMapController>();

    if (ordersModel.ordersType == "0" &&
        ordersModel.addressLat != null &&
        ordersModel.addressLong != null) {
      double? lat = double.tryParse(ordersModel.addressLat!);
      double? long = double.tryParse(ordersModel.addressLong!);

      if (lat != null && long != null) {
        cameraPosition = CameraPosition(
          target: LatLng(lat, long),
          zoom: 12.4746,
        );
        markers.add(
          Marker(markerId: const MarkerId("1"), position: LatLng(lat, long)),
        );
      }
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;

    var response = await ordersDetailsData.getData(ordersModel.ordersId!);

    print("=============================== Controller $response ");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        //data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }
}
