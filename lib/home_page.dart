import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var matriz = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 0],
  ];

  void tryMoveLeft(int linha, int coluna) {
    if (coluna != 0) {
      if (matriz[linha][coluna - 1] == 0) {
        matriz[linha][coluna - 1] = matriz[linha][coluna];
        matriz[linha][coluna] = 0;
        return;
      }
    }
  }

  void tryMoveRight(int linha, int coluna) {
    if (coluna < 2) {
      if (matriz[linha][coluna + 1] == 0) {
        matriz[linha][coluna + 1] = matriz[linha][coluna];
        matriz[linha][coluna] = 0;
        return;
      }
    }
  }

  void tryMoveDown(int linha, int coluna) {
    if (linha < 2) {
      if (matriz[linha + 1][coluna] == 0) {
        matriz[linha + 1][coluna] = matriz[linha][coluna];
        matriz[linha][coluna] = 0;
        return;
      }
    }
  }

  void tryMoveUp(int linha, int coluna) {
    if (linha > 0) {
      if (matriz[linha - 1][coluna] == 0) {
        matriz[linha - 1][coluna] = matriz[linha][coluna];
        matriz[linha][coluna] = 0;
        return;
      }
    }
  }

  void tryMove(int x, int y) {
    if (matriz[x][y] == 0) {
      return;
    }

    tryMoveLeft(x, y);
    tryMoveRight(x, y);
    tryMoveDown(x, y);
    tryMoveUp(x, y);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.green,
        width: 400,
        height: 400,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                ItemGame(name: matriz[0][0].toString(), onTap: () => tryMove(0, 0)),
                ItemGame(name: matriz[0][1].toString(), onTap: () => tryMove(0, 1)),
                ItemGame(name: matriz[0][2].toString(), onTap: () => tryMove(0, 2)),
              ],
            ),
            Row(
              children: [
                ItemGame(name: matriz[1][0].toString(), onTap: () => tryMove(1, 0)),
                ItemGame(name: matriz[1][1].toString(), onTap: () => tryMove(1, 1)),
                ItemGame(name: matriz[1][2].toString(), onTap: () => tryMove(1, 2)),
              ],
            ),
            Row(
              children: [
                ItemGame(name: matriz[2][0].toString(), onTap: () => tryMove(2, 0)),
                ItemGame(name: matriz[2][1].toString(), onTap: () => tryMove(2, 1)),
                ItemGame(name: matriz[2][2].toString(), onTap: () => tryMove(2, 2)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemGame extends StatelessWidget {
  final String name;
  final VoidCallback onTap;
  const ItemGame({Key? key, required this.name, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (name == '0') {
      return Container(
        width: 100,
        height: 100,
        margin: const EdgeInsets.all(3),
      );
    }
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        child: TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween(begin: 0, end: 100),
            builder: (context, value, child) {
              return Container(
                width: value,
                height: value,
                decoration: const BoxDecoration(color: Colors.white),
                child: Center(child: Text(name)),
              );
            }),
      ),
    );
  }
}
