import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class EmergencyRecord extends FirestoreRecord {
  EmergencyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "phonum" field.
  String? _phonum;
  String get phonum => _phonum ?? '';
  bool hasPhonum() => _phonum != null;

  void _initializeFields() {
    _location = snapshotData['location'] as LatLng?;
    _name = snapshotData['name'] as String?;
    _phonum = snapshotData['phonum'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('emergency');

  static Stream<EmergencyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmergencyRecord.fromSnapshot(s));

  static Future<EmergencyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmergencyRecord.fromSnapshot(s));

  static EmergencyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmergencyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmergencyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmergencyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmergencyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmergencyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmergencyRecordData({
  LatLng? location,
  String? name,
  String? phonum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'name': name,
      'phonum': phonum,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmergencyRecordDocumentEquality implements Equality<EmergencyRecord> {
  const EmergencyRecordDocumentEquality();

  @override
  bool equals(EmergencyRecord? e1, EmergencyRecord? e2) {
    return e1?.location == e2?.location &&
        e1?.name == e2?.name &&
        e1?.phonum == e2?.phonum;
  }

  @override
  int hash(EmergencyRecord? e) =>
      const ListEquality().hash([e?.location, e?.name, e?.phonum]);

  @override
  bool isValidKey(Object? o) => o is EmergencyRecord;
}
