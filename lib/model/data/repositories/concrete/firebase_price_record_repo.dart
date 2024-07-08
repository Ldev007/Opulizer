import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:opulizer/model/data/repositories/abstract/price_record_repo.dart';
import 'package:opulizer/model/domain/price_record.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opulizer/model/domain/price_record_snapshot.dart';

class FirebasePriceRecordRepo implements PriceRecordRepo {
  final FirebaseFirestore firestore;

  FirebasePriceRecordRepo({required this.firestore});

  @override
  Stream<PriceRecordSnapshot> getPriceRecordsStream() async* {
    StreamController<PriceRecordSnapshot> controller =
        StreamController<PriceRecordSnapshot>();
    PriceRecordSnapshot priceRecordSnapshot;
    List<PriceRecord> priceRecords = [];

    firestore
        .collection('opinions')
        .orderBy('timestamp')
        .snapshots()
        .listen((snap) {
      priceRecords =
          snap.docs.map((snap) => PriceRecord.fromJson(snap.data())).toList();

      priceRecordSnapshot = PriceRecordSnapshot(priceRecords: priceRecords);

      controller.add(priceRecordSnapshot);
    });

    yield* controller.stream;
  }
}

final firebasePriceRepoProvider = Provider<FirebasePriceRecordRepo>((ref) {
  return FirebasePriceRecordRepo(firestore: FirebaseFirestore.instance);
});
