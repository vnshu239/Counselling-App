import 'package:brainupp/const/const.dart';

Widget bg4_Widget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(prbg), fit: BoxFit.fill)),
    child: child,
  );
}
