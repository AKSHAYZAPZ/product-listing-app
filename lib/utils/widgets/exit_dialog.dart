import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../color_constants.dart';

exitDialogue(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: const Text('Are you sure want to exit?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstant.appBlue,
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
              child: const Text(
                'Yes',
                style: TextStyle(
                  color: ColorConstant.white,
                ),
              ))
        ],
      );
    },
  );
}
