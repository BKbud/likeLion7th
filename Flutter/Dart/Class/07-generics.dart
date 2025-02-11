class DataStorage<T> {
  List<T> _items = [];

  void addItem(T item) {
    _items.add(item);
  }

  void removeItem(T item) {
    _items.remove(item);
  }

  T? getItems(int index) {
    if (index < _items.length) {
      return _items[index];
    }
    return null;
  }

  List<T> getAllItems() => List.from(_items);

  int get length => _items.length;

  // void clear() {
  //   _items.clear();
  // }

  void clear() => _items.clear();
}

void main() {
  // DataStorage 클래스의 인스턴스를 생성
  var names = DataStorage<String>();
  names.addItem('John');
  names.addItem('Doe');
  names.addItem('Smith');
  names.removeItem('Doe');
  print(names.getAllItems());
  names.clear();
  var numbers = DataStorage<int>();
  numbers.addItem(1);
  numbers.addItem(2);
  numbers.addItem(3);
  numbers.removeItem(2);
  print(numbers.getAllItems());
  // dynamic 타입을 사용하면 모든 타입을 저장할 수 있지만, 타입 안정성이 떨어진다.
  var dynamicData = DataStorage<dynamic>();
  dynamicData.addItem('John');
  dynamicData.addItem(1);
  dynamicData.addItem(2.0);
  dynamicData.addItem(true);
  print(dynamicData.getAllItems());
}
