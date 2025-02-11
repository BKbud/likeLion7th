import 'dart:convert';

void main() {
  // String 타입의 리스트 선언
  List<String> months = [
    'January',
    'February',
    'March',
  ];
  // 리스트에 요소 추가
  months.add('April');
  // 리스트의 모든 요소 출력
  months.forEach(print);
  // 인덱스를 사용하여 리스트 요소 접근. List는 Iterable 프로토콜을 만족해서 forEach 사용이 가능하다.
  print(months[0]);
  // 리스트의 길이 확인
  print(months.length);

  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.insert(2, 10); // [1, 2, 10, 3, 4, 5]
  numbers.remove(4); // 특정 값 제거 -> 4 제거
  numbers.removeAt(2); // 특정 인덱스의 값 제거 -> numbers[2] 제거

  // 각 요소를 조건에 따라 필터링한 새로운 리스트
  // where함수는 Iterable<int>를 반환하므로 toList()를 사용해 리스트로 변환해야한다.
  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  // 각 요소를 제곱한 새로운 리스트
  List<int> squaredNumber = numbers.map((number) => number * number).toList();

  // 영화 정보를 담는 Map 생성
  Map<String, dynamic> filmStarWars = {
    'title': 'Star Wars',
    'year': 1977,
  };
  Map<String, dynamic> filmEmpire = {
    'title': 'The Empire Strikes Back',
    'year': 1980,
  };
  Map<String, dynamic> filmJedi = {
    'title': 'The Return of the Jedi',
    'year': 1983,
  };
  List listFlims = [filmStarWars, filmEmpire, filmJedi];
  Map<String, dynamic> currentFilm = listFlims[0];
  var currentFilmTitle = currentFilm['title'];
  print(currentFilmTitle); // Star Wars 출력

  // Map basics
  Map<int, String> mapMonths = {
    1: 'January',
    2: 'February',
    3: 'March',
  };
  mapMonths[4] = 'April';
  mapMonths.forEach((key, value) {
    print('$key: $value');
  });
  // 특정 키에 해당하는 값 출력
  print(mapMonths[1]); // January 출력

  // Map advanced
  Map<String, int> scores = {
    'Alice': 90,
    'Bob': 80,
    'Charlie': 95,
  };
  // 키로 존재 여부 확인
  print(scores.containsKey('Alice')); // true 출력
  // 값 존재 여부 확인
  print(scores.containsValue(80)); // true 출력
  // 키-값 쌍 제거
  scores.remove('Bob');
  // 점수를 5점씩 증가시킨 새로운 Map 생성
  Map<String, int> updatedScores =
      scores.map((key, value) => MapEntry(key, value + 5));
  print(updatedScores); // Alice: 95, Charlie: 100 출력

  Map<String, dynamic> data = {
    'name': 'John',
    'age': 30,
    'city': 'Seoul',
  };
  // 키 존재 여부 확인
  if (data.containsKey('name')) {
    print('Name: ${data['name']}');
  }
  // 값 존재 여부 확인
  if (data.containsValue(30)) {
    print('Age: ${data['age']}');
  }
  // JSON 형식의 사용자 데이터
  Map<String, dynamic> user = {
    'id': 1,
    'info': {
      'name': 'Alice',
      'contacts': [
        {'type': 'email', 'value': 'alice@email.com'},
        {'type': 'phone', 'value': '123-456-7890'}
      ]
    }
  };
  // Map을 JSON 문자열로 변환
  String userJson = jsonEncode(user);
  print(userJson);
  // JSON 문자열을 Map으로 변환
  Map<String, dynamic> parsed = jsonDecode(userJson);
  print(parsed['info']['contacts'][0]['value']); // alice@email.com 출력
}
