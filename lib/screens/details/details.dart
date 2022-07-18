import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/screens/provaider_screen.dart';
import 'package:warrenapi/widgets/app_bar.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext consumerStatefulElement) {
    final cryptoProvider = ref.watch(dataCryptoProvider);
    const String pageName = "Detalhes";

    return Scaffold(
        appBar: const PreferredSize(
          child: MyAppBar(
            pageName: pageName,
          ),
          preferredSize: Size(double.infinity, 40),
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
          child: Column(children: [
            cryptoProvider.when(
                data: (getdata) => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: getdata
                                .map((datas) => Container(
                                    padding: const EdgeInsets.all(2),
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
                                          ListView(children: [
                                            ListTile(
                                              title: Text(datas.name),
                                              subtitle:
                                                  const Text("Valor atual"),
                                              trailing: Text("R\$" +
                                                  datas.metrics.market_data
                                                      .price_usd
                                                      .toString()),
                                            ),
                                            const Divider(),
                                            ListTile(
                                              title:
                                                  const Text("Cap de mercado"),
                                              trailing: SizedBox(
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
                                            ),
                                            ListTile(
                                              title: const Text("Valor mínimo"),
                                              trailing: Text(datas
                                                  .metrics
                                                  .market_data
                                                  .ohlcv_last_1_hour
                                                  .low
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
                error: (error, stackTrace) =>
                    const Text("Ops, algo deu errado!"),
                loading: () => const CircularProgressIndicator()),
          ]),
        ));
  }
}
