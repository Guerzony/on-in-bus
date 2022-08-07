// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

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
abstract class BusCollectionReference
    implements BusQuery, FirestoreCollectionReference<Bus, BusQuerySnapshot> {
  factory BusCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$BusCollectionReference;

  static Bus fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Bus.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Bus value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Bus> get reference;

  @override
  BusDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<BusDocumentReference> add(Bus value);
}

class _$BusCollectionReference extends _$BusQuery
    implements BusCollectionReference {
  factory _$BusCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$BusCollectionReference._(
      firestore.collection('buses').withConverter(
            fromFirestore: BusCollectionReference.fromFirestore,
            toFirestore: BusCollectionReference.toFirestore,
          ),
    );
  }

  _$BusCollectionReference._(
    CollectionReference<Bus> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Bus> get reference =>
      super.reference as CollectionReference<Bus>;

  @override
  BusDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return BusDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<BusDocumentReference> add(Bus value) {
    return reference.add(value).then((ref) => BusDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$BusCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class BusDocumentReference
    extends FirestoreDocumentReference<Bus, BusDocumentSnapshot> {
  factory BusDocumentReference(DocumentReference<Bus> reference) =
      _$BusDocumentReference;

  DocumentReference<Bus> get reference;

  /// A reference to the [BusCollectionReference] containing this document.
  BusCollectionReference get parent {
    return _$BusCollectionReference(reference.firestore);
  }

  @override
  Stream<BusDocumentSnapshot> snapshots();

  @override
  Future<BusDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    double price,
  });

  Future<void> set(Bus value);
}

class _$BusDocumentReference
    extends FirestoreDocumentReference<Bus, BusDocumentSnapshot>
    implements BusDocumentReference {
  _$BusDocumentReference(this.reference);

  @override
  final DocumentReference<Bus> reference;

  /// A reference to the [BusCollectionReference] containing this document.
  BusCollectionReference get parent {
    return _$BusCollectionReference(reference.firestore);
  }

  @override
  Stream<BusDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return BusDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<BusDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return BusDocumentSnapshot._(
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
    Object? name = _sentinel,
    Object? price = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (price != _sentinel) "price": price as double,
    };

    return reference.update(json);
  }

  Future<void> set(Bus value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is BusDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class BusDocumentSnapshot extends FirestoreDocumentSnapshot<Bus> {
  BusDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Bus> snapshot;

  @override
  BusDocumentReference get reference {
    return BusDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Bus? data;
}

abstract class BusQuery implements QueryReference<Bus, BusQuerySnapshot> {
  @override
  BusQuery limit(int limit);

  @override
  BusQuery limitToLast(int limit);

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
  BusQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
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
  BusQuery whereFieldPath(
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

  BusQuery whereDocumentId({
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
  BusQuery whereName({
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
  BusQuery wherePrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });

  BusQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  });

  BusQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  });

  BusQuery orderByPrice({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  });
}

class _$BusQuery extends QueryReference<Bus, BusQuerySnapshot>
    implements BusQuery {
  _$BusQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Bus> reference;

  BusQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Bus> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return BusQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<BusDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: BusDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return BusQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<BusQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<BusQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  BusQuery limit(int limit) {
    return _$BusQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  BusQuery limitToLast(int limit) {
    return _$BusQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  BusQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
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

    return _$BusQuery(query, _collection);
  }

  BusQuery whereFieldPath(
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
    return _$BusQuery(
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

  BusQuery whereDocumentId({
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
    return _$BusQuery(
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

  BusQuery whereName({
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
    return _$BusQuery(
      reference.where(
        _$BusFieldMap["name"]!,
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

  BusQuery wherePrice({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$BusQuery(
      reference.where(
        _$BusFieldMap["price"]!,
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

  BusQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
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

    return _$BusQuery(query, _collection);
  }

  BusQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$BusFieldMap["name"]!, descending: descending);

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

    return _$BusQuery(query, _collection);
  }

  BusQuery orderByPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$BusFieldMap["price"]!, descending: descending);

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

    return _$BusQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$BusQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class BusQuerySnapshot
    extends FirestoreQuerySnapshot<Bus, BusQueryDocumentSnapshot> {
  BusQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Bus> snapshot;

  @override
  final List<BusQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<BusDocumentSnapshot>> docChanges;
}

class BusQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Bus>
    implements BusDocumentSnapshot {
  BusQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Bus> snapshot;

  @override
  BusDocumentReference get reference {
    return BusDocumentReference(snapshot.reference);
  }

  @override
  final Bus data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bus _$BusFromJson(Map<String, dynamic> json) => Bus(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      points: (json['points'] as List<dynamic>)
          .map(
              (e) => const FirestoreGeoPointConverter().fromJson(e as GeoPoint))
          .toList(),
    );

const _$BusFieldMap = <String, String>{
  'name': 'name',
  'price': 'price',
  'points': 'points',
};

Map<String, dynamic> _$BusToJson(Bus instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'points': instance.points
          .map(const FirestoreGeoPointConverter().toJson)
          .toList(),
    };
