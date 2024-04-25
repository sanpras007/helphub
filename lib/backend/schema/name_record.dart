import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class NameRecord extends FirestoreRecord {
  NameRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('name');

  static Stream<NameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NameRecord.fromSnapshot(s));

  static Future<NameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NameRecord.fromSnapshot(s));

  static NameRecord fromSnapshot(DocumentSnapshot snapshot) => NameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNameRecordData({
  String? email,
  String? displayName,
  String? phoneNumber,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'phone_number': phoneNumber,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class NameRecordDocumentEquality implements Equality<NameRecord> {
  const NameRecordDocumentEquality();

  @override
  bool equals(NameRecord? e1, NameRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(NameRecord? e) => const ListEquality()
      .hash([e?.email, e?.displayName, e?.phoneNumber, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is NameRecord;
}
