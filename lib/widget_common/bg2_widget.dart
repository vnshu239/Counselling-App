import 'package:brainupp/const/const.dart';

Widget bggWidget(Widget? child) {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(imgbg3), fit: BoxFit.fill)),
    child: child,
  );
}
