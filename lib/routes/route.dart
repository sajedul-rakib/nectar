import 'package:get/get.dart';
import 'package:nectar/routes/route_name.dart';
import 'package:nectar/screens/bottom_navigation_bar/index.dart';
import 'package:nectar/screens/cart_screen/index.dart';
import 'package:nectar/screens/explore_screen/index.dart';
import 'package:nectar/screens/favourite_screen/index.dart';
import 'package:nectar/screens/home_screen/index.dart';
import 'package:nectar/screens/login_screen/index.dart';
import 'package:nectar/screens/order_tracking_screen/index.dart';
import 'package:nectar/screens/product_detail_screen//index.dart';
import 'package:nectar/screens/profile_screen/index.dart';
import 'package:nectar/screens/reset_password_screen/index.dart';
import 'package:nectar/screens/search_with_category_screen/index.dart';
import 'package:nectar/screens/signIn_screen/index.dart';
import 'package:nectar/screens/splash_screen/index.dart';
import 'package:nectar/screens/user_details_screen/index.dart';

class RouteScreen {
  //initial route
  static const String initial = RouteName.initial;

  //pages
  static final List<GetPage> route = [
    //botton navigation bar screen
    GetPage(
      name: RouteName.bottomNavigationScreen,
      page: () => const BottomNavBar(),
      binding: BottomNavigationBarBindings(),
    ),

    //splash screen
    GetPage(
      name: RouteName.initial,
      page: () => const SplashScreen(),
      binding: SplashScreenBindings(),
    ),

    //boarding screen
    GetPage(
      name: RouteName.onBoardingScreen,
      page: () => const OnbordingScreen(),
    ),

    //log in screen
    GetPage(
        name: RouteName.logInScreen,
        page: () => const LoginScreen(),
        binding: LoginScreenBindings()),

    //sign in screen
    GetPage(
        name: RouteName.signInScreen,
        page: () => const SigninScreen(),
        binding: SignInBindings()),

    //home  screen
    GetPage(
        name: RouteName.homeScreen,
        page: () => const HomeScreen(),
        binding: HomeScreenBindings()),

    //product detail  screen
    GetPage(
        name: RouteName.productDetailScreen,
        page: () => const ProductDetailScreen(),
        binding: ProductDetailScreenBindings()),

    //explore detail  screen
    GetPage(
        name: RouteName.exploreScreen,
        page: () => const ExploreScreen(),
        binding: ExploreScreenBindings()),

    //cart detail  screen
    GetPage(
        name: RouteName.cartScreen,
        page: () => const CartScreen(),
        binding: CartScreenBindings()),

    //profile detail  screen
    GetPage(
        name: RouteName.profileScreen,
        page: () => const ProfileScreen(),
        binding: ProfileScreenBindings()),

    //profile detail  screen
    GetPage(
        name: RouteName.favouriteScreen,
        page: () => const FavouriteScreen(),
        binding: FavouriteScreenBindins()),

    //reset password screen
    GetPage(
        name: RouteName.resetPasswordScreen,
        page: () => const ResetPasswordScreen(),
        binding: ResetPasswordScreenBindings()),

    //category search  screen
    GetPage(
        name: RouteName.categorySearchScreen,
        page: () => const CategorySearchScreen(),
        binding: CategorySearchScreenBindings()),

    //user detail  screen
    GetPage(
        name: RouteName.userDetailScreen,
        page: () => const UserDetailScreen(),
        binding: UserDetailsScreenBindings()),

    //order tracking screen
    GetPage(
        name: RouteName.orderTrackingScreen,
        page: () => const OrderTrackingScreen(),
        binding: OrderTrackingScreenBindings()),
  ];
}
