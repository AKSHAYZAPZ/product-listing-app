import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.onChanged,
  });

  final List<TextEditingController> controller;
  final List<FocusNode> focusNode;
  final void Function(String, int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(4, (index) {
        return Stack(
          children: [
            // Main Container
            Container(
              width: 70,
              height: 58,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            // Inner Shadow Effect
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.3),
                      blurRadius: 0,
                      spreadRadius: 0,
                      offset: const Offset(0, 0),
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
              ),
            ),
            // TextField
            Positioned.fill(
              child: Center(
                child: TextField(
                  controller: controller[index],
                  focusNode: focusNode[index],
                  onChanged: (value) => onChanged(value, index),
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}


