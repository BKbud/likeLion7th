// // 2. 웹페이지가 로드되면 실행됨.
// document.addEventListener('DOMContentLoaded', () => {
//     console.log('DOMContentLoaded');
// });

// // 1. 파일이 실행되면 실행됨.
// console.log("todo.js");

function addTodo(text) {
    console.log(`addTodo: ${text}`); // `${}` -> 문자열 보간법
    // 동적으로 리스트를 추가할 수 있도록 list 객체를 받아와 사용.
    const todoList = document.getElementById('todoList');
    const li = document.createElement('li'); // <li></li>
    li.textContent = text; // <li>text</li>
    todoList.appendChild(li); // <ul><li>text</li></ul>
}

// '추가' 버튼이 눌렸을 때의 이벤트 동작 정의
document.getElementById('addTodo').addEventListener('click', () => {
    const input = document.getElementById('todoInput');
    addTodo(input.value);
    input.value = '';
})