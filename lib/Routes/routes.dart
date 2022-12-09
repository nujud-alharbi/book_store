
import 'package:get/get.dart';

import '../View/Screens/admin/Add_product_form_screen.dart';
import '../View/Screens/admin/edit_product_screen.dart';
import '../View/Screens/admin/forget_password.dart';
import '../View/Screens/admin/stock_screen.dart';
import '../View/Screens/auth/login_screen.dart';
import '../View/Screens/setting/edit_profile.dart';
import '../View/Screens/setting/profile.dart';
import '../View/Screens/setting/setting.dart';
import '../View/Screens/auth/singup.dart';
import '../View/Screens/user/customer_home.dart';

class AppRoutes {
  //initialRoute
  static const forgot = Routes.forget_pass;
  static const sing = Routes.signup;
  static const stock = Routes.stockScreen;
  static const login = Routes.logIn;
  static const addProduct = Routes.logIn;
  static const customerHome = Routes.customerHome;



  static const edit = Routes.editProfileScreen;
  static const profile = Routes.profileScreen;
  static const setting = Routes.settingsScreen;
  //getPages
  static final routes = [
    GetPage(name: Routes.forget_pass, page: () => ForgotPasswordScreen()),
    GetPage(name: Routes.signup, page: () => SignUpScreen()),
    GetPage(name: Routes.stockScreen, page: () => StockScreen()),
    GetPage(name: Routes.logIn, page: () => Login_Screen()),
    GetPage(name: Routes.addProductForm, page: () => AddProductFromScreen()),
    GetPage(name: Routes.customerHome, page: () => CustomerHome()),

    GetPage(
        name: Routes.profileScreen,
        page: () => ProfileScreen()),

    GetPage(
        name: Routes.editProfileScreen,
        page: () => EditProfileScreen()),

    GetPage(
        name: Routes.settingsScreen,
        page: () => SettingScreen(),
        ),
  ];
}

class Routes {
  static const signup = '/SignUpScreen';
  static const stockScreen = '/StockScreen';
  static const logIn = '/LoginScreen';
  static const forget_pass = '/ForgetPasswordScreen';
  static const addProductForm = '/AddProductFromScreen';
  static const editProduct = '/EditProductScreen';
  static const customerHome = '/CustomerHome';


  static const profileScreen = '/ProfileScreen';
  static const editProfileScreen = '/EditProfileScreen';
  static const settingsScreen = '/SettingScreen';
}
