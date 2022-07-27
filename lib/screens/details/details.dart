import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/widgets/chart_line.dart';
import '../../models/screen model/crypto_detailsscreen.dart';
import '../../widgets/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  final DataDetailsScreen info;
  const DetailsScreen({Key? key, required this.info}) : super(key: key);

  @override
  ConsumerState<DetailsScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String pageName = AppLocalizations.of(context)!.nameDetails;

    return Scaffold(
        appBar: PreferredSize(
          child: MyAppBar(
            pageName: pageName,
          ),
          preferredSize: const Size(double.infinity, 40),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(3),
              child: ChartLine(
                info: widget.info,
              )),
          Column(
            children: [
              Text(AppLocalizations.of(context)!.nameInfo),
              const Divider(),
              Column(children: [
                ListTile(
                  title: Text(widget.info.name),
                  subtitle: Text(AppLocalizations.of(context)!.nameActualValue),
                  trailing: Text("R\$" + widget.info.price_usd.toString()),
                ),
                const Divider(),
                ListTile(
                    title: Text(AppLocalizations.of(context)!.nameMarketCap),
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
                  title: Text(AppLocalizations.of(context)!.nameMinValue),
                  trailing: Text(widget.info.low.toString()),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.nameMaxValue),
                  trailing: Text(widget.info.high.toString()),
                )
              ])
            ],
          ),
          const Divider()
        ])));
  }
}
