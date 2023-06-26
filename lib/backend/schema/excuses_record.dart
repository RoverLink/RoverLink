import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExcusesRecord extends FirestoreRecord {
  ExcusesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "excuse_user" field.
  DocumentReference? _excuseUser;
  DocumentReference? get excuseUser => _excuseUser;
  bool hasExcuseUser() => _excuseUser != null;

  // "excuse_photo_url" field.
  String? _excusePhotoUrl;
  String get excusePhotoUrl => _excusePhotoUrl ?? '';
  bool hasExcusePhotoUrl() => _excusePhotoUrl != null;

  // "excuse_date_missed" field.
  DateTime? _excuseDateMissed;
  DateTime? get excuseDateMissed => _excuseDateMissed;
  bool hasExcuseDateMissed() => _excuseDateMissed != null;

  void _initializeFields() {
    _excuseUser = snapshotData['excuse_user'] as DocumentReference?;
    _excusePhotoUrl = snapshotData['excuse_photo_url'] as String?;
    _excuseDateMissed = snapshotData['excuse_date_missed'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('excuses');

  static Stream<ExcusesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExcusesRecord.fromSnapshot(s));

  static Future<ExcusesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExcusesRecord.fromSnapshot(s));

  static ExcusesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExcusesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExcusesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExcusesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExcusesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExcusesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExcusesRecordData({
  DocumentReference? excuseUser,
  String? excusePhotoUrl,
  DateTime? excuseDateMissed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'excuse_user': excuseUser,
      'excuse_photo_url': excusePhotoUrl,
      'excuse_date_missed': excuseDateMissed,
    }.withoutNulls,
  );

  return firestoreData;
}
