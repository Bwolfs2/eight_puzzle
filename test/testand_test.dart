import 'package:flutter_test/flutter_test.dart';

void main() {
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
  }

  test('Moving X Y', () {
    print(matriz);
    tryMove(2, 1);
    print(matriz);
    tryMove(1, 1);
    print(matriz);
    tryMove(2, 1);
    print(matriz);
    tryMove(2, 0);
    print(matriz);
  });
}
