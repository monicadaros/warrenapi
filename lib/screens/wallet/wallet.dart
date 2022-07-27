import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/lists/crypto_list.dart';
import 'package:warrenapi/screens/provaider_screen.dart';
import 'package:warrenapi/screens/wallet/provaider_wallet.dart';
import 'package:warrenapi/widgets/bool_visible.dart';

import '../../models/screen model/crypto_detailsscreen.dart';
import '../details/details.dart';

class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  @override
  Widget build(BuildContext consumerStatefulElement) {
    final cryptoProvider = ref.watch(dataCryptoProvider(dataCryptoProvider));
    final dataValueWallet = DataMockList().dataMock;

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.fromLTRB(5, 30, 5, 5),
      child: Column(children: [
        const ListTile(
            title: Text(
              "Carteira",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
            trailing: VisibleValue()),
        Visibility(
            visible: ref.watch(viewValue),
            child: SingleChildScrollView(
              child: Column(children: [
                ...dataValueWallet.map(
                  (e) => ListTile(
                    title: Text(
                      "R\$" + e.valueWallet.toString() + ",00",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                cryptoProvider.when(
                    data: (getdata) => Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Divider(),
                              Column(
                                children: getdata
                                    .map((datas) => Container(
                                        padding: const EdgeInsets.all(2),
                                        child: Column(children: [
                                          ListTile(
                                            title: Text(datas.symbol),
                                            subtitle: Text(datas.name),
                                            trailing: Column(
                                              children: [
                                                Title(
                                                  color: Colors.black,
                                                  child: Text("R\$" +
                                                      datas.metrics.market_data
                                                          .price_usd
                                                          .toString()),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  width: 40,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      color: datas
                                                                  .metrics
                                                                  .market_data
                                                                  .percent_change_usd_last_1_hour >
                                                              0
                                                          ? Colors.green
                                                          : Colors.red,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    child: Text(
                                                      datas.metrics.market_data
                                                              .percent_change_usd_last_1_hour
                                                              .toString() +
                                                          "%",
                                                      textAlign: TextAlign.end,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailsScreen(
                                                            info: DataDetailsScreen(
                                                                high: datas
                                                                    .metrics
                                                                    .market_data
                                                                    .ohlcv_last_1_hour
                                                                    .high,
                                                                low: datas
                                                                    .metrics
                                                                    .market_data
                                                                    .ohlcv_last_1_hour
                                                                    .low,
                                                                name:
                                                                    datas.name,
                                                                percent_change_usd_last_1_hour: datas
                                                                    .metrics
                                                                    .market_data
                                                                    .percent_change_usd_last_1_hour,
                                                                price_usd: datas
                                                                    .metrics
                                                                    .market_data
                                                                    .price_usd),
                                                          )));
                                            },
                                          ),
                                          const Divider()
                                        ])))
                                    .toList(),
                              )
                            ]),
                    error: (error, stackTrace) =>
                        const Text("Ops, algo deu errado!"),
                    loading: () => const CircularProgressIndicator()),
              ]),
            )),
      ]),
    ));
  }
}
