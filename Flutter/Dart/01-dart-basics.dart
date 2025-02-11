void main() {
  int number = 35;

  double price = 2.9929;

  bool isValid = true;

  String message = "Hello Dart!";

  print(number);
  print(price);
  print(isValid);
  print(message);

  print('Hello World!');

  print(18);

  String name = "Dart!";
  print('Welcome to $name');

  print("""
  This is a multiline String
  example
  """);

  // --------
  const int daysInWeek = 7;

  final DateTime now = DateTime.now();

  int? nullableNumber;
  print(nullableNumber);

  nullableNumber = 42;
  print(nullableNumber);

  print('There are $daysInWeek days in a week');
  print('Current time is $now');
}
