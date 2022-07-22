import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/screen model/crypto_detailsscreen.dart';

class ChartLine extends ConsumerStatefulWidget {
  final List dataCharts;
  final DataDetailsScreen info;
  const ChartLine({Key? key, required this.dataCharts, required this.info})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartLineState();
}

class _ChartLineState extends ConsumerState<ChartLine> {
  @override
  Widget build(BuildContext context) {
    num today = 0;
    num daysLenght = 10;
    List<dynamic> dataCharts = widget.dataCharts;

    List<dynamic> valueCharts(num daysLenght) {
      final List<dynamic> value = [];
      for (var i = 0; i < daysLenght; i++) {
        value.add([widget.dataCharts[0].btc_timeseries[i][1], today + 1]);
        today = daysLenght;
      }
      return value;
    }

    dataCharts = valueCharts(daysLenght);

    buttonChart(String buttonName, int daysLenght) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: OutlinedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 235, 231, 231)),
            ),
            onPressed: () {
              valueCharts(daysLenght);
            },
            child: Text(buttonName)),
      );
    }

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
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(1),
                      child: Column(children: [
                        SfCartesianChart(
                            primaryXAxis: CategoryAxis(isVisible: false),
                            primaryYAxis: NumericAxis(isVisible: false),
                            backgroundColor:
                                const Color.fromARGB(255, 235, 231, 231),
                            title: ChartTitle(
                                text: ("R\$1000,00"),
                                alignment: ChartAlignment.near,
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold)),
                            series: <ChartSeries<dynamic, double>>[
                              LineSeries<dynamic, double>(
                                animationDuration: 1000,
                                dataSource: dataCharts,
                                color: Colors.orange,
                                xValueMapper: (dynamic eixoX, _) =>
                                    eixoX(valueCharts(1)),
                                yValueMapper: (dynamic eixoY, _) =>
                                    eixoY(valueCharts(0)),
                                dataLabelSettings:
                                    const DataLabelSettings(isVisible: false),
                                markerSettings:
                                    const MarkerSettings(isVisible: false),
                              ),
                            ]),
                        // SizedBox(
                        //   height: 30,
                        //   child: ListView(
                        //     scrollDirection: Axis.horizontal,
                        //     children: [
                        //       ...buttonChart.map(
                        //         (e) => Row(children: [
                        //           chartButtons(
                        //               e.buttonName.toString() + "D",
                        //               e.buttonName.toInt())
                        //         ]),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ]))
                ].toList(),
              )
            ]),
          ),
        ]),
      ],
    ));
  }
}
// class ChartLine extends StatefulWidget {
//   const ChartLine({Key? key}) : super(key: key);

//   @override
//   State<ChartLine> createState() => _ChartLineState();
// }

// class _ChartLineState extends State<ChartLine> {
//   bool chartBar = true;
//   List<CapitalDate> data = <CapitalDate>[];
//   @override
//   initState() {
//     super.initState();
//     data = generateSpots(50);
//   }



//   callDataCharts(int numberSpots) {
//     setState(() {
//       data = generateSpots(numberSpots);
//     });
//   }

//   chartButtons(String buttonName, int numberSpots) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 6),
//       child: OutlinedButton(
//           style: ButtonStyle(
//             backgroundColor: MaterialStateProperty.all(
//                 const Color.fromARGB(255, 235, 231, 231)),
//           ),
//           onPressed: () {
//             callDataCharts(numberSpots);
//           },
//           child: Text(buttonName)),
//     );
//   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final buttonChart = ChartButtonList().buttonChart;
// //     const valorCarteira = 1000;
// //     return Material(
// //       child: Column(children: [
// //         SfCartesianChart(
// //             primaryXAxis: CategoryAxis(isVisible: false),
// //             primaryYAxis: NumericAxis(isVisible: false),
// //             backgroundColor: const Color.fromARGB(255, 235, 231, 231),
// //             title: ChartTitle(
// //                 text: ("R\$$valorCarteira,00"),
// //                 alignment: ChartAlignment.near,
// //                 textStyle: const TextStyle(
// //                     color: Colors.black,
// //                     fontSize: 30,
// //                     fontWeight: FontWeight.bold)),
// //             series: <ChartSeries<CapitalDate, DateTime>>[
// //               LineSeries<CapitalDate, DateTime>(
// //                 animationDuration: 1000,
// //                 dataSource: data,
// //                 color: Colors.orange,
// //                 xValueMapper: (CapitalDate data, _) => data.days,
// //                 yValueMapper: (CapitalDate data, _) => data.marketCapital,
// //                 dataLabelSettings: const DataLabelSettings(isVisible: false),
// //                 markerSettings: const MarkerSettings(isVisible: false),
// //               ),
// //             ]),
// //         SizedBox(
// //           height: 30,
// //           child: ListView(
// //             scrollDirection: Axis.horizontal,
// //             children: [
// //               ...buttonChart.map(
// //                 (e) => Row(children: [
// //                   chartButtons(
// //                       e.buttonName.toString() + "D", e.buttonName.toInt())
// //                 ]),
// //               )
// //             ],
// //           ),
// //         )
// //       ]),
// //     );
// //   }
// // }
