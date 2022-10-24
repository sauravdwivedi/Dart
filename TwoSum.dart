/**
 * Write a method that checks if there is at least one pair of numbers 
 * whith their sum equals the target. Given arr=[1, 3, 4] and target=5, 
 * result is 'true' because the pair (1,4) sums to 5.
 */

import 'dart:io';

String twoSum(List<int> listOfNumbs, int targetNum) {
  bool result = false;
  listOfNumbs.forEach((p) {
    listOfNumbs.forEach((q) {
      if (p != q && p + q == targetNum) {
        result = true;
      }
    });
  });
  if (result == true) {
    return 'At least one pair has sum equal to target!';
  } else {
    return 'No pair has sum equal to target!';
  }
}

void main() {
  print('Enter list of integers (space separated e.g. \'1 2 3\'): ');
  String? inputLine = stdin.readLineSync();
  var listOfNumbs;
  if (inputLine != null) {
    listOfNumbs = inputLine.split(' ').map(int.parse).toList();
  }
  print('Enter target integer: ');
  String? inputNum = stdin.readLineSync();
  var targetNum;
  if (inputNum != null) {
    targetNum = int.parse(inputNum);
  }
  String result = twoSum(listOfNumbs, targetNum);
  print(result);
}
