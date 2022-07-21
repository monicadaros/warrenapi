import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/usecase/viewdata.dart';
import 'package:warrenapi/widgets/chart_line.dart';
import '../../models/screen model/crypto_detailsscreen.dart';
import '../../widgets/app_bar.dart';
import '../provaider_screen.dart';

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
    final value = ref.watch(dataChartProvider);

    List<dynamic> dataCharts = [];
    value.whenOrNull(
        data: (data) => dataCharts = data
            .map((timeseries) =>
                DataChartsViewData(btc_timeseries: timeseries.btc_timeseries))
            .toList());

    return Scaffold(
        appBar: const PreferredSize(
          child: MyAppBar(
            pageName: pageName,
          ),
          preferredSize: Size(double.infinity, 40),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.all(3),
              child: ChartLine(
                dataCharts: dataCharts,
                info: null,
              )),
          Column(
            children: [
              const Text("Informações"),
              const Divider(),
              Column(children: [
                ListTile(
                  title: Text(widget.info.name),
                  subtitle: const Text("Valor atual"),
                  trailing: Text("R\$" + widget.info.price_usd.toString()),
                ),
                const Divider(),
                ListTile(
                    title: const Text("Cap de mercado"),
                    trailing: Column(
                      children: [
                        SizedBox(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color:
                                  widget.info.percent_change_usd_last_1_hour > 0
                                      ? Colors.green
                                      : Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              widget.info.percent_change_usd_last_1_hour
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
        ])));
  }
}
