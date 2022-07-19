class DataDetailsScreen {
  final String name;
  final num price_usd;
  final num percent_change_usd_last_1_hour;
  final num high;
  final num low;

  DataDetailsScreen(
      {required this.high,
      required this.low,
      required this.name,
      required this.percent_change_usd_last_1_hour,
      required this.price_usd});
}
