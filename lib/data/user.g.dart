// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

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
abstract class UserDataCollectionReference
    implements
        UserDataQuery,
        FirestoreCollectionReference<UserData, UserDataQuerySnapshot> {
  factory UserDataCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserDataCollectionReference;

  static UserData fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$UserDataFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    UserData value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<UserData> get reference;

  @override
  UserDataDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDataDocumentReference> add(UserData value);
}

class _$UserDataCollectionReference extends _$UserDataQuery
    implements UserDataCollectionReference {
  factory _$UserDataCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserDataCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserDataCollectionReference.fromFirestore,
            toFirestore: UserDataCollectionReference.toFirestore,
          ),
    );
  }

  _$UserDataCollectionReference._(
    CollectionReference<UserData> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<UserData> get reference =>
      super.reference as CollectionReference<UserData>;

  @override
  UserDataDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDataDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDataDocumentReference> add(UserData value) {
    return reference.add(value).then((ref) => UserDataDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDataCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDataDocumentReference
    extends FirestoreDocumentReference<UserData, UserDataDocumentSnapshot> {
  factory UserDataDocumentReference(DocumentReference<UserData> reference) =
      _$UserDataDocumentReference;

  DocumentReference<UserData> get reference;

  /// A reference to the [UserDataCollectionReference] containing this document.
  UserDataCollectionReference get parent {
    return _$UserDataCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDataDocumentSnapshot> snapshots();

  @override
  Future<UserDataDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    bool isAdmin,
    FieldValue isAdminFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    bool isAdmin,
    FieldValue isAdminFieldValue,
  });
}

class _$UserDataDocumentReference
    extends FirestoreDocumentReference<UserData, UserDataDocumentSnapshot>
    implements UserDataDocumentReference {
  _$UserDataDocumentReference(this.reference);

  @override
  final DocumentReference<UserData> reference;

  /// A reference to the [UserDataCollectionReference] containing this document.
  UserDataCollectionReference get parent {
    return _$UserDataCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDataDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDataDocumentSnapshot._);
  }

  @override
  Future<UserDataDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDataDocumentSnapshot._);
  }

  @override
  Future<UserDataDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDataDocumentSnapshot._);
  }

  Future<void> update({
    Object? isAdmin = _sentinel,
    FieldValue? isAdminFieldValue,
  }) async {
    assert(
      isAdmin == _sentinel || isAdminFieldValue == null,
      "Cannot specify both isAdmin and isAdminFieldValue",
    );
    final json = {
      if (isAdmin != _sentinel) _$UserDataFieldMap['isAdmin']!: isAdmin as bool,
      if (isAdminFieldValue != null)
        _$UserDataFieldMap['isAdmin']!: isAdminFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? isAdmin = _sentinel,
    FieldValue? isAdminFieldValue,
  }) {
    assert(
      isAdmin == _sentinel || isAdminFieldValue == null,
      "Cannot specify both isAdmin and isAdminFieldValue",
    );
    final json = {
      if (isAdmin != _sentinel) _$UserDataFieldMap['isAdmin']!: isAdmin as bool,
      if (isAdminFieldValue != null)
        _$UserDataFieldMap['isAdmin']!: isAdminFieldValue,
    };

    transaction.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDataDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserDataQuery
    implements QueryReference<UserData, UserDataQuerySnapshot> {
  @override
  UserDataQuery limit(int limit);

  @override
  UserDataQuery limitToLast(int limit);

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
  UserDataQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
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
  UserDataQuery whereFieldPath(
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

  UserDataQuery whereDocumentId({
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
  UserDataQuery whereIsAdmin({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });

  UserDataQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });

  UserDataQuery orderByIsAdmin({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  });
}

class _$UserDataQuery extends QueryReference<UserData, UserDataQuerySnapshot>
    implements UserDataQuery {
  _$UserDataQuery(
    this._collection, {
    required Query<UserData> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserDataQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserDataQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserDataQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(UserDataQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserDataQuery limit(int limit) {
    return _$UserDataQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserDataQuery limitToLast(int limit) {
    return _$UserDataQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  UserDataQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
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
    return _$UserDataQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDataQuery whereFieldPath(
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
    return _$UserDataQuery(
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

  UserDataQuery whereDocumentId({
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
    return _$UserDataQuery(
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

  UserDataQuery whereIsAdmin({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$UserDataQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$UserDataFieldMap['isAdmin']!,
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

  UserDataQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
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

    return _$UserDataQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  UserDataQuery orderByIsAdmin({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDataDocumentSnapshot? startAtDocument,
    UserDataDocumentSnapshot? endAtDocument,
    UserDataDocumentSnapshot? endBeforeDocument,
    UserDataDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$UserDataFieldMap['isAdmin']!, descending: descending);
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

    return _$UserDataQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserDataQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDataDocumentSnapshot extends FirestoreDocumentSnapshot<UserData> {
  UserDataDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<UserData> snapshot;

  @override
  UserDataDocumentReference get reference {
    return UserDataDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final UserData? data;
}

class UserDataQuerySnapshot
    extends FirestoreQuerySnapshot<UserData, UserDataQueryDocumentSnapshot> {
  UserDataQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserDataQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<UserData> snapshot,
  ) {
    final docs = snapshot.docs.map(UserDataQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDataDocumentSnapshot._,
      );
    }).toList();

    return UserDataQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDataDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDataDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDataDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<UserData> snapshot;

  @override
  final List<UserDataQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDataDocumentSnapshot>> docChanges;
}

class UserDataQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserData>
    implements UserDataDocumentSnapshot {
  UserDataQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<UserData> snapshot;

  @override
  final UserData data;

  @override
  UserDataDocumentReference get reference {
    return UserDataDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      isAdmin: json['isAdmin'] as bool? ?? false,
    );

const _$UserDataFieldMap = <String, String>{
  'isAdmin': 'isAdmin',
};

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'isAdmin': instance.isAdmin,
    };
