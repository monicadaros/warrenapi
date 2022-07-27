import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/repository/cryptodata_repository_provider.dart';
import 'package:warrenapi/usecase/usecase.dart';
import 'package:warrenapi/usecase/viewdata.dart';

import '../usecase/viewdata_chart.dart';

final dataCryptoUseCase = Provider((ref) {
  return DataCryptoUseCase(repository: ref.read(dataCryptoRepositoryProvider));
});

final dataCryptoProvider = FutureProvider.autoDispose
    .family<List<DataCryptoViewData>, dynamic>((ref, arg) async {
  return ref.read(dataCryptoUseCase).execute();
});

final dataChartProvider =
    FutureProvider.autoDispose<List<DataChartsViewData>>((ref) async {
  return ref.read(dataCryptoUseCase).executechart();
});
