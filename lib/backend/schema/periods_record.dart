import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PeriodsRecord extends FirestoreRecord {
  PeriodsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "perioddate" field.
  DateTime? _perioddate;
  DateTime? get perioddate => _perioddate;
  bool hasPerioddate() => _perioddate != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  void _initializeFields() {
    _perioddate = snapshotData['perioddate'] as DateTime?;
    _user = snapshotData['user'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('periods');

  static Stream<PeriodsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PeriodsRecord.fromSnapshot(s));

  static Future<PeriodsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PeriodsRecord.fromSnapshot(s));

  static PeriodsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PeriodsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PeriodsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PeriodsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PeriodsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PeriodsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPeriodsRecordData({
  DateTime? perioddate,
  String? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'perioddate': perioddate,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class PeriodsRecordDocumentEquality implements Equality<PeriodsRecord> {
  const PeriodsRecordDocumentEquality();

  @override
  bool equals(PeriodsRecord? e1, PeriodsRecord? e2) {
    return e1?.perioddate == e2?.perioddate && e1?.user == e2?.user;
  }

  @override
  int hash(PeriodsRecord? e) =>
      const ListEquality().hash([e?.perioddate, e?.user]);

  @override
  bool isValidKey(Object? o) => o is PeriodsRecord;
}
