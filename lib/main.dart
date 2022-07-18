import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/screens/details/details.dart';
import 'package:warrenapi/screens/wallet/wallet.dart';
import 'package:warrenapi/widgets/bottom_bar.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'route_homepage',
        debugShowCheckedModeBanner: false,
        initialRoute: '/bottom_bar',
        routes: {
          '/bottom_bar': (BuildContext context) => const AppBottomBar(),
          '/wallet': (BuildContext context) => const WalletScreen(),
          '/details': (BuildContext context) => const DetailsScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
      ),
    ),
  );
}
