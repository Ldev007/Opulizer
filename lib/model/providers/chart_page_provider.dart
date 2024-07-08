import 'dart:async';

import 'package:opulizer/model/data/repositories/concrete/firebase_price_record_repo.dart';
import 'package:opulizer/model/domain/price_record_snapshot.dart';
import 'package:riverpod/riverpod.dart';

class ChartPageProvider {
  final FirebasePriceRecordRepo firebaseRepo;

  ChartPageProvider({required this.firebaseRepo});

  Stream<PriceRecordSnapshot?> getPriceRecordsStream() =>
      firebaseRepo.getPriceRecordsStream();
}

final chartPageProvider =
    AutoDisposeFutureProvider<Stream<PriceRecordSnapshot?>>((ref) {
  final provider =
      ChartPageProvider(firebaseRepo: ref.read(firebasePriceRepoProvider));

  return provider.getPriceRecordsStream();
});
