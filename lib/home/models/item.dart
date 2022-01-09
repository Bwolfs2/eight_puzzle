import 'package:flutter/material.dart';

class Item extends ValueNotifier<Offset> {
  final String name;
  final Offset rightOffset;
  Item({required double row, required double column, required this.name, required this.rightOffset}) : super(Offset(row, column));

  double get row => value.dx;
  double get column => value.dy;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item && (other.name == name && other.value == value);
  }

  @override
  int get hashCode => name.hashCode;
}

class ItemOffset {
  final String name;
  Offset? offset;

  ItemOffset(this.name, this.offset);
}
