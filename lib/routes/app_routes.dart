
import 'package:ecom_store/features/authentication/screens/login/login.dart';
import 'package:ecom_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecom_store/features/authentication/screens/password_config/forgot_password.dart';
import 'package:ecom_store/features/authentication/screens/singup/signup.dart';
import 'package:ecom_store/features/authentication/screens/singup/verify_email.dart';
import 'package:ecom_store/features/personalization/screens/address/address.dart';
import 'package:ecom_store/features/personalization/screens/profile/profile.dart';
import 'package:ecom_store/features/personalization/screens/settings/settings.dart';
import 'package:ecom_store/features/shop/screens/cart/cart.dart';
import 'package:ecom_store/features/shop/screens/checkout/checkout.dart';
import 'package:ecom_store/features/shop/screens/order/order.dart';
import 'package:ecom_store/features/shop/screens/product_details/product_detail.dart';
import 'package:ecom_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecom_store/features/shop/screens/store/store.dart';
import 'package:ecom_store/features/shop/screens/wishlist/wishlist.dart';
import 'package:ecom_store/routes/routes.dart';
import 'package:get/get.dart';

import '../features/shop/screens/home/home.dart';

class ecomAppRoutes{
  static final pages = [
    GetPage(name: ecomRoutes.home, page: () => const HomeScreen()),
    GetPage(name: ecomRoutes.store, page: () => const StoreScreen()),
    GetPage(name: ecomRoutes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: ecomRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: ecomRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: ecomRoutes.productDetails, page: () => const ProductDetailPage()),
    GetPage(name: ecomRoutes.order, page: () => const OrderScreen()),
    GetPage(name: ecomRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: ecomRoutes.cart, page: () => const CartScreen()),
    GetPage(name: ecomRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: ecomRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: ecomRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: ecomRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: ecomRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: ecomRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: ecomRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}