import 'package:flutter/material.dart';
import 'package:warrenapi/screens/wallet/wallet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../screens/wallet/wallet.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({Key? key}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  final pageViewController = PageController();
  final List<Widget> pages = [
    Container(),
    const WalletScreen(),
    Container(),
  ];

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageViewController,
        children: [
          Container(),
          const WalletScreen(),
          Container(),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: pageViewController,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              currentIndex: pageViewController.page?.round() ?? 0,
              onTap: (index) {
                pageViewController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: AppLocalizations.of(context)!.nameHome,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.card_travel),
                  label: AppLocalizations.of(context)!.nameWallet,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_rounded),
                  label: AppLocalizations.of(context)!.nameMovement,
                ),
              ],
            );
          }),
    );
  }
}
