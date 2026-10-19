import 'package:admin/core/constant/imageasset.dart';
import 'package:admin/core/constant/routes.dart';

import 'package:admin/view/widget/home/cardadmin.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeControllerImp());

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: ListView(
          children: [
            ScreenTypeLayout.builder(
              breakpoints: const ScreenBreakpoints(
                watch: 300,
                tablet: 600,
                desktop: 950,
              ),
              mobile: (context) => Container(color: Colors.blue, height: 20),
              tablet: (context) => Container(color: Colors.yellow, height: 20),
              desktop: (context) => Container(color: Colors.red, height: 20),
              watch: (context) => Container(color: Colors.purple, height: 20),
            ),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: getValueForScreenType<int>(
                  context: context,
                  mobile: 3,
                  tablet: 4,
                  desktop: 5,
                ),
                mainAxisExtent: 150,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,

              children: [
                CardAdmin(
                  imagesUrl: AppImageAsset.categories,
                  title: "Categories",
                  onTap: () {
                    Get.toNamed(AppRoute.categoriesView);
                  },
                ),
                CardAdmin(
                  imagesUrl: AppImageAsset.avatar,
                  title: "Users",
                  onTap: () {},
                ),

                CardAdmin(
                  imagesUrl: AppImageAsset.notifications,
                  title: "Notifications",
                  onTap: () {},
                ),
                CardAdmin(
                  imagesUrl: AppImageAsset.products,
                  title: "Products",
                  onTap: () {
                    Get.toNamed(AppRoute.ItemsView);
                  },
                ),

                CardAdmin(
                  imagesUrl: AppImageAsset.orders,
                  title: "Orders",
                  onTap: () {
                    Get.toNamed(AppRoute.ordersScreen);
                  },
                ),
                CardAdmin(
                  imagesUrl: AppImageAsset.reports,
                  title: "Reports",
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
