import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:warrenapi/lists/button_charts_list.dart';
import '../models/screen model/crypto_detailsscreen.dart';
import '../screens/provaider_screen.dart';
import '../usecase/viewdata_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChartLine extends ConsumerStatefulWidget {
  final DataDetailsScreen info;
  const ChartLine({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartLineState();
}

class _ChartLineState extends ConsumerState<ChartLine> {
  num today = 0;
  List<dynamic> dataCharts = [];
  bool selectChart = false;

  int currentDay = 5;

  void _replaceDate(int dataReplace) {
    setState(() {
      currentDay = dataReplace;
    });
  }

  void _replaceChart(bool replace) {
    setState(() => selectChart = replace);
  }

  @override
  Widget build(BuildContext context) {
    num daysLenght = currentDay;
    final value = ref.watch(dataChartProvider);

    value.whenOrNull(data: (data) {
      dataCharts = data
          .map((timeseries) =>
              DataChartsViewData(btc_timeseries: timeseries.btc_timeseries))
          .toList();
    });

    List<dynamic> valueCharts(num daysLenght) {
      final List<dynamic> value = [];
      for (var i = 0; i < daysLenght; i++) {
        value.add([dataCharts[0].btc_timeseries[i][1], today + 1]);
        today += daysLenght;
      }
      return value;
    }

    dataCharts = valueCharts(daysLenght);

    List<LineSeries<dynamic, int>> lineSeries = [
      LineSeries(
          dataSource: dataCharts,
          xValueMapper: (dynamic lineSeries, _) => lineSeries[1],
          yValueMapper: (dynamic lineSeries, _) => lineSeries[0]),
    ];
    List<BarSeries<dynamic, int>> barSeries = [
      BarSeries(
          dataSource: dataCharts,
          xValueMapper: (dynamic barSeries, _) => barSeries[1],
          yValueMapper: (dynamic barSeries, _) => barSeries[0])
    ];

    buttonChart(String buttonName, int daysLenght) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 235, 231, 231)),
            ),
            onPressed: () {
              _replaceDate(daysLenght);
            },
            child: Text(
              buttonName,
              style: const TextStyle(color: Colors.black),
            )),
      );
    }

    final buttonsChart = ChartButtonList().buttonChart;

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
                    title: Text(AppLocalizations.of(context)!.nameCoin),
                    subtitle: Text(widget.info.name),
                    trailing: IconButton(
                        onPressed: () => _replaceChart(!selectChart),
                        icon: selectChart
                            ? const Icon(Icons.bar_chart)
                            : const Icon(Icons.show_chart)),
                  ),
                  Center(
                      child: selectChart == true
                          ? Container(
                              padding: const EdgeInsets.all(2),
                              child: SfCartesianChart(
                                series: lineSeries,
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.all(2),
                              child: SfCartesianChart(
                                series: barSeries,
                              ))),
                  SizedBox(
                    height: 30,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      ...buttonsChart.map(
                        (e) => Row(children: [
                          buttonChart(
                            e.buttonName.toString() + "D",
                            e.buttonName.toInt(),
                          )
                        ]),
                      )
                    ]),
                  ),
                ]),
              )
            ]),
          ]),
    );
  }
}
