import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/models/crypto_detailsscreen.dart';
import '../../widgets/app_bar.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final DataDetailsScreen info;
  const DetailsScreen({Key? key, required this.info}) : super(key: key);

  @override
  ConsumerState<DetailsScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    const String pageName = "Detalhes";

    return Scaffold(
        appBar: const PreferredSize(
          child: MyAppBar(
            pageName: pageName,
          ),
          preferredSize: Size(double.infinity, 40),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                          padding: const EdgeInsets.all(0),
                          child: Column(children: [
                            ListTile(
                              title: const Text("Moeda"),
                              subtitle: Text(widget.info.name),
                            ),

                            // gráfico

                            Column(
                              children: [
                                const Text("Informações"),
                                const Divider(),
                                Column(children: [
                                  ListTile(
                                    title: Text(widget.info.name),
                                    subtitle: const Text("Valor atual"),
                                    trailing: Text("R\$" +
                                        widget.info.price_usd.toString()),
                                  ),
                                  const Divider(),
                                  ListTile(
                                      title: const Text("Cap de mercado"),
                                      trailing: Column(
                                        children: [
                                          SizedBox(
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: widget.info
                                                            .percent_change_usd_last_1_hour >
                                                        0
                                                    ? Colors.green
                                                    : Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                widget.info
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
                                    trailing: Text(widget.info.low.toString()),
                                  ),
                                  ListTile(
                                    title: const Text("Valor máximo"),
                                    trailing: Text(widget.info.high.toString()),
                                  )
                                ])
                              ],
                            ),
                            const Divider()
                          ]))
                    ],
                  )
                ]),
          ]),
        ));
  }
}
