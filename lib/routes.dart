import 'package:admin/bindings/auth_bindings.dart';
import 'package:admin/bindings/categories_bindings/categoriesadd_bindings.dart';
import 'package:admin/bindings/categories_bindings/categoriesedit_bindings.dart';
import 'package:admin/bindings/categories_bindings/categoriesview_bindings.dart';
import 'package:admin/bindings/home_bindings.dart';
import 'package:admin/bindings/items_bindings/itemsadd_bindings.dart';
import 'package:admin/bindings/items_bindings/itemsedit_bindings.dart';
import 'package:admin/bindings/items_bindings/itemsview_bindings.dart';
import 'package:admin/bindings/orders_bindings/archive_bindings.dart';
import 'package:admin/bindings/orders_bindings/details_bindings.dart';
import 'package:admin/bindings/orders_bindings/ordersaccepted_bindings.dart';
import 'package:admin/bindings/orders_bindings/ordersscreen_bindings.dart';
import 'package:admin/bindings/orders_bindings/pending_bindings.dart';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/middleware/mymiddleware.dart';

import 'package:admin/view/screen/OnBoarding.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:admin/view/screen/auth/signup.dart';
import 'package:admin/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:admin/view/screen/auth/forgetpassword/success_reset_password.dart';
import 'package:admin/view/screen/auth/success_signup.dart';
import 'package:admin/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:admin/view/screen/auth/verifycodesignup.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/categories/edit.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/items/add.dart';
import 'package:admin/view/screen/items/edit.dart';
import 'package:admin/view/screen/items/view.dart';
import 'package:admin/view/screen/orders/accepted.dart';
import 'package:admin/view/screen/orders/orderscreen.dart';
import 'package:admin/view/screen/language.dart';
import 'package:admin/view/screen/notification.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/details.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:admin/view/screen/settings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  //---------------------------Lang---------------------------
  GetPage(name: "/", page: () => Language(), middlewares: [MyMiddleware()]),

  // GetPage(name: "/", page: () => Cart()),
  GetPage(name: AppRoute.onBoarding, page: () => OnBoarding()),

  //---------------------------Auth---------------------------
  GetPage(name: AppRoute.login, page: () => Login(), binding: AuthBinding()),
  GetPage(name: AppRoute.signUp, page: () => SignUp(), binding: AuthBinding()),
  GetPage(
    name: AppRoute.forgetPassword,
    page: () => ForgetPassword(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoute.resetPassword,
    page: () => ResetPassword(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoute.verifyCode,
    page: () => verifyCode(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: AppRoute.successResetPassword,
    page: () => SuccessResetPassword(),
  ),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(
    name: AppRoute.verifyCodeSignUp,
    page: () => VerifyCodeSignUp(),
    binding: AuthBinding(),
  ),

  //---------------------------Home---------------------------
  GetPage(name: AppRoute.home, page: () => Home(), binding: HomeBinding()),

  GetPage(
    name: AppRoute.ordersArchive,
    page: () => OrderScreen(),
    binding: ArchiveBindings(),
  ),

  //---------------------------Orders---------------------------
  GetPage(
    name: AppRoute.ordersArchive,
    page: () => const OrdersArchiveView(),
    binding: ArchiveBindings(),
  ),
  GetPage(
    name: AppRoute.ordersAccepted,
    page: () => const OrdersAccepted(),
    binding: OrderAcceptedBindings(),
  ),

  GetPage(
    name: AppRoute.ordersDetails,
    page: () => const OrdersDetails(),
    binding: DetailsBindings(),
  ),

  GetPage(
    name: AppRoute.ordersPending,
    page: () => const OrdersPending(),
    binding: PendingBindings(),
  ),
   GetPage(
    name: AppRoute.ordersScreen,
    page: () => const OrderScreen(),
    binding: OrderScreenBindings(),
  ),

  //---------------------------Categories---------------------------
  GetPage(
    name: AppRoute.categoriesView,
    page: () => const CategoriesView(),
    binding: CategoriesViewBindings(),
  ),
  GetPage(
    name: AppRoute.categoriesAdd,
    page: () => const CategoriesAdd(),
    binding: CategoriesAddBindings(),
  ),
  GetPage(
    name: AppRoute.categoriesEdit,
    page: () => const CategoriesEdit(),
    binding: CategoriesEditBindings(),
  ),

  //---------------------------Items---------------------------
  GetPage(
    name: AppRoute.ItemsView,
    page: () => const ItemsView(),
    binding: ItemsViewBindings(),
  ),
  GetPage(
    name: AppRoute.ItemsAdd,
    page: () => const ItemsAdd(),
    binding: ItemsAddBindings(),
  ),
  GetPage(
    name: AppRoute.ItemsEdit,
    page: () => const ItemsEdit(),
    binding: ItemsEditBindings(),
  ),
];
