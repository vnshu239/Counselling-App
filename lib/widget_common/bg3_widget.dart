import 'package:brainupp/const/const.dart';

Widget bg3Widget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(imgbg4), fit: BoxFit.fill)),
    child: child,
  );
}
