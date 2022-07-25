import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/screen model/crypto_detailsscreen.dart';
import '../screens/provaider_screen.dart';
import '../usecase/viewdata_chart.dart';

class ChartLine extends ConsumerStatefulWidget {
  final DataDetailsScreen info;
  const ChartLine({Key? key, required this.info}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartLineState();
}

class _ChartLineState extends ConsumerState<ChartLine> {
  num today = 0;
  num daysLenght = 10;
  List<dynamic> dataCharts = [];
  bool onTapSwitchChart = false;

  void _ChangeChart(bool state) {
    setState(() => onTapSwitchChart = state);
  }

  @override
  Widget build(BuildContext context) {
    final value = ref.watch(dataChartProvider);

    value.whenOrNull(data: (data) {
      dataCharts = data
          .map((timeseries) =>
              DataChartsViewData(btc_timeseries: timeseries.btc_timeseries))
          .toList();
      print("linha29${dataCharts.length}");
    });

    List<dynamic> valueCharts(num daysLenght) {
      final List<dynamic> value = [];
      for (var i = 0; i < daysLenght; i++) {
        value.add([dataCharts[0].timeseries.btc_timeseries[i][1], today + 1]);
        today += daysLenght;
      }
      print("teste$value");
      return value;
    }

    dataCharts = valueCharts(daysLenght);

    List<LineSeries<dynamic, double>> lineSeries = [
      LineSeries(
          dataSource: dataCharts,
          xValueMapper: (dynamic lineSeries, _) => lineSeries[1],
          yValueMapper: (dynamic lineSeries, _) => lineSeries[0]),
    ];
    List<BarSeries<dynamic, double>> barSeries = [
      BarSeries(
          dataSource: dataCharts,
          xValueMapper: (dynamic barSeries, _) => barSeries[1],
          yValueMapper: (dynamic barSeries, _) => barSeries[0])
    ];

    // buttonChart(String buttonName, int daysLenght) {
    //   return Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 6),
    //     child: OutlinedButton(
    //         style: ButtonStyle(
    //           backgroundColor: MaterialStateProperty.all(
    //               const Color.fromARGB(255, 235, 231, 231)),
    //         ),
    //         onPressed: () {
    //           valueCharts(daysLenght);
    //         },
    //         child: Text(buttonName)),
    //   );
    // }

    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Column(children: [
              ListTile(
                title: const Text("Moeda"),
                subtitle: Text(widget.info.name),
              ),
              Center(
                  child: onTapSwitchChart == true
                      ? Container(
                          padding: const EdgeInsets.all(1),
                          child: SfCartesianChart(
                            series: lineSeries,
                          ),
                        )
                      : SizedBox(
                          width: 300,
                          height: 170,
                          child: SfCartesianChart(series: barSeries),
                        ))
            ]),
          ),
        ]),
      ],
    ));
  }
}
