import 'package:opulizer/model/domain/price_record_snapshot.dart';

abstract class PriceRecordRepo {
  Stream<PriceRecordSnapshot?> getPriceRecordsStream();
}
