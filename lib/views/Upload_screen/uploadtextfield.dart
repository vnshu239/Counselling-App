import 'package:brainupp/const/const.dart';

Widget uploadTextField({
  String? title,
  String? hint, // controller, isPass
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.white.fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            prefix: title.text.color(darkFontGrey).make(),
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.cyan))),
      ),
      5.heightBox
    ],
  ).box.color(lightGrey).make();
}
