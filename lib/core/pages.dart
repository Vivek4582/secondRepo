import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:untitled/core/routes.dart';
import 'package:untitled/feature/dashboard/binding/dashboardbinding.dart';
import 'package:untitled/feature/dashboard/view/dashboardview.dart';
import 'package:untitled/feature/details/binding/detailbinding.dart';
import 'package:untitled/feature/details/view/detailview.dart';
import 'package:untitled/feature/loginpage/binding/loginbinding.dart';
import 'package:untitled/feature/loginpage/view/loginview.dart';
import 'package:untitled/feature/profilepage/Binding/profileBinding.dart';
import 'package:untitled/feature/profilepage/view/profile_view.dart';
import 'package:untitled/feature/signup/binding/signupbinding.dart';
import 'package:untitled/feature/signup/view/signupview.dart';
import 'package:untitled/feature/slider/binding/sliderbinding.dart';
import 'package:untitled/feature/slider/view/sliderview.dart';
import 'package:untitled/feature/splash/binding/splashbinding.dart';
import 'package:untitled/feature/splash/view/splashview.dart';
import 'package:untitled/feature/verify/binding/verifybinding.dart';
import 'package:untitled/feature/verify/view/verifyview.dart';

List<GetPage> allpage=[

GetPage(
name: Routes.login,
page: () => LoginView(),
binding: LoginBinding()
),
  GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding()
  ),
  GetPage(
      name: Routes.dashboard,
      page: () => DashBoardView(),
      binding: DashboardBinding()
  ),
  GetPage(
      name: Routes.slider,
      page: () => SlideView(),
      binding: Sliderbinding()
  ),
  GetPage(
      name: Routes.signup,
      page: () => SignUpView(),
      binding: SignUpBinding()
  ),
  GetPage(
      name: Routes.verify,
      page: () => VerifyView(),
      binding: VerifyBinding()
  ),
  GetPage(
      name: Routes.detail,
      page: () => DetailView(),
      binding: DetailBinding()
  ),
  GetPage(
      name: Routes.profile,
      page: () =>ProfileView(),
      binding: Profilebinding()
  ),
];