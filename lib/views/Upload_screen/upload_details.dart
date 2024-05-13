import 'package:brainupp/const/const.dart';
import 'package:brainupp/views/Upload_screen/uploadtextfield.dart';
import 'package:brainupp/views/home_screen/home_screen.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';
import 'package:flutter/material.dart';

class UploadDetails extends StatelessWidget {
  final String? title;
  const UploadDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bggWidget(
      Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.color(whiteColor).make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              50.heightBox,
              "Description".text.size(36).bold.white.make(),
              10.heightBox,
              uploadTextField(
                title: "Title: ",
              ).box.color(pink).make(),
              20.heightBox,
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: "Ok".text.size(8).bold.make())
            ],
          ),
        ),
      ),
    );
  }
}
