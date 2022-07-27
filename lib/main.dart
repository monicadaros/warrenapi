import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/screens/wallet/wallet.dart';
import 'package:warrenapi/widgets/bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'l10n/l10n.dart';

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
        },
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        supportedLocales: L10n.all,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    ),
  );
}
