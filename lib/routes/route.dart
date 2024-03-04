import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/admin/admin_bottom_nav_bar/admin_bottom_nav_bar_screen.dart';
import 'package:nectar/screens/admin/admin_bottom_nav_bar/bindings.dart';
import 'package:nectar/screens/admin/admin_log_in_screen/index.dart';
import 'package:nectar/screens/admin/admin_profile/admin_profile_screen.dart';
import 'package:nectar/screens/admin/admin_profile/bindings.dart';
import 'package:nectar/screens/admin/admin_screen/index.dart';
import 'package:nectar/screens/admin/order_list_screen/index.dart';
import 'package:nectar/screens/admin/product_list_screen/index.dart';
import 'package:nectar/screens/bottom_navigation_bar/index.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/explore_screen/index.dart';
import 'package:nectar/screens/favourite_screen/index.dart';
import 'package:nectar/screens/home_screen/index.dart';
import 'package:nectar/screens/login_screen/index.dart';
import 'package:nectar/screens/product_detail_screen//index.dart';
import 'package:nectar/screens/profile_screen/index.dart';
import 'package:nectar/screens/reset_password_screen/index.dart';
import 'package:nectar/screens/search_with_category_screen/index.dart';
import 'package:nectar/screens/signin_screen/index.dart';
import 'package:nectar/screens/splash_screen/index.dart';

class RouteScreen {
  //initial route
  static const String INITIAL = RouteName.INITIAL;

  //pages
  static final List<GetPage> route = [
    //botton navigation bar screen
    GetPage(
      name: RouteName.BOTTONAVIGATION_SCREEN,
      page: () => const BottomNavBar(),
      binding: BottomNavigationBarBindings(),
    ),

    //splash screen
    GetPage(
      name: RouteName.INITIAL,
      page: () => const SplashScreen(),
      binding: SplashScreenBindings(),
    ),

    //boarding screen
    GetPage(
      name: RouteName.ONBORDING_SCREEN,
      page: () => const OnbordingScreen(),
    ),

    //log in screen
    GetPage(
        name: RouteName.LOGIN_SCREEN,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings()),

    //sign in screen
    GetPage(
        name: RouteName.SIGNIN_SCREEN,
        page: () => const SigninScreen(),
        binding: SignInBindings()),

    //home  screen
    GetPage(
        name: RouteName.HOME_SCREEN,
        page: () => const HomeScreen(),
        binding: HomeScreenBindings()),

    //product detail  screen
    GetPage(
        name: RouteName.PRODUCT_DETAIL_SCREEN,
        page: () => const ProductDetailScreen(),
        binding: ProductDetailScreenBindings()),

    //explore detail  screen
    GetPage(
        name: RouteName.EXPLORE_SCREEN,
        page: () => const ExploreScreen(),
        binding: ExploreScreenBindings()),

    //cart detail  screen
    GetPage(
        name: RouteName.CART_SCREEN,
        page: () => const CartScreen(),
        binding: CartScreenBindings()),

    //profile detail  screen
    GetPage(
        name: RouteName.PROFILE_SCREEN,
        page: () => const ProfileScreen(),
        binding: ProfileScreenBindings()),

    //profile detail  screen
    GetPage(
        name: RouteName.FAVOURITE_SCREEN,
        page: () => const FavouriteScreen(),
        binding: FavouriteScreenBindins()),

    //reset password screen
    GetPage(
        name: RouteName.RESET_PASSWORD_SCREEN,
        page: () => const ResetPasswordScreen(),
        binding: ResetPasswordScreenBindings()),

    //category search screen  screen
    GetPage(
        name: RouteName.CATEGORY_SEARCH_SCREEN,
        page: () => const CategorySearchScreen(),
        binding: CategorySearchScreenBindings()),

    //admin panel

    //admin bottom nav bar
    GetPage(
        name: RouteName.ADMIN_BOTTOM_NAV_BARSCREEN,
        page: () => const AdminBottomNavBarScreen(),
        binding: AdminBottomNavBarBindings()),

    //admin screen
    GetPage(
        name: RouteName.ADMIN_SCREEN,
        page: () => AdminScreen(),
        binding: AdminScreenBindings()),

    //admin verify screen
    GetPage(
        name: RouteName.ADMIN_VERIFY_SCREEN,
        page: () => const AdminVerifyScreen(),
        binding: AdminLogInScreenBindigs()),

    //admin log in screen
    GetPage(
        name: RouteName.ADMIN_LOG_IN_SCREEN,
        page: () => const AdminLogInScreen(),
        binding: AdminLogInScreenBindigs()),

    //admin profile screen
    GetPage(
        name: RouteName.ADMIN_PROFILE_SCREEN,
        page: () => const AdminProfileScreen(),
        binding: AdminProfileScreenBinding()),

    //order list screen
    GetPage(
        name: RouteName.ORDER_LIST,
        page: () => const OrderListScreen(),
        binding: OrderListScreenBindings()),

    //product list screen
    GetPage(
        name: RouteName.PRODUCT_LIST_SCREEN,
        page: () => const ProductListScreen(),
        binding: ProductListScreenBindings())
  ];
}
