import 'package:admin/controller/settings_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widget/settings/customSettingListtile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(height: Get.width / 3, color: AppColor.primaryColor),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  customSettingListTile(
                    trailing: Switch(onChanged: (val) {}, value: true),
                    title: "Disable Notifications",
                  ),
                  customSettingListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersPending);
                    },
                    trailing: Icon(Icons.card_travel),
                    title: "Orders",
                  ),
                  customSettingListTile(
                    onTap: () {
                      Get.toNamed(AppRoute.ordersArchive);
                    },
                    trailing: Icon(Icons.card_travel),
                    title: "Archive",
                  ),

                  customSettingListTile(
                    onTap: () {
                      //Get.toNamed(AppRoute.addressView);
                    },
                    trailing: Icon(Icons.location_on_outlined),
                    title: "Address",
                  ),

                  customSettingListTile(
                    onTap: () {},
                    trailing: Icon(Icons.help_outline_rounded),
                    title: "About us",
                  ),
                  customSettingListTile(
                    onTap: () async {
                      await launchUrl(Uri.parse("tel:+212714710674"));
                    },
                    trailing: Icon(Icons.phone_callback_outlined),
                    title: "Contact us",
                  ),

                  GetBuilder<SettingsController>(
                    init: SettingsController(),
                    builder: ((controller) => customSettingListTile(
                      onTap: () {
                        controller.logout();
                      },
                      trailing: Icon(Icons.exit_to_app),
                      title: "Logout",
                    )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
