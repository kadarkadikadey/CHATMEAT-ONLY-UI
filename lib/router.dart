import 'package:chatmeat/chat_screen/chat_screen.dart';
import 'package:chatmeat/common/widgets/error_screen.dart';
import 'package:chatmeat/home_screen/feature/camera_for_qr_code.dart';
import 'package:chatmeat/home_screen/feature/edit_profile_page.dart';
import 'package:chatmeat/home_screen/feature/qr_code.dart';
import 'package:chatmeat/home_screen/feature/setting_page.dart';
import 'package:chatmeat/home_screen/home_screen.dart';
import 'package:chatmeat/landingScreen/landing_screen.dart';
import 'package:chatmeat/login_page/screen/auth_password_screen.dart';
import 'package:chatmeat/login_page/screen/banner_screen.dart';
import 'package:chatmeat/login_page/screen/login_screen.dart';
import 'package:chatmeat/login_page/screen/profile_pic_screen.dart';
import 'package:chatmeat/login_page/screen/signin_screen.dart';
import 'package:chatmeat/login_page/screen/signindetail_screen.dart';
import 'package:chatmeat/shop_or_friend_profile_screen/shop_or_friend_profile_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Landingpage.routeName:
      return MaterialPageRoute(
        builder: (context) => const Landingpage(),
        );
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
        );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
        );
    case SigninScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SigninScreen(),
        );
    case AuthPasswordScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const AuthPasswordScreen(),
        );
    case BannerScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const BannerScreen(),
        );
    case ProfilePicScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProfilePicScreen(),
        );
    case SignindetailScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const SignindetailScreen(),
        );
    case ChatScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ChatScreen(),
        );
    case ShopOrFriendProfileScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const ShopOrFriendProfileScreen(),
        );
    case CameraForQrCode.routeName:
      return MaterialPageRoute(
        builder: (context) => const CameraForQrCode(),
        );
    case SettingPage.routeName:
      return MaterialPageRoute(
        builder: (context) => const SettingPage(),
        );
    case EditProfilePage.routeName:
      return MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
        );
    case QrCode.routeName:
      return MaterialPageRoute(
        builder: (context) => const QrCode(),
        );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This Page does\'n Exist'),
        ),
        );
  }
}
