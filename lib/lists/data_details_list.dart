import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/screens/provaider_screen.dart';

class DataDetailsList extends ConsumerStatefulWidget {
  const DataDetailsList({Key? key}) : super(key: key);

  @override
  ConsumerState<DataDetailsList> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<DataDetailsList> {
  @override
  Widget build(BuildContext context) {
    final cryptoProvider = ref.watch(dataCryptoProvider);

    return SingleChildScrollView(
      child: Column(children: [
        cryptoProvider.when(
            data: (getdata) => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: getdata
                            .map((datas) => Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(children: [
                                  ListTile(
                                    title: const Text("Moeda"),
                                    subtitle: Text(datas.name),
                                  ),

                                  // gráfico

                                  Column(
                                    children: [
                                      const Text("Informações"),
                                      const Divider(),
                                      Column(children: [
                                        ListTile(
                                          title: Text(datas.name),
                                          subtitle: const Text("Valor atual"),
                                          trailing: Text("R\$" +
                                              datas
                                                  .metrics.market_data.price_usd
                                                  .toString()),
                                        ),
                                        const Divider(),
                                        ListTile(
                                            title: const Text("Cap de mercado"),
                                            trailing: Column(
                                              children: [
                                                SizedBox(
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
                                            )),
                                        ListTile(
                                          title: const Text("Valor mínimo"),
                                          trailing: Text(datas.metrics
                                              .market_data.ohlcv_last_1_hour.low
                                              .toString()),
                                        ),
                                        ListTile(
                                          title: const Text("Valor máximo"),
                                          trailing: Text(datas
                                              .metrics
                                              .market_data
                                              .ohlcv_last_1_hour
                                              .high
                                              .toString()),
                                        )
                                      ])
                                    ],
                                  ),
                                  const Divider()
                                ])))
                            .toList(),
                      )
                    ]),
            error: (error, stackTrace) => const Text("Ops, algo deu errado!"),
            loading: () => const CircularProgressIndicator()),
      ]),
    );
  }
}
