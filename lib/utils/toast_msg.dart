import 'package:fluttertoast/fluttertoast.dart';

import 'app_color.dart';

class ToastMessage {
  static toastMessage() {
    Fluttertoast.showToast(
        msg: 'Product added to cart',
        backgroundColor: AppColor.containerColor,
        textColor: AppColor.whiteColor);
  }
}
