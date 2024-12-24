# javascript

상태: 시작 전

## 사용 방법

html(.html)  파일이나 javascript(.js) 파일에 작성할 수 있다.

**html에서 사용할 때**

script로 감싸줘야한다.

```jsx
<script>
	document.write();
</script>
```

**js에서 사용할 때**

js파일을 생성하고 html 파일에 연결해야 한다.

```jsx
//html
<script src='jsfile.js'></script>

//js
document.write('Hello')
```

### 데이터 상자 변수 만들기 (Variable)

```jsx
var name = 'bokyeong;
document.write(typeof name);
```

`Math.random()` → 랜덤한 0~1 사이 실수값을 반환

`parseInt(variable`) → 소수점은 버리고 정수로 변환

**로또 번호 추첨기 만들기**

```jsx
var lotto = []
var num;

while (lotto.length < 6)
	num = parseInt(Math.random() * 45 + 1);  
	if (lotto.indexOf(num) == -1) {
	  lotto.push(num);
  }
}
document.write(lotto.sort((a,b)=>a-b));
```

### 자소서 글자 수 계산기

**DOM(Document Object Model)**

웹 화면을 구성하는 html 코드를 쉽게 접근할 수 있도록 만든 모델

태그 추가, 속성 변경 등

```jsx
document.getElementById('jasoseol').value
document.getElementById('jasoseol').innerHTML = '(' + content.length + '/200)'
```

function

```jsx
function counter() {
	var content = document.getElementById('jasoseol').value;
	if (content.length > 200) {
		content = content.substring(0,200);
	  document.getElementById('jasoseol').value = content;
  }
	document.getElementById('jasosel').innerHTML = '(' + content + '/200)';
}
counter();
```

Event

onkeydown → 키보드가 눌리는 이벤트

```jsx
<textarea onkeydown="counter()" class="form-control" rows="3" id="jasoseol">저는 인성 문제가 없습니다.</textarea>
```

jquery library

js를 쉽게 사용할 수 있도록 만든 라이브러리

```jsx
// jquery cdn
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

console.log('#content').val()
```

**익명 함수**

기본 사용법: `(#선택자).행위;`

```jsx
$('#click').click(function(){
	console.log('hello');
});
```

**미니 스타크래프트 만들기**

```jsx
<body>
    <h1 id='hp'>HP: 3</h1>
    <div class='background'>
        <img id='drone' src="drone.png" alt="drone">
        <img id='spit' src="spit.png" alt="spit">
        <img id='bunker' src="bunker.png" alt="bunker">
    </div>
    <script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
    <script>
        var hp = 3;
        $('#drone').click(function(){
            $('#spit').fadeIn();
            $('#spit').animate({left: '+=250'});
            $('#spit').fadeOut(function(){
                hp = hp - 1;
                $('#hp').text('HP: ' + hp);
                if (hp == 0) {
	                $('#bunker').fadeOut();
                }
            });
            $('#spit').css({left: '150px'});
        });
    </script>
</body>
```

**계산기 만들기**

```jsx
// 객체 만들기
var person = {
	name: 'jocoding'
	sayHello: function() { console.log('hello'); }
}
```

**Date 객체**

```jsx
//1. Date 객체 생성
var now = new Date();
//2. 연도를 가져오는 메서드 .getFullYear()
console.log(now.getFullYear());
//3. 월 정보를 가져오는 메서드 .getMonth() {0: 1월, 1: 2월, ... 10: 11월, 11: 12월}
console.log(now.getMonth());
//4. 일 정보를 가져오는 메서드 .getDate()
console.log(now.getDate());
//5. 1970년 1월 1일 00:00:00을 기준으로 흐른 시간을 밀리초로 표시하는 메서드 .getTime()
console.log(now.getTime());
//6. 특정 일의 Date 객체 생성
var christmas = new Date('2020-12-25');
console.log(christmas);
//7. 특정 ms의 Date 객체 생성
var ms = new Date(1000);
console.log(ms);
```