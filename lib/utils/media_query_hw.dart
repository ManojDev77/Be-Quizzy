import 'package:flutter/cupertino.dart';

class GetHeightWidth {
  static double heightH({required double val, required BuildContext context}) {
    return MediaQuery.of(context).size.height * val;
  }

  static double widgetW({required double val, required BuildContext context}) {
    return MediaQuery.of(context).size.width * val;
  }
}
