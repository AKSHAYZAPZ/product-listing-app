import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color_constants.dart';

class NetworkController extends GetxController {
  var isConnected = true.obs;

  @override
  void onInit() {
    super.onInit();

    checkConnectivity();


    Connectivity().onConnectivityChanged.listen((result) {
      isConnected.value = (result != ConnectivityResult.none);

    });
  }

  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    isConnected.value = (connectivityResult != ConnectivityResult.none);
    print(isConnected.value);
  }

  noDataImage(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/Group 339.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'No internet Connection',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.black,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: const Text(
                  'To continue using this service, please ensure that your device is connected to the internet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorConstant.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
