// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bus.dart';

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
  ) : super(reference, $referenceWithoutCursor: reference);

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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String name,
    FieldValue nameFieldValue,
    double price,
    FieldValue priceFieldValue,
    int seats,
    FieldValue seatsFieldValue,
    GeoPoint? location,
    FieldValue locationFieldValue,
    String color,
    FieldValue colorFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String name,
    FieldValue nameFieldValue,
    double price,
    FieldValue priceFieldValue,
    int seats,
    FieldValue seatsFieldValue,
    GeoPoint? location,
    FieldValue locationFieldValue,
    String color,
    FieldValue colorFieldValue,
  });
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
    return reference.snapshots().map(BusDocumentSnapshot._);
  }

  @override
  Future<BusDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(BusDocumentSnapshot._);
  }

  @override
  Future<BusDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(BusDocumentSnapshot._);
  }

  Future<void> update({
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? price = _sentinel,
    FieldValue? priceFieldValue,
    Object? seats = _sentinel,
    FieldValue? seatsFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? color = _sentinel,
    FieldValue? colorFieldValue,
  }) async {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      price == _sentinel || priceFieldValue == null,
      "Cannot specify both price and priceFieldValue",
    );
    assert(
      seats == _sentinel || seatsFieldValue == null,
      "Cannot specify both seats and seatsFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      color == _sentinel || colorFieldValue == null,
      "Cannot specify both color and colorFieldValue",
    );
    final json = {
      if (name != _sentinel) _$BusFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$BusFieldMap['name']!: nameFieldValue,
      if (price != _sentinel) _$BusFieldMap['price']!: price as double,
      if (priceFieldValue != null) _$BusFieldMap['price']!: priceFieldValue,
      if (seats != _sentinel) _$BusFieldMap['seats']!: seats as int,
      if (seatsFieldValue != null) _$BusFieldMap['seats']!: seatsFieldValue,
      if (location != _sentinel)
        _$BusFieldMap['location']!: location as GeoPoint?,
      if (locationFieldValue != null)
        _$BusFieldMap['location']!: locationFieldValue,
      if (color != _sentinel) _$BusFieldMap['color']!: color as String,
      if (colorFieldValue != null) _$BusFieldMap['color']!: colorFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? name = _sentinel,
    FieldValue? nameFieldValue,
    Object? price = _sentinel,
    FieldValue? priceFieldValue,
    Object? seats = _sentinel,
    FieldValue? seatsFieldValue,
    Object? location = _sentinel,
    FieldValue? locationFieldValue,
    Object? color = _sentinel,
    FieldValue? colorFieldValue,
  }) {
    assert(
      name == _sentinel || nameFieldValue == null,
      "Cannot specify both name and nameFieldValue",
    );
    assert(
      price == _sentinel || priceFieldValue == null,
      "Cannot specify both price and priceFieldValue",
    );
    assert(
      seats == _sentinel || seatsFieldValue == null,
      "Cannot specify both seats and seatsFieldValue",
    );
    assert(
      location == _sentinel || locationFieldValue == null,
      "Cannot specify both location and locationFieldValue",
    );
    assert(
      color == _sentinel || colorFieldValue == null,
      "Cannot specify both color and colorFieldValue",
    );
    final json = {
      if (name != _sentinel) _$BusFieldMap['name']!: name as String,
      if (nameFieldValue != null) _$BusFieldMap['name']!: nameFieldValue,
      if (price != _sentinel) _$BusFieldMap['price']!: price as double,
      if (priceFieldValue != null) _$BusFieldMap['price']!: priceFieldValue,
      if (seats != _sentinel) _$BusFieldMap['seats']!: seats as int,
      if (seatsFieldValue != null) _$BusFieldMap['seats']!: seatsFieldValue,
      if (location != _sentinel)
        _$BusFieldMap['location']!: location as GeoPoint?,
      if (locationFieldValue != null)
        _$BusFieldMap['location']!: locationFieldValue,
      if (color != _sentinel) _$BusFieldMap['color']!: color as String,
      if (colorFieldValue != null) _$BusFieldMap['color']!: colorFieldValue,
    };

    transaction.update(reference, json);
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
  BusQuery whereSeats({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  BusQuery whereLocation({
    GeoPoint? isEqualTo,
    GeoPoint? isNotEqualTo,
    GeoPoint? isLessThan,
    GeoPoint? isLessThanOrEqualTo,
    GeoPoint? isGreaterThan,
    GeoPoint? isGreaterThanOrEqualTo,
    bool? isNull,
    List<GeoPoint?>? whereIn,
    List<GeoPoint?>? whereNotIn,
  });
  BusQuery whereColor({
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

  BusQuery orderBySeats({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  });

  BusQuery orderByLocation({
    bool descending = false,
    GeoPoint? startAt,
    GeoPoint? startAfter,
    GeoPoint? endAt,
    GeoPoint? endBefore,
    BusDocumentSnapshot? startAtDocument,
    BusDocumentSnapshot? endAtDocument,
    BusDocumentSnapshot? endBeforeDocument,
    BusDocumentSnapshot? startAfterDocument,
  });

  BusQuery orderByColor({
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
}

class _$BusQuery extends QueryReference<Bus, BusQuerySnapshot>
    implements BusQuery {
  _$BusQuery(
    this._collection, {
    required Query<Bus> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<BusQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(BusQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<BusQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(BusQuerySnapshot._fromQuerySnapshot);
  }

  @override
  BusQuery limit(int limit) {
    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  BusQuery limitToLast(int limit) {
    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
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
    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BusFieldMap['name']!,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BusFieldMap['price']!,
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

  BusQuery whereSeats({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BusFieldMap['seats']!,
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

  BusQuery whereLocation({
    GeoPoint? isEqualTo,
    GeoPoint? isNotEqualTo,
    GeoPoint? isLessThan,
    GeoPoint? isLessThanOrEqualTo,
    GeoPoint? isGreaterThan,
    GeoPoint? isGreaterThanOrEqualTo,
    bool? isNull,
    List<GeoPoint?>? whereIn,
    List<GeoPoint?>? whereNotIn,
  }) {
    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BusFieldMap['location']!,
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

  BusQuery whereColor({
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$BusFieldMap['color']!,
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

    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$BusFieldMap['name']!,
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

    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$BusFieldMap['price']!,
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

    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BusQuery orderBySeats({
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
    final query = $referenceWithoutCursor.orderBy(_$BusFieldMap['seats']!,
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

    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BusQuery orderByLocation({
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
    final query = $referenceWithoutCursor.orderBy(_$BusFieldMap['location']!,
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

    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  BusQuery orderByColor({
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
    final query = $referenceWithoutCursor.orderBy(_$BusFieldMap['color']!,
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

    return _$BusQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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

class BusDocumentSnapshot extends FirestoreDocumentSnapshot<Bus> {
  BusDocumentSnapshot._(this.snapshot) : data = snapshot.data();

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

class BusQuerySnapshot
    extends FirestoreQuerySnapshot<Bus, BusQueryDocumentSnapshot> {
  BusQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory BusQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Bus> snapshot,
  ) {
    final docs = snapshot.docs.map(BusQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        BusDocumentSnapshot._,
      );
    }).toList();

    return BusQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<BusDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    BusDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<BusDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Bus> snapshot;

  @override
  final List<BusQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<BusDocumentSnapshot>> docChanges;
}

class BusQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<Bus>
    implements BusDocumentSnapshot {
  BusQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Bus> snapshot;

  @override
  final Bus data;

  @override
  BusDocumentReference get reference {
    return BusDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bus _$BusFromJson(Map<String, dynamic> json) => Bus(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      seats: json['seats'] as int? ?? 0,
      points: (json['points'] as List<dynamic>?)
              ?.map((e) =>
                  const FirestoreGeoPointConverter().fromJson(e as GeoPoint))
              .toList() ??
          const [],
      location: _$JsonConverterFromJson<GeoPoint, GeoPoint>(
          json['location'], const FirestoreGeoPointConverter().fromJson),
      color: json['color'] as String? ?? '#00b8d4',
    );

const _$BusFieldMap = <String, String>{
  'name': 'name',
  'price': 'price',
  'seats': 'seats',
  'points': 'points',
  'location': 'location',
  'color': 'color',
};

Map<String, dynamic> _$BusToJson(Bus instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'seats': instance.seats,
      'points': instance.points
          .map(const FirestoreGeoPointConverter().toJson)
          .toList(),
      'location': _$JsonConverterToJson<GeoPoint, GeoPoint>(
          instance.location, const FirestoreGeoPointConverter().toJson),
      'color': instance.color,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
