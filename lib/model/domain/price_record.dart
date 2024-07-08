import 'package:freezed_annotation/freezed_annotation.dart';

part 'price_record.freezed.dart';
part 'price_record.g.dart';

@freezed
class PriceRecord with _$PriceRecord {
  PriceRecord._();

  factory PriceRecord({
    required String opinion,
    required int probability,
    required DateTime timestamp,
  }) = _PriceRecord;

  factory PriceRecord.fromJson(Map<String, dynamic> json) =>
      _$PriceRecordFromJson(json);
}
