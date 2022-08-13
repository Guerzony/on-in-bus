import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:on_in_bus/data/firestore_serializable.dart';
import 'package:on_in_bus/utils/color.dart';

part 'bus.g.dart';

@firestoreSerializable
class Bus {
  Bus({
    required this.name,
    required this.price,
    this.seats = 0,
    this.points = const [],
    this.location,
    this.color = '#00b8d4',
  });

  final String name;
  final double price;
  final int seats;
  final List<GeoPoint> points;
  final GeoPoint? location;
  final String color;

  Color get colorValue => HexColor.fromHex(color);

  factory Bus.fromJson(Map<String, Object?> json) => _$BusFromJson(json);
  Map<String, Object?> toJson() => _$BusToJson(this);
}

@Collection<Bus>('buses')
final busesRef = BusCollectionReference();
