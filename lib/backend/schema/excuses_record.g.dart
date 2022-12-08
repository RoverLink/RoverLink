// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excuses_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ExcusesRecord> _$excusesRecordSerializer =
    new _$ExcusesRecordSerializer();

class _$ExcusesRecordSerializer implements StructuredSerializer<ExcusesRecord> {
  @override
  final Iterable<Type> types = const [ExcusesRecord, _$ExcusesRecord];
  @override
  final String wireName = 'ExcusesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ExcusesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.excuseUser;
    if (value != null) {
      result
        ..add('excuse_user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.excusePhotoUrl;
    if (value != null) {
      result
        ..add('excuse_photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.excuseDateMissed;
    if (value != null) {
      result
        ..add('excuse_date_missed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  ExcusesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ExcusesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'excuse_user':
          result.excuseUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'excuse_photo_url':
          result.excusePhotoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'excuse_date_missed':
          result.excuseDateMissed = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$ExcusesRecord extends ExcusesRecord {
  @override
  final DocumentReference<Object?>? excuseUser;
  @override
  final String? excusePhotoUrl;
  @override
  final DateTime? excuseDateMissed;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ExcusesRecord([void Function(ExcusesRecordBuilder)? updates]) =>
      (new ExcusesRecordBuilder()..update(updates))._build();

  _$ExcusesRecord._(
      {this.excuseUser, this.excusePhotoUrl, this.excuseDateMissed, this.ffRef})
      : super._();

  @override
  ExcusesRecord rebuild(void Function(ExcusesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ExcusesRecordBuilder toBuilder() => new ExcusesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExcusesRecord &&
        excuseUser == other.excuseUser &&
        excusePhotoUrl == other.excusePhotoUrl &&
        excuseDateMissed == other.excuseDateMissed &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, excuseUser.hashCode), excusePhotoUrl.hashCode),
            excuseDateMissed.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ExcusesRecord')
          ..add('excuseUser', excuseUser)
          ..add('excusePhotoUrl', excusePhotoUrl)
          ..add('excuseDateMissed', excuseDateMissed)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ExcusesRecordBuilder
    implements Builder<ExcusesRecord, ExcusesRecordBuilder> {
  _$ExcusesRecord? _$v;

  DocumentReference<Object?>? _excuseUser;
  DocumentReference<Object?>? get excuseUser => _$this._excuseUser;
  set excuseUser(DocumentReference<Object?>? excuseUser) =>
      _$this._excuseUser = excuseUser;

  String? _excusePhotoUrl;
  String? get excusePhotoUrl => _$this._excusePhotoUrl;
  set excusePhotoUrl(String? excusePhotoUrl) =>
      _$this._excusePhotoUrl = excusePhotoUrl;

  DateTime? _excuseDateMissed;
  DateTime? get excuseDateMissed => _$this._excuseDateMissed;
  set excuseDateMissed(DateTime? excuseDateMissed) =>
      _$this._excuseDateMissed = excuseDateMissed;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ExcusesRecordBuilder() {
    ExcusesRecord._initializeBuilder(this);
  }

  ExcusesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _excuseUser = $v.excuseUser;
      _excusePhotoUrl = $v.excusePhotoUrl;
      _excuseDateMissed = $v.excuseDateMissed;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ExcusesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ExcusesRecord;
  }

  @override
  void update(void Function(ExcusesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ExcusesRecord build() => _build();

  _$ExcusesRecord _build() {
    final _$result = _$v ??
        new _$ExcusesRecord._(
            excuseUser: excuseUser,
            excusePhotoUrl: excusePhotoUrl,
            excuseDateMissed: excuseDateMissed,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
