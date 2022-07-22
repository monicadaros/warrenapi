import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ButtonDate extends ConsumerWidget {
  final String buttonName;
  final VoidCallback onPressed;
  const ButtonDate(
      {Key? key, required this.buttonName, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 235, 231, 231)),
            ),
            onPressed: () {
              onPressed();
            },
            child: Text(buttonName)));
  }
}
