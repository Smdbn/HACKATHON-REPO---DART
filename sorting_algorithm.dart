// Quick Sort Implementation
List<int> quickSort(List<int> list) {
  if (list.length <= 1) return list;

  int pivot = list[list.length ~/ 2];
  List<int> less = list.where((x) => x < pivot).toList();
  List<int> equal = list.where((x) => x == pivot).toList();
  List<int> greater = list.where((x) => x > pivot).toList();

  return [...quickSort(less), ...equal, ...quickSort(greater)];
}

// Bubble Sort Implementation
List<int> bubbleSort(List<int> list) {
  List<int> arr = List.from(list);
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  return arr;
}

// Performance Testing
void performanceTest() {
  List<int> data = List.generate(1000, (index) => (1000 - index));

  Stopwatch stopwatch = Stopwatch()..start();
  quickSort(data);
  stopwatch.stop();
  print('Quick Sort Time: ${stopwatch.elapsedMilliseconds}ms');

  stopwatch.reset();
  stopwatch.start();
  bubbleSort(data);
  stopwatch.stop();
  print('Bubble Sort Time: ${stopwatch.elapsedMilliseconds}ms');
}

// Testing the sorting algorithms
void main() {
  List<int> numbers = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
  print('Original List: $numbers');
  print('Quick Sort: ${quickSort(numbers)}');
  print('Bubble Sort: ${bubbleSort(numbers)}');

  performanceTest();
}
