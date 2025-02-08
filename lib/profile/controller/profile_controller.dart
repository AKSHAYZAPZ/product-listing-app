import 'package:get/get.dart';

import '../../../api_services/api_services.dart';
import '../models/profile_model.dart';

class ProfileController extends GetxController {
  ProfileModel? profileModel;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;

  getProfile() async {
    try {
      isLoading.value = true;
      profileModel = await ApiServices.getProfileData();
    } catch (e) {
      isError.value = true;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
