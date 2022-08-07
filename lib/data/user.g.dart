// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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
  ) : super(reference, reference);

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

  Future<void> update({
    bool isAdmin,
  });

  Future<void> set(UserData value);
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
    return reference.snapshots().map((snapshot) {
      return UserDataDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<UserDataDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return UserDataDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? isAdmin = _sentinel,
  }) async {
    final json = {
      if (isAdmin != _sentinel) "isAdmin": isAdmin as bool,
    };

    return reference.update(json);
  }

  Future<void> set(UserData value) {
    return reference.set(value);
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

class UserDataDocumentSnapshot extends FirestoreDocumentSnapshot<UserData> {
  UserDataDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

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
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<UserData> reference;

  UserDataQuerySnapshot _decodeSnapshot(
    QuerySnapshot<UserData> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return UserDataQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<UserDataDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: UserDataDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return UserDataQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<UserDataQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<UserDataQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  UserDataQuery limit(int limit) {
    return _$UserDataQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  UserDataQuery limitToLast(int limit) {
    return _$UserDataQuery(
      reference.limitToLast(limit),
      _collection,
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
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
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
      reference.where(
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
      _collection,
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
      reference.where(
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
      _collection,
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
      reference.where(
        _$UserDataFieldMap["isAdmin"]!,
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
      _collection,
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
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
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
    var query = reference.orderBy(_$UserDataFieldMap["isAdmin"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$UserDataQuery(query, _collection);
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

class UserDataQuerySnapshot
    extends FirestoreQuerySnapshot<UserData, UserDataQueryDocumentSnapshot> {
  UserDataQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<UserData> snapshot;

  @override
  final List<UserDataQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDataDocumentSnapshot>> docChanges;
}

class UserDataQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<UserData>
    implements UserDataDocumentSnapshot {
  UserDataQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<UserData> snapshot;

  @override
  UserDataDocumentReference get reference {
    return UserDataDocumentReference(snapshot.reference);
  }

  @override
  final UserData data;
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
