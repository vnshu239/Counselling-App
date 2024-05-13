import 'package:brainupp/const/const.dart';
import 'package:brainupp/const/lists.dart';
import 'package:brainupp/views/Upload_screen/upload_details.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';
import 'package:get/get.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bggWidget(
      Scaffold(
          appBar: AppBar(),
          body: SafeArea(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categorylistname.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            //mainAxisSpacing: 4,
                            //crossAxisSpacing: 2,
                            mainAxisExtent: 70),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.white), // White border
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            categorylistname[index]
                                .text
                                .size(18)
                                .fontFamily(bold)
                                .color(whiteColor)
                                .center
                                .make(),
                          ],
                        )
                            .box
                            .margin(const EdgeInsets.all(2))
                            //.margin(const EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .padding(const EdgeInsets.all(12))
                            .make()
                            .box
                            .make()
                            .onTap(() {
                          Get.to(() =>
                              UploadDetails(title: categorylistname[index]));
                        }),
                      );
                    })
              ],
            ),
          ))),
    );
  }
}
