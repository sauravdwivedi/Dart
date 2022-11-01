/**
 * Write a method to read two integer matrices from StdIn and print
 * their product matrix.
 */

import "dart:io";

class Matrix {
  String name = '';
  int rows = 0;
  int cols = 0;
  List<List<int>> matrix = [
    [0]
  ];

  //Constructor to set name of matrix
  Matrix(String name) {
    this.name = name;
  }

  void setMatrix() {
    print('Matrix ${this.name} rows: ');
    int rows = 0;
    String? inputNum = stdin.readLineSync();
    if (inputNum != null) {
      rows = int.parse(inputNum);
    }
    print('Matrix ${this.name} cols: ');
    int cols = 0;
    inputNum = stdin.readLineSync();
    if (inputNum != null) {
      cols = int.parse(inputNum);
    }
    print('Space separated Matrix ${this.name} entries (e.g. \'1 2 3\'): ');
    List<int> matRaw = [];
    String? inputLine = stdin.readLineSync();
    if (inputLine != null) {
      matRaw = inputLine.split(' ').map(int.parse).toList();
    }
    List<List<int>> mat =
        List.generate(rows, (i) => List.generate(cols, (i) => 0));
    for (var i = 0; i < rows; i++) {
      List<int> rowTemp = List.generate(cols, (i) => 0);
      for (var j = 0; j < cols; j++) {
        rowTemp[j] = matRaw[(i * cols + j).toInt()];
      }
      mat[i] = rowTemp;
    }
    this.rows = rows;
    this.cols = cols;
    this.matrix = mat;
  }
}

List<List<int>> matMult(Matrix matA, Matrix matB) {
  List<List<int>> prodMat =
      List.generate(matA.rows, (i) => List.generate(matB.cols, (i) => 0));
  for (var i = 0; i < matA.rows; i++) {
    List<int> rowTemp = List.generate(matB.cols, (i) => 0);
    for (var j = 0; j < matB.cols; j++) {
      var prodMatIJ = 0;
      for (var k = 0; k < matA.cols; k++) {
        prodMatIJ += matA.matrix[i][k] * matB.matrix[k][j];
      }
      rowTemp[j] = prodMatIJ;
    }
    prodMat[i] = rowTemp;
  }
  return prodMat;
}

void main() {
  Matrix matA = new Matrix('A');
  matA.setMatrix();
  print('Matrix ${matA.name}: ');
  print(matA.matrix);
  Matrix matB = new Matrix('B');
  matB.setMatrix();
  print('Matrix ${matB.name}: ');
  print(matB.matrix);
  if (matA.cols == matB.rows) {
    print('The product Matrix is: ');
    var prodMat = matMult(matA, matB);
    print(prodMat);
  } else {
    print('Matrices can\'t be multiplied!');
  }
}
