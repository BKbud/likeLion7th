# Git & GitHub

상태: 수업

# Git

<aside>
💡

Git: 프로젝트의 변경사항을 추적하고 협업을 돕는 기술

</aside>

예전에는 CVS, SVN 등의 버전 관리 툴을 사용했다. ‘Linus Torvalds’가 Linux 커널이라는 대규모 소프트웨어 개발 작업을 위해 Git을 일주일만에 만들었다고..

</br>

### Terminal vs Shell

**터미널**은 입력과 출력이 가능한 하드웨어 장비를 의미하며, 콘솔이라고도 부른다. 좀 더 정확히는 운영체제 커널과 연결가능한 문자 입출력 기능을 가진 물리 장비를 의미한다.

**셸**은 커맨드라인 인터페이스로 구현된 가장 대표적인 프로그램이며 컴퓨터에 명령을 내리기 위한 인터페이스 역할을 한다. 커맨드라인(Command line)이라는 표현은 셸 자체를 지칭한다고 해도 무방하다.

터미널을 통해서 커맨드라인 인터페이스로 구현된 프로그램들을 직접 실행할 수 있으며, 대부분의 경우 기본적으로 셸(Bash Shell)이 실행되도록 설정되어있다.

</br>

### 두 종류의 UI

**GUI(Graphic User Interface)**: 컴퓨터와 상호작용할 수 있는 객체(아이콘, 버튼 등)를 그래픽으로 표현한 집합. (Point and Click)

**CUI(Command User Interface)**: 텍스트를 기반으로 명령을 입력하는 인터페이스

명령 프롬프트 → powerShell

</br>

## Git 파일 상태

워킹 디렉토리의 모든 파일은 크게 Tracked와 Untracked로 나눈다. Tracked 파일은 이미 스냅샷에 포함돼 있던 파일이다.

Tracked 파일은 또 Unmodified와 Modified 그리고 Staged 상태 중 하나이다. 모두 Git이 알고 있는 파일이다. 마지막 커밋 이후 아직 아무것도 수정하지 않은 상태에서 어떤 파일을 수정하면 Git은 그 파일을 **Modified** 상태로 인식한다.

![image](https://github.com/user-attachments/assets/1b24df0f-0230-4975-b084-fab6fa81c828)

Git은 위의 사이클을 반복하며 동작한다.

</br>

### 주로 사용하는 Git 명령어

`git init`**:** 새로운 깃 파일을 생성한다.

`git remote`: 현재 프로젝트에 등록된 원격 저장소를 확인한다.

`git add` : 커밋할 파일을 추가한다.

`git commit`: stage에 올려진 작업들을 기록. 즉, 버전 정보를 기록한다.

`git fetch`: 원격 저장소의 다른 브랜치 정보를 로컬 저장소로 가져온다.

`git push` :  commit한 파일들을 원격 레포지토리에 저장한다.

`git pull` : 원격 저장소에 변경된 내용을 로컬 저장소로 가져온다.

`git merge branchname`: 

`git branch branchname`: 새로운 branch 생성

`git switch branchname`: branch 이동

`git checkout -b` : 브랜치 생성 후 바로 이동
`git commit -a`: add + commit. 한 번 추적된 적 있는 파일들만 추가된다

`log —oneline`: 로그의 작성자, 날짜 등의 정보를 보이지 않고 commit 주소와 브랜치만 보이도록 하는 옵션

</br>

### **commit**

> Git 저장소에 디렉토리에 있는 모든 파일에 대한 스냅샷을 기록하는 것
> 
- Commit 커밋은 프로젝트에서 의미가 있는 최소한의 단위이다. ‘의미’를 가질 수 있게 되는 시기라면 언제든 커밋을 하는 것을 권장한다.
- 커밋은 고유한 40자 해시로 식별된다.
- 커밋을 참조할 때는 해시의 첫 7자만 사용해도 충분하다.

> Git은 가능한 한 커밋을 가볍게 유지하고자 하기때문에, 커밋할 때마다 디렉토리 전체를 복사하진 않습니다. 각 커밋은 저장소의 이전 버전과 다음 버전의 변경내역("delta"라고도 함)을 저장합니다. 그래서 대부분의 커밋이 그 커밋 위의 부모 커밋을 가리킵니다.
> 

즉, 각 commit 파일은 이전 commit의 주소를 가지고 있다. (마치 linked list 처럼 보인다) 덕분에 작업 도중 문제가 생긴다면 이전 버전으로 문제 없이 돌아갈 수 있다.

- `git commmit --amend`
    
    > 이 명령은 자동으로 텍스트 편집기를 실행시켜서 마지막 커밋 메시지를 열어준다. 여기에 메시지를 바꾸고 편집기를 닫으면 편집기는 바뀐 메시지로 마지막 커밋을 수정한다.
    > 
    > 
    > 반대로 커밋 메시지가 아니라 프로젝트 내용을 수정한 경우가 있다. 커밋하고 난 후 새로 만든 파일이나 수정한 파일을 가장 최근 커밋에 집어넣을 수 있다. 기본적으로 방법은 같다. 파일을 수정하고 `git add` 명령으로 Staging Area에 넣는다. 그리고 `git commit --amend` 명령으로 커밋하면 커밋 자체가 수정되면서 추가로 수정사항을 밀어넣을 수 있다.
    > 
    
    단순히 커밋 메세지를 변경할 때 —amend로 변경 가능.
    
    파일을 추가, 변경 후 이전 커밋에 추가하고 싶을 경우 변경 사항을 add 한 후 —amend 옵션과 함께 커밋하여 열린 에디터에서 자유롭게 커밋 내용을 수정할 수 있다. 다만, —amend 사용 시 이전 커밋의 해시값이 바뀌니 주의해야한다.
    
</br>

### merge

다른 브랜치의 작업을 하나로 합치는 작업이다. 별다른 변경 사항 없이 깔끔하게 합칠 수 있다면 문제가 없지만 병합 도중 충돌이 발생하는 경우가 빈번하게 발생한다.

ex. main 브랜치에 ‘red blue’ 가 적힌 텍스트 파일을 생성 후, development 브랜치에서 blue를 yellow로 수정하여 ‘red yellow’ 텍스트 파일이 되도록 수정한다. 이후 main 브랜치에서 `merge development`를 하면 두 브랜치의 파일 중 어떤 것을 따라야 할 지 알 수 없어 충돌이 발생한다. 

</br>

### rebase

> 현재 작업하는 브랜치에서 각 커밋을 하나하나 수정하는 것이 아니라 어느 시점부터 HEAD까지의 커밋을 한 번에 Rebase 한다. 대화형 Rebase 도구를 사용하면 커밋을 처리할 때마다 잠시 멈춘다. 그러면 각 커밋의 메시지를 수정하거나 파일을 추가하고 변경하는 등의 일을 진행할 수 있다. `git rebase` 명령에 `-i`옵션을 추가하면 대화형 모드로 Rebase 할 수 있다. 어떤 시점부터 HEAD까지 Rebase 할 것인지 인자로 넘기면 된다.
> 

여러 개의 커밋 메세지를 수정해야 할 때 사용한다. merge를 하면 보통 병렬 구조로 병합되며, rebase는 직렬 구조로 좀 더 깔끔하게(?) 병합된다.

ex. 3개의 커밋을 수정하는 경우: `git rebase -i HEAD~3`

[Git - 히스토리 단장하기](https://git-scm.com/book/ko/v2/Git-%EB%8F%84%EA%B5%AC-%ED%9E%88%EC%8A%A4%ED%86%A0%EB%A6%AC-%EB%8B%A8%EC%9E%A5%ED%95%98%EA%B8%B0)

</br>

### remote

> 리모트 저장소는 인터넷이나 네트워크 어딘가에 있는 저장소를 말한다. 다른 사람들과 함께 일한다는 것은 리모트 저장소를 관리하면서 데이터를 거기에 Push 하고 Pull 하는 것이다. 리모트 저장소를 관리한다는 것은 저장소를 추가, 삭제하는 것뿐만 아니라 브랜치를 관리하고 추적할지 말지 등을 관리하는 것을 말한다.
> 

`git remote`: 현재 프로젝트에 등록된 원격 저장소를 확인한다.

`-v`: 원격 저장소의 이름과 URL을 함께 볼 수 있다.

remote 사용 예시

<img width="429" alt="image 1" src="https://github.com/user-attachments/assets/82fff987-0a04-4d1a-9fae-9c7c6bbe1d95" />

</br>

### pull

원격 저장소에서 변경된 메타데이터 정보를 확인하고 로컬 저장소에 가져온다.

**pull vs fetch**

> `git fetch`는 로컬 Git에게 원격 저장소에서 최신 메타데이터 정보를 확인하라는 명령을 전달합니다. 단 `fetch`는 원격 저장소에 변경사항이 있는지 확인만 하고, 변경된 데이터를 로컬 Git에 실제로 가져오지는 않습니다. 반면 `git pull`은 원격 저장소에서 변경된 메타데이터 정보를 확인할 뿐만 아니라 최신 데이터를 복사하여 로컬 Git에 가져옵니다.
> 
> 
> `git fetch`를 사용하면 마지막 `pull` 이후 원격 저장소 또는 브랜치에 적용된 변경 사항을 확인할 수 있습니다. 만일 원격 저장소에 변경 사항이 존재하는 상황에서 `pull`을 바로 실행하면 현재 브랜치와 작업 복사본의 파일이 변경되는 동시에 새로 작업한 내용이 손실되는 일이 생길 수 있습니다. 따라서 `fetch`로 변경 사항을 먼저 확인한 후 `pull`을 실행하는 방법이 보다 안전합니다.
> 

fetch: 확인용

pull: 업데이트

<img width="382" alt="image 2" src="https://github.com/user-attachments/assets/634d8be2-fad3-4af5-97cf-1891111785dc" />

위 사진처럼 fetch 할 원격 저장소와 push 할 원격 저장소를 따로 지정할 수도 있다.

</br>

### .gitignore

<aside>
💡

Specifies intentionally untracked file to ignore

</aside>

`gitignore` file specifies intentionally untracked files that Git should ignore. Files already tracked by Git are not affected.

즉, 추적을 원하지 않는 파일을 미리 .gitignore 파일에 작성해두면 commit을 할 때 파일이 추적 파일로 올라가지 않도록 할 수 있다.

</br>

### pull request

git 원격 저장소에 수정이 필요하거나 추가할 내용을 변경할 수 있도록 소유자나 권한을 가진 사람에게 요청하는 것. github이 개발자의 소통 창구로써 빠르게 유명해질 수 있었던 이유 중 하나라고 한다.

- .DS_Store가 생기는 이유?
    
    Desktop Servises Store의 약자로, macOS 운영체제에서 Finder로 폴더를 볼 때마다 자동으로 생성되는 폴더이다. 
    
    이 파일에는 위치한 파일과 주변 폴더에 대한 메타데이터 등이 저장되기 때문에 이 정보를 노출하면 해커가 악의적으로 행동해서 개인 파일에 대한 데이터를 볼 수 있게 되기 때문에 보안상 좋지 않다. 예를 들어 개발 시스템에서 인터넷의 서버로 웹사이트를 업로드하는 경우, 공격자가 요청을 차단하지 않은 웹서버에서 이러한 파일을 얻을 수 있다면 웹서버에 있는 다른 (숨겨진) 파일에 대해 알아내는 데 도움이 될 수 있다. 
    
    통상 Mac으로 개발할 때 .gitignore 파일에 명시해둔다.
    
</br>

### Reference

[커맨드라인 인터페이스, 셸, 터미널이란?](https://www.44bits.io/ko/keyword/command-line-interface-cli-shell-and-terminal#%ED%84%B0%EB%AF%B8%EB%84%90terminal%EC%9D%B4%EB%9E%80)

[[MacOS] .DS_Store 개념 / 삭제 / 제거 / 보안 관련사항](https://chanhhh.tistory.com/209)

[Git - 수정하고 저장소에 저장하기](https://git-scm.com/book/ko/v2/Git%EC%9D%98-%EA%B8%B0%EC%B4%88-%EC%88%98%EC%A0%95%ED%95%98%EA%B3%A0-%EC%A0%80%EC%9E%A5%EC%86%8C%EC%97%90-%EC%A0%80%EC%9E%A5%ED%95%98%EA%B8%B0)

[Learn Git Branching](https://learngitbranching.js.org/?locale=ko)

[Git Fetch와 Git Pull 명령어의 차이점](https://www.freecodecamp.org/korean/news/git-fetch-vs-pull/)
