/* import 'package:admin/controller/notification_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:jiffy/jiffy.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<NotificationController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const Center(
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ...List.generate(controller.data.length, (index) {
                  var notification = controller.data[index];
                  String title = notification['notification_title'] ?? "";
                  String body = notification['notification_body'] ?? "";
                  String datetime = notification['notification_datetime'] ?? "";

                  String timeAgo = "";
                  if (datetime.isNotEmpty) {
                    try {
                      timeAgo = Jiffy.parse(
                        datetime,
                        pattern: "yyyy-MM-dd HH:mm:ss",
                      ).fromNow();
                    } catch (e) {
                      timeAgo = datetime;
                    }
                  }

                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Stack(
                      children: [
                        ListTile(title: Text(title), subtitle: Text(body)),
                        Positioned(
                          right: 5,
                          top: 15,
                          child: Text(
                            timeAgo,
                            style: const TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */
