## HTML/CSS

</br>

## HTML

**html**

웹사이트의 모습을 기술하기 위한 마크업 언어

```html
<!DOCTYPE html>

<html>
</html>
```

가장 먼저 사용하는 관례적인 코드. 안 써도 동작은 한다.

</br>

많이 사용되는 html

```html
<p> // normal text
<h1> // head (제목)
<footer> // 웹페이지의 가장 아래에 부가 정보를 제공하는 범위
```

</br>

html 문서는 크게 두 부분으로 나뉜다. head, body

</br>

**head**

컨텐츠를 보조하는 내용. ex. title, link, meta 한글 패치 등

**link**: css 파일을 참고하기 위해 연결해준다.
```html
<link rel="stylesheet" href="codelion.css">
```

**met**: 한글 텍스트를 적용하기 위한 관용구
```html
<meta charset="UTF-8">
```

</br>

**body**

컨텐츠

</br>

**div, section**

같은 성질을 가지는 그룹으로 나눌 수 있는 문법
```html
<div class="main-box">
...
</div>
```

</br>

**class**

class를 지정하여 css 파일에서 해당하는 클래스의 div 범위를 디자인한다.

</br>

**<a></a>**

사진이나 텍스트를 클릭 시 지정한 링크로 이동할 수 있도록 한다.
```html
<a href="https//....com"><img src="images/facebook.png"></a>
```

## CSS

```css
// 잘 사용되는 옵션들
text-align
font-size
font-weight
font-height
margin
margin-right: auto;
margin-left: auto; // -> 범위를 화면의 중앙에 오도록 해준다.
border
padding
box-shadow // width(px) height(px) blur area(px)
color
background-color
float: left;
```

**float**

한 줄에 문장이 겹치도록 할 수 있다. 특정 범위의 글자들만 영향을 주고 싶은 경우 div로 범위를 나누고 나뉜 범위를 css 파일에서 overflow: hidden 처리를 해주어야 한다.
