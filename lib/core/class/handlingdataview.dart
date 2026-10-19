import 'package:admin/core/class/statusrequest.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget? widget;
  const HandlingDataView({super.key, required this.statusRequest, this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 250,
              height: 250,
              //fit: BoxFit.fill,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
        ? Center(
            child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.serverfailure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.serverFailure,
              width: 350,
              height: 350,
            ),
          )
        : statusRequest == StatusRequest.failure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.noData,
              width: 250,
              height: 250,
              //fit: BoxFit.fill,
            ),
          )
        : widget!;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget? widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImageAsset.loading,
              width: 250,
              height: 250,
              //fit: BoxFit.fill,
            ),
          )
        : statusRequest == StatusRequest.offlinefailure
        ? Center(
            child: Lottie.asset(AppImageAsset.offline, width: 250, height: 250),
          )
        : statusRequest == StatusRequest.serverfailure
        ? Center(
            child: Lottie.asset(
              AppImageAsset.notFound,
              width: 350,
              height: 350,
            ),
          )
        : widget!;
  }
}
