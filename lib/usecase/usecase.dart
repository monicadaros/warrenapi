import 'package:warrenapi/usecase/mapper.dart';
import 'package:warrenapi/usecase/viewdata.dart';
import 'package:warrenapi/usecase/viewdata_chart.dart';
import '../repository/cryptodata_repository.dart';

class DataCryptoUseCase {
  final DataCryptoRepository repository;

  DataCryptoUseCase({required this.repository});

  Future<List<DataCryptoViewData>> execute() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await repository.getData();

    return response.toViewData();
  }

  Future<List<DataChartsViewData>> executechart() async {
    final response = await repository.getData();

    return response.toChartData();
  }
}
