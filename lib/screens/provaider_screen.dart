import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:warrenapi/repository/cryptodata_repository_provider.dart';
import 'package:warrenapi/usecase/usecase.dart';
import 'package:warrenapi/usecase/viewdata.dart';

final dataCryptoUseCase = Provider((ref) {
  return DataCryptoUseCase(repository: ref.read(dataCryptoRepositoryProvider));
});

final dataCryptoProvider =
    FutureProvider<List<DataCryptoViewData>>((ref) async {
  return ref.read(dataCryptoUseCase).execute();
});
