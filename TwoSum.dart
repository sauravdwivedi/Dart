/**
 * Write a method that checks if there is at least one pair of numbers 
 * whith their sum equals the target. Given arr=[1, 3, 4] and target=5, 
 * result is 'true' because the pair (1,4) sums to 5.
 */

import 'dart:io';

String twoSum(List<int> listOfNumbs, int targetNum) {
  /**
   * Function to check if any pair in array contains sum equal to target.
   * 
   * Args:
   *  listOfNumbs (List<int>): List of integers
   *  targetNum (int): Target integer
   * 
   * Raises:
   *  None
   * 
   * Returns:
   *  String: Wheather array contains a pair with sum equals target, or not.
   */

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
  try {
    print('Enter list of integers (space separated e.g. \'1 2 3\'): ');
    List<int> listOfNumbs = [0];
    int targetNum = 0;
    String? inputLine = stdin.readLineSync();
    if (inputLine != null) {
      listOfNumbs = inputLine.trim().split(' ').map(int.parse).toList();
    }
    print('Enter target integer: ');
    String? inputNum = stdin.readLineSync();
    if (inputNum != null) {
      targetNum = int.parse(inputNum.trim());
    }
    String result = twoSum(listOfNumbs, targetNum);
    print(result);
  } on FormatException catch (e) {
    stderr.writeln('Can only accept integers as input. Please try again! $e');
    main();
  } catch (e) {
    stderr.writeln('An error occurred. Please try again! $e');
    main();
  }
}
