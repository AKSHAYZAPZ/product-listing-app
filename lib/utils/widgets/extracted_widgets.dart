import 'package:fluttertoast/fluttertoast.dart';
import 'package:product_listing_app/utils/color_constants.dart';


showToast({
  required String msg,
}) {
  Fluttertoast.cancel();
  return Fluttertoast.showToast(
      timeInSecForIosWeb: 3,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      msg: msg,
      backgroundColor: ColorConstant.black,
      textColor: ColorConstant.white);
}