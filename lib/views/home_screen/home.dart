import 'package:brainupp/const/const.dart';
import 'package:brainupp/controllers/home_controller.dart';
import 'package:brainupp/views/Account%20screen/account_screen.dart';
import 'package:brainupp/views/Upload_screen/upload_screen.dart';
import 'package:brainupp/views/chatbot/chatbot_screen.dart';
import 'package:brainupp/views/session/session_screen.dart';
import 'package:brainupp/views/home_screen/home_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: home),
      const BottomNavigationBarItem(
          icon: Icon(Icons.video_camera_front), label: "Sessions"),
      const BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
      const BottomNavigationBarItem(icon: Icon(Icons.chat), label: "ChatBot"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: account),
    ];

    var navBody = [
      const HomeScreen(),
      const CategoryScreen(),
      const UploadScreen(),
      const chatbotscreen(),
      const AccountScreen(),
    ];

    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //     image:
        //         DecorationImage(image: AssetImage(imgbg4), fit: BoxFit.fill)),
        child: Column(
          children: [
            Obx(
              () => Expanded(
                child: navBody.elementAt(controller.currentNavIndex.value),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: pallete2,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          selectedIconTheme: const IconThemeData(color: pallete2),
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
