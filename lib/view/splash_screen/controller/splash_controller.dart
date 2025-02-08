import 'package:get/get.dart';
import 'package:product_listing_app/shared_preferences/shared_preferences.dart';
import 'package:product_listing_app/utils/common.dart';
import 'package:product_listing_app/utils/widgets/user_data.dart';
import 'package:product_listing_app/view/Bottom_navigation/view/bottom_navigation_screen.dart';
import 'package:product_listing_app/view/login_screen/view/login_screen.dart';

class SplashScreenController extends GetxController {
  moveToNextPage() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        // CommonFunction.addDataToSharedPreferences('ahvahva', 'value');// in any case of clear the shared preference data
        accessToken = await CommonFunction.getSavedKey(Common.token);
        if (accessToken == null) {
          Get.off(() => LoginScreen());
        } else {
          Get.offAll(() => CustomBottomNavBar());
        }
      },
    );
  }

  @override
  void onInit() {
    moveToNextPage();
    super.onInit();
  }
}
