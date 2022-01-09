import 'package:eigth_puzzle/home/models/item.dart';
import 'package:flutter/cupertino.dart';

const double size = 100;
const Duration duration = Duration(milliseconds: 200);
const levelGame = 4;
const total = levelGame * levelGame;

class GameController {
  late final gameItems = <Item>[];

  GameController() {
    initGame();
  }

  void initGame() {
    var listItems = List.generate(total, (index) => ItemOffset('${index + 1}', null));

    int listItemIndex = 0;

    for (var i = 0.0; i < levelGame; i++) {
      for (var j = 0.0; j < levelGame; j++) {
        listItems[listItemIndex].offset = Offset(i, j);
        ++listItemIndex;
      }
    }

    listItems.shuffle();

    listItemIndex = 0;

    for (var i = 0.0; i < levelGame; i++) {
      for (var j = 0.0; j < levelGame; j++) {
        gameItems.add(Item(name: listItems[listItemIndex].name, row: i, column: j, rightOffset: listItems[listItemIndex].offset!));
        ++listItemIndex;
      }
    }
  }

  Future<void> tryMove(Item item) async {
    var zeroItem = gameItems.firstWhere((element) => element.name == '$total');

    await _trySwap(item, zeroItem);
  }

  Future<void> _trySwap(Item item, Item itemZero) async {
    var distanceX = (item.value.dx - itemZero.value.dx).abs();
    if (distanceX > 1) {
      await shake(item);
      return;
    }
    var distanceY = (item.value.dy - itemZero.value.dy).abs();
    if (distanceY > 1) {
      await shake(item);
      return;
    }
    var distance = (distanceX - distanceY).abs();
    if (distance == 1.0) {
      var zeroOffset = Offset(itemZero.value.dx, itemZero.value.dy);
      itemZero.value = item.value;
      item.value = zeroOffset;

      return;
    }
    await shake(item);
  }

  Future<void> shake(Item item) async {
    const durationShake = Duration(milliseconds: 100);
    var offset = Offset(item.value.dx, item.value.dy);
    item.value = Offset(offset.dx, offset.dy + .1);
    await Future.delayed(durationShake);
    item.value = Offset(offset.dx, offset.dy - .1);
    await Future.delayed(durationShake);
    item.value = Offset(offset.dx, offset.dy);
  }
}
