import 'package:brainupp/const/const.dart';
import 'package:brainupp/widget_common/bg2_widget.dart';

class otherscreen extends StatelessWidget {
  const otherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bggWidget(
      Transform.translate(
          offset: Offset(-0, -0), // Move text 20 pixels to the right
          child: Center(
              child: Container(
            child: "Coming Soon".text.bold.white.size(40).make(),
          ))),
    );
  }
}
