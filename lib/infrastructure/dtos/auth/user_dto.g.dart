// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserDtoCollectionReference
    implements
        UserDtoQuery,
        FirestoreCollectionReference<UserDto, UserDtoQuerySnapshot> {
  factory UserDtoCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserDtoCollectionReference;

  static UserDto fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return UserDto.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserDto value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<UserDto> get reference;

  @override
  UserDtoDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDtoDocumentReference> add(UserDto value);
}

class _$UserDtoCollectionReference extends _$UserDtoQuery
    implements UserDtoCollectionReference {
  factory _$UserDtoCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserDtoCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserDtoCollectionReference.fromFirestore,
            toFirestore: UserDtoCollectionReference.toFirestore,
          ),
    );
  }

  _$UserDtoCollectionReference._(
    CollectionReference<UserDto> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserDto> get reference =>
      super.reference as CollectionReference<UserDto>;

  @override
  UserDtoDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDtoDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDtoDocumentReference> add(UserDto value) {
    return reference.add(value).then((ref) => UserDtoDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDtoCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDtoDocumentReference
    extends FirestoreDocumentReference<UserDto, UserDtoDocumentSnapshot> {
  factory UserDtoDocumentReference(DocumentReference<UserDto> reference) =
      _$UserDtoDocumentReference;

  DocumentReference<UserDto> get reference;

  /// A reference to the [UserDtoCollectionReference] containing this document.
  UserDtoCollectionReference get parent {
    return _$UserDtoCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDtoDocumentSnapshot> snapshots();

  @override
  Future<UserDtoDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String uid,
    FieldValue uidFieldValue,
    String? name,
    FieldValue nameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? avatar,
    FieldValue avatarFieldValue,
    bool? emailVerified,
    FieldValue emailVerifiedFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String uid,
    FieldValue uidFieldValue,
    String? name,
    FieldValue nameFieldValue,
    String? email,
    FieldValue emailFieldValue,
    String? avatar,
    FieldValue avatarFieldValue,
    bool? emailVerified,
    FieldValue emailVerifiedFieldValue,
  });
}

class _$UserDtoDocumentReference
    extends FirestoreDocumentReference<UserDto, UserDtoDocumentSnapshot>
    implements UserDtoDocumentReference {
  _$UserDtoDocumentReference(this.reference);

  @override
  final DocumentReference<UserDto> reference;

  /// A reference to the [UserDtoCollectionReference] containing this document.
  UserDtoCollectionReference get parent {
    return _$UserDtoCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDtoDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDtoDocumentSnapshot._);
  }

  @override
  Future<UserDtoDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDtoDocumentSnapshot._);
  }

  @override
  Future<UserDtoDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDtoDocumentSnapshot._);
  }

  Future<void> update({
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? avatar = _sentinel,
    FieldValue? avatarFieldValue,
    Object? emailVerified = _sentinel,
    FieldValue? emailVerifiedFieldValue,
  }) async {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      avatar == _sentinel || avatarFieldValue == null,
      "Cannot specify both avatar and avatarFieldValue",
    );
    assert(
      emailVerified == _sentinel || emailVerifiedFieldValue == null,
      "Cannot specify both emailVerified and emailVerifiedFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_UserDtoFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$$_UserDtoFieldMap['uid']!: uidFieldValue,
      if (name != _sentinel) _$$_UserDtoFieldMap['name']!: name as String?,
      if (nameFieldValue != null) _$$_UserDtoFieldMap['name']!: nameFieldValue,
      if (email != _sentinel) _$$_UserDtoFieldMap['email']!: email as String?,
      if (emailFieldValue != null)
        _$$_UserDtoFieldMap['email']!: emailFieldValue,
      if (avatar != _sentinel)
        _$$_UserDtoFieldMap['avatar']!: avatar as String?,
      if (avatarFieldValue != null)
        _$$_UserDtoFieldMap['avatar']!: avatarFieldValue,
      if (emailVerified != _sentinel)
        _$$_UserDtoFieldMap['emailVerified']!: emailVerified as bool?,
      if (emailVerifiedFieldValue != null)
        _$$_UserDtoFieldMap['emailVerified']!: emailVerifiedFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? uid = _sentinel,
    FieldValue? uidFieldValue,
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? email = _sentinel,
    FieldValue? emailFieldValue,
    Object? avatar = _sentinel,
    FieldValue? avatarFieldValue,
    Object? emailVerified = _sentinel,
    FieldValue? emailVerifiedFieldValue,
  }) {
    assert(
      uid == _sentinel || uidFieldValue == null,
      "Cannot specify both uid and uidFieldValue",
    );
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      email == _sentinel || emailFieldValue == null,
      "Cannot specify both email and emailFieldValue",
    );
    assert(
      avatar == _sentinel || avatarFieldValue == null,
      "Cannot specify both avatar and avatarFieldValue",
    );
    assert(
      emailVerified == _sentinel || emailVerifiedFieldValue == null,
      "Cannot specify both emailVerified and emailVerifiedFieldValue",
    );
    final json = {
      if (uid != _sentinel) _$$_UserDtoFieldMap['uid']!: uid as String,
      if (uidFieldValue != null) _$$_UserDtoFieldMap['uid']!: uidFieldValue,
      if (name != _sentinel) _$$_UserDtoFieldMap['name']!: name as String?,
      if (nameFieldValue != null) _$$_UserDtoFieldMap['name']!: nameFieldValue,
      if (email != _sentinel) _$$_UserDtoFieldMap['email']!: email as String?,
      if (emailFieldValue != null)
        _$$_UserDtoFieldMap['email']!: emailFieldValue,
      if (avatar != _sentinel)
        _$$_UserDtoFieldMap['avatar']!: avatar as String?,
      if (avatarFieldValue != null)
        _$$_UserDtoFieldMap['avatar']!: avatarFieldValue,
      if (emailVerified != _sentinel)
        _$$_UserDtoFieldMap['emailVerified']!: emailVerified as bool?,
      if (emailVerifiedFieldValue != null)
        _$$_UserDtoFieldMap['emailVerified']!: emailVerifiedFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDtoDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserDtoQuery
    implements QueryReference<UserDto, UserDtoQuerySnapshot> {
  @override
  UserDtoQuery limit(int limit);

  @override
  UserDtoQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserDtoQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserDtoQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserDtoQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDtoQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  UserDtoQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  UserDtoQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  UserDtoQuery whereAvatar({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  UserDtoQuery whereEmailVerified({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });

  UserDtoQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });

  UserDtoQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });

  UserDtoQuery orderByName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });

  UserDtoQuery orderByEmail({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });

  UserDtoQuery orderByAvatar({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });

  UserDtoQuery orderByEmailVerified({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  });
}

class _$UserDtoQuery extends QueryReference<UserDto, UserDtoQuerySnapshot>
    implements UserDtoQuery {
  _$UserDtoQuery(
    this._collection, {
    required Query<UserDto> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserDtoQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserDtoQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserDtoQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDtoQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserDtoQuery limit(int limit) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserDtoQuery limitToLast(int limit) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDtoQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery whereUid({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_UserDtoFieldMap['uid']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_UserDtoFieldMap['name']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_UserDtoFieldMap['email']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery whereAvatar({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_UserDtoFieldMap['avatar']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery whereEmailVerified({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_UserDtoFieldMap['emailVerified']!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      $queryCursor: $queryCursor,
    );
  }

  UserDtoQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDtoQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_UserDtoFieldMap['uid']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDtoQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_UserDtoFieldMap['name']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDtoQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$$_UserDtoFieldMap['email']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDtoQuery orderByAvatar({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_UserDtoFieldMap['avatar']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDtoQuery orderByEmailVerified({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDtoDocumentSnapshot? startAtDocument,
    UserDtoDocumentSnapshot? endAtDocument,
    UserDtoDocumentSnapshot? endBeforeDocument,
    UserDtoDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$$_UserDtoFieldMap['emailVerified']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserDtoQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDtoQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDtoDocumentSnapshot extends FirestoreDocumentSnapshot<UserDto> {
  UserDtoDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserDto> snapshot;

  @override
  UserDtoDocumentReference get reference {
    return UserDtoDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserDto? data;
}

class UserDtoQuerySnapshot
    extends FirestoreQuerySnapshot<UserDto, UserDtoQueryDocumentSnapshot> {
  UserDtoQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserDtoQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserDto> snapshot,
  ) {
    final docs = snapshot.docs.map(UserDtoQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDtoDocumentSnapshot._,
      );
    }).toList();

    return UserDtoQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDtoDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDtoDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDtoDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserDto> snapshot;

  @override
  final List<UserDtoQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDtoDocumentSnapshot>> docChanges;
}

class UserDtoQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserDto>
    implements UserDtoDocumentSnapshot {
  UserDtoQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserDto> snapshot;

  @override
  final UserDto data;

  @override
  UserDtoDocumentReference get reference {
    return UserDtoDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'emailVerified': instance.emailVerified,
    };

_$_UserDto _$$_UserDtoFromJson(Map<String, dynamic> json) => _$_UserDto(
      uid: json['uid'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      emailVerified: json['emailVerified'] as bool?,
    );

Map<String, dynamic> _$$_UserDtoToJson(_$_UserDto instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'emailVerified': instance.emailVerified,
    };
