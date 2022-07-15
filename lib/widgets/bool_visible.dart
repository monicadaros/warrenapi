import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/wallet/provaider_wallet.dart';

class VisibleValue extends ConsumerWidget {
  const VisibleValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool visible = ref.watch(viewValue);
    return Padding(
      padding: const EdgeInsets.only(left: 100),
      child: SizedBox(
        height: 30,
        width: 30,
        child: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              onPressed: () => ref.read(viewValue.state).state = !visible,
              icon: visible
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
        ),
      ),
    );
  }
}
