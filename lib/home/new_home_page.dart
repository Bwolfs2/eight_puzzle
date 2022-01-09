import 'package:eigth_puzzle/home/game_controller.dart';
import 'package:eigth_puzzle/home/models/item.dart';
import 'package:flutter/material.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({Key? key}) : super(key: key);

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

var gameCotroller = GameController();

class _NewHomePageState extends State<NewHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          ...gameCotroller.gameItems.map(
            (item) => ValueListenableBuilder<Offset>(
                valueListenable: item,
                builder: (context, value, child) {
                  return AnimatedPositioned(
                    duration: duration,
                    left: value.dy * size,
                    top: value.dx * size,
                    child: SlideButton(item: item),
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SlideButton extends StatefulWidget {
  final Item item;
  const SlideButton({Key? key, required this.item}) : super(key: key);

  @override
  State<SlideButton> createState() => _SlideButtonState();
}

class _SlideButtonState extends State<SlideButton> {
  bool isAnimating = false;
  @override
  Widget build(BuildContext context) {
    if (widget.item.name == '$total') {
      return Container(width: size, height: size, margin: const EdgeInsets.all(10));
    }
    return SizedBox.square(
      dimension: size,
      child: GestureDetector(
        onTap: () async {
          if (isAnimating) return;

          isAnimating = true;
          await gameCotroller.tryMove(widget.item);
          isAnimating = false;
        },
        child: Card(
          elevation: 8,
          color: widget.item.value == widget.item.rightOffset ? Colors.green : Colors.white,
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Center(
                child: Text(
              widget.item.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
