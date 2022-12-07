import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'excuses_record.g.dart';

abstract class ExcusesRecord
    implements Built<ExcusesRecord, ExcusesRecordBuilder> {
  static Serializer<ExcusesRecord> get serializer => _$excusesRecordSerializer;

  @BuiltValueField(wireName: 'excuse_user')
  DocumentReference? get excuseUser;

  @BuiltValueField(wireName: 'excuse_photo_url')
  String? get excusePhotoUrl;

  @BuiltValueField(wireName: 'excuse_date_missed')
  DateTime? get excuseDateMissed;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ExcusesRecordBuilder builder) =>
      builder..excusePhotoUrl = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('excuses');

  static Stream<ExcusesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ExcusesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ExcusesRecord._();
  factory ExcusesRecord([void Function(ExcusesRecordBuilder) updates]) =
      _$ExcusesRecord;

  static ExcusesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createExcusesRecordData({
  DocumentReference? excuseUser,
  String? excusePhotoUrl,
  DateTime? excuseDateMissed,
}) {
  final firestoreData = serializers.toFirestore(
    ExcusesRecord.serializer,
    ExcusesRecord(
      (e) => e
        ..excuseUser = excuseUser
        ..excusePhotoUrl = excusePhotoUrl
        ..excuseDateMissed = excuseDateMissed,
    ),
  );

  return firestoreData;
}
