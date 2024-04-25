import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MedicineRecord extends FirestoreRecord {
  MedicineRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "medicinename" field.
  String? _medicinename;
  String get medicinename => _medicinename ?? '';
  bool hasMedicinename() => _medicinename != null;

  // "dosage" field.
  int? _dosage;
  int get dosage => _dosage ?? 0;
  bool hasDosage() => _dosage != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "user" field.
  String? _user;
  String get user => _user ?? '';
  bool hasUser() => _user != null;

  void _initializeFields() {
    _medicinename = snapshotData['medicinename'] as String?;
    _dosage = castToType<int>(snapshotData['dosage']);
    _time = snapshotData['time'] as DateTime?;
    _user = snapshotData['user'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicine');

  static Stream<MedicineRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MedicineRecord.fromSnapshot(s));

  static Future<MedicineRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MedicineRecord.fromSnapshot(s));

  static MedicineRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MedicineRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MedicineRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MedicineRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MedicineRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MedicineRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMedicineRecordData({
  String? medicinename,
  int? dosage,
  DateTime? time,
  String? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'medicinename': medicinename,
      'dosage': dosage,
      'time': time,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class MedicineRecordDocumentEquality implements Equality<MedicineRecord> {
  const MedicineRecordDocumentEquality();

  @override
  bool equals(MedicineRecord? e1, MedicineRecord? e2) {
    return e1?.medicinename == e2?.medicinename &&
        e1?.dosage == e2?.dosage &&
        e1?.time == e2?.time &&
        e1?.user == e2?.user;
  }

  @override
  int hash(MedicineRecord? e) =>
      const ListEquality().hash([e?.medicinename, e?.dosage, e?.time, e?.user]);

  @override
  bool isValidKey(Object? o) => o is MedicineRecord;
}
