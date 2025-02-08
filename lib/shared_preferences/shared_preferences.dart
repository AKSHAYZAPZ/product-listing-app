import 'package:product_listing_app/utils/common.dart';
import 'package:product_listing_app/utils/widgets/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonFunction {
  static clearUserDatas() {
    accessToken = '';
  }

  static addDataToSharedPreferences(String key, var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (key == Common.token) {
      await prefs.setString(key, value);
    } else {
      prefs.clear();
      clearUserDatas();
    }
  }

  static getSavedKey(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? values = prefs.getString(key);
    return values;
  }
}
