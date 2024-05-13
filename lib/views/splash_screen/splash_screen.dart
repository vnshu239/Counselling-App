import 'package:brainupp/const/const.dart';
import 'package:brainupp/views/auth_screen/login_screen.dart';
import 'package:brainupp/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  //create a method to change screen

  changeScreen() {
    Future.delayed(Duration(seconds: 2), () {
      //using getx
      //Get.to(() => Loginscreen());

      auth.authStateChanges().listen((User? user) {
        if (user == null) {
          Get.to(() => const Loginscreen());
        } else {
          Get.to(() => const Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: pallete2,
        body: Center(child: Image.asset(icSpl, fit: BoxFit.contain)));
  }
}
