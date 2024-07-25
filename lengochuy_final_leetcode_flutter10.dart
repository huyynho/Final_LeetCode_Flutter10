import 'dart:math';

void main() {
  List<List<int>> input = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
  ];

  exercise1(input);

  exercise2([1, 2, 3, 4, 5]);

  exercise3([1, 3, 3, 4, 1]);

  exercise4(23, 5);

  exercise5([3, 5, 4, 2, 1], 5);
}

bool isPrime(int number) {
  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

int exercise1(List<List<int>> input) {
  int result = -1;
  int row = input.length;

  for (int i = 0; i < row; i++) {
    int column = input[i].length;

    if (row != column) {
      return result;
    }

    for (int j = 0; j < column; j++) {
      int midPoint = input[row ~/ 2][column ~/ 2];

      if (isPrime(midPoint)) {
        result = midPoint;
      } else {
        if (i == j && input[i][j] % 2 == 0) {
          result += input[i][j];
        }
      }
    }
  }
  ;

  return result;
}

int exercise2(List<int> input) {
  int odd = 0;
  int even = 0;
  int count = 0;

  input.forEach((number) {
    if (number % 2 == 0) {
      even++;
    } else {
      odd++;
    }
  });

  count = min(odd, even);

  return count;
}

int exercise3(List<int> input) {
  int maxTree = input[0];
  int minTree = input[0];
  int count = 0;

  input.forEach((number) {
    if (number > maxTree) {
      maxTree = number;
    }
    if (number < minTree) {
      minTree = number;
    }
  });

  input.forEach((number) {
    if (number == maxTree || number == minTree) {
      count++;
    }
  });

  return count;
}

int exercise4(int numberA, int numberB) {
  int result = 0;

  result = (numberA + numberB) % 24;

  return result;
}

int exercise5(List<int> people, int limit) {
  int count = 0;
  people.sort();

  int j = people.length - 1;
  for (int i = 0; i <= j; j--) {
    if (people[i] + people[j] <= limit) {
      i++;
    }

    count++;
  }

  return count;
}
