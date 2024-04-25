import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "phonenum" field.
  double? _phonenum;
  double get phonenum => _phonenum ?? 0.0;
  bool hasPhonenum() => _phonenum != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phonnum" field.
  double? _phonnum;
  double get phonnum => _phonnum ?? 0.0;
  bool hasPhonnum() => _phonnum != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _age = castToType<int>(snapshotData['age']);
    _phonenum = castToType<double>(snapshotData['phonenum']);
    _address = snapshotData['address'] as String?;
    _discription = snapshotData['discription'] as String?;
    _email = snapshotData['email'] as String?;
    _phonnum = castToType<double>(snapshotData['phonnum']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRequestRecordData({
  String? name,
  int? age,
  double? phonenum,
  String? address,
  String? discription,
  String? email,
  double? phonnum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'age': age,
      'phonenum': phonenum,
      'address': address,
      'discription': discription,
      'email': email,
      'phonnum': phonnum,
    }.withoutNulls,
  );

  return firestoreData;
}

class RequestRecordDocumentEquality implements Equality<RequestRecord> {
  const RequestRecordDocumentEquality();

  @override
  bool equals(RequestRecord? e1, RequestRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.age == e2?.age &&
        e1?.phonenum == e2?.phonenum &&
        e1?.address == e2?.address &&
        e1?.discription == e2?.discription &&
        e1?.email == e2?.email &&
        e1?.phonnum == e2?.phonnum;
  }

  @override
  int hash(RequestRecord? e) => const ListEquality().hash([
        e?.name,
        e?.age,
        e?.phonenum,
        e?.address,
        e?.discription,
        e?.email,
        e?.phonnum
      ]);

  @override
  bool isValidKey(Object? o) => o is RequestRecord;
}
