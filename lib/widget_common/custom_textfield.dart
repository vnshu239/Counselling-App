import 'package:brainupp/const/const.dart';

Widget customtextfield({String? title, String? hint, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(pallete2).fontFamily(bold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontFamily: bold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: pallete2))),
      ),
      5.heightBox
    ],
  );
}
