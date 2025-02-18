import 'dart:convert';

/*
 * JSON 데이터 다루기
 * JSON String -> Map<String, dynamic> -> Object 순서로 파싱
 */
class User {
  final String name;
  final int age;

  User({required this.name, required this.age});

  // 역파싱 과정
  // User 데이터를 Map<String, dynamic> 자료형으로 변환
  Map<String, dynamic> toMap() {
    return {'name': name, 'age': age};
  }

  // Map<String, dynamic> 자료형을 User 객체로 변환
  // factory: 생성자이지만 .명칭 으로 이름을 갖는다.
  factory User.fromJson(Map<String, dynamic> map) {
    return User(name: map['name'], age: map['age']);
  }
}

void main() {
  var user = User(name: '홍길동', age: 20);

  // 역파싱 과정
  // jsonEncode: Converts [object] to a JSON string.
  String userJson = jsonEncode(user.toMap());
  print(userJson);

  // JSON 문자열을 Map으로 반환 => Deserialize 역 직렬화
  String jsonString = '{"name": "김철수", "age":"30"}';

  Map<String, dynamic> userMap = jsonDecode(jsonString);
  print(userMap);

  var user2 = User.fromJson(userMap);
  print(user2.name);
  print(user2.age);
}
