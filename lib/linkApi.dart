class AppLink {
  // --------------------------localhost --------------------------
  static const String server = serverLinkNgrok;
  static const String notification = "$server/notification.php";
  //static const String server = 'http://localhost/ecommerce';
  static const String serverAuth = 'http://localhost/ecommerce/auth';
  static const String imageStaticLocaly = 'assets/images';

  // --------------------------online server --------------------------
  static const String serverlink = 'http://ecomapp.wuaze.com/ecommerce';
  static const String serverLinkNgrok =
      "https://dcdc-2c0e-6042-44-fec0-75b5-e421-7825-d9a7.ngrok-free.app/ecommerce";

  //static const String imageServer = 'http://localhost/ecommerce/upload';
  static const String imageServer = '$server/upload';

  // --------------------------Image----------------------------
  //server
  static const String imageCategories = '$imageServer/categories';
  static const String imageItems = '$imageServer/items';

  static const String imageLocal = 'assets/images';
  static const String imageLocalCategories = '$imageLocal/categories';
  static const String imageLocalItems = '$imageLocal/items';
  // --------------------------Image----------------------------

  // --------------------------Auth----------------------------
  static const String test = '$server/test.php';
  static const String signup = '$server/admin/auth/signup.php';
  static const String verifyCodeSignUp = '$server/auth/verifycode.php';
  static const String login = '$server/admin/auth/login.php';
  static const String resend = "$server/auth/resend.php";

  // --------------------------Forget Password----------------------------
  static const String checkemail = '$server/forgetpassword/checkemail.php';
  static const String resetpassword =
      '$server/forgetpassword/resetpassword.php';
  static const String verifycode = '$server/forgetpassword/verifycode.php';

  // --------------------------Home----------------------------
  static const String home = '$server/admin/home.php';
  static const String searchItems = "$server/admin/items/search.php";

  // --------------------------Categories----------------------------
  static const String categoriesView = "$server/admin/categories/view.php";
  static const String categoriesAdd = "$server/admin/categories/add.php";
  static const String categoriesEdit = "$server/admin/categories/edit.php";
  static const String categoriesDelete = "$server/admin/categories/delete.php";

  // --------------------------Items----------------------------
  static const String itemsView = "$server/admin/items/view.php";
  static const String itemsAdd = "$server/admin/items/add.php";
  static const String itemsEdit = "$server/admin/items/edit.php";
  static const String itemsDelete = "$server/admin/items/delete.php";

  // --------------------------Checkout----------------------------
  static const String checkout = "$server/orders/checkout.php";

  // --------------------------Orders----------------------------

  static const String approveOrders = "$server/admin/orders/approve.php";
  static const String prepareOrders = "$server/admin/orders/prepare.php";


  static const String viewPendingOrders =
      "$server/admin/orders/viewpending.php";
  static const String viewAcceptedOrders =
      "$server/admin/orders/viewaccepted.php";
  static const String viewArchiveOrders = "$server/admin/orders/archive.php";
  static const String viewDetailsOrders = "$server/admin/orders/details.php";
}
