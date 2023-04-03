main() {
  List<int> array = [12, 18, 132, 85324, 782, 562, 751, 321, 223, 215, 445];
  sort(array, 0, array.length);
  print(array);
}

int i = 0;
void sort(List<int> array, int low, int high) {
  int position = low;
  int pivot = high - 1;

  if (pivot <= low) {
    return;
  }

  for (int i = low; i < high - 1; i++) {
    if (array[i] <= array[pivot]) {
      array.insert(low, array[i]);
      position++;
      array.removeAt(i + 1);
    }
  }

  array.insert(position, array[pivot]);
  array.removeAt(pivot + 1);
  sort(array, low, position);
  sort(array, position + 1, high);
  // print(array);
}
