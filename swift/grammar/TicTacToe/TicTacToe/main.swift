// 게임 보드를 표현하는 열거형
enum Piece {
    case empty
    case x
    case o
}

// 게임 상태를 표현하는 프로토콜
protocol GameState {
    var currentPlayer: Piece { get }
    // [[Piece]] 는 타입별칭을 만들 수 있다.
    var board: [[Piece]] { get }
    func isValidMove(row: Int, column: Int) -> Bool
}

// 게임 로직을 담당하는 클래스
class TicTacToe: GameState {
    var board: [[Piece]]
    var currentPlayer: Piece
    
    init() {
        board = [[.empty, .empty, .empty],
                 [.empty, .empty, .empty],
                 [.empty, .empty, .empty]]
        currentPlayer = .x // x가 첫 번째 플레이어
    }
    
    func isValidMove(row: Int, column: Int) -> Bool {
        // TODO: isValidMove 메서드 구현
        if (row < 3 && row >= 0 && column < 3 && column >= 0
            && board[row][column] == .empty) { return true }
        return false
    }
    
    func makeMove(row: Int, column: Int) -> Bool {
        // TODO: 플레이어 이동 메서드 구현
        if (isValidMove(row: row, column: column)) {
            board[row][column] = currentPlayer
            currentPlayer = currentPlayer == .x ? .o : .x
            return true
        }
        return false
    }
    
    func checkWinner() -> Piece? {
        // check row win conditions
        for row in board {
            let fstPiece = row[0]
            if (row.filter {fstPiece == $0 && fstPiece != .empty}.count == 3) {
                return fstPiece
            }
        }
        // check column win conditions
        for column in 0...2 {
            let fstPiece = board[0][column]
            if (fstPiece != .empty && fstPiece == board[1][column] && fstPiece == board[2][column]) {return fstPiece}
        }
        if (board[0][0] != .empty && board[0][0] == board[1][1] && board[0][0] == board[2][2]) {return board[0][0]}
        if (board[0][2] != .empty && board[0][2] == board[1][1] && board[0][2] == board[2][0]) {return board[0][2]}
        
        // check draw condition (no .empty)
        let boardSet = Set(board.joined())
        if (boardSet.filter{$0 == .empty}.count == 0) { return .empty }
        
        return nil
    }
    
    func printBoard() {
        // 보드를 출력하는 코드
        print("\n-------------")
        for row in 0...2 {
            print("|", terminator: "")
            for column in 0...2 {
                switch board[row][column] {
                case .empty:
                    print("   ", terminator: "|")
                case .o:
                    print(" O ", terminator: "|")
                case .x:
                    print(" X ", terminator: "|")
                }
            }
            print("\n-------------")
        }
    }
}

var game = TicTacToe()

while true {
    game.printBoard()
    print("\n현재 플레이어: \(game.currentPlayer)")
    
    print("행 입력 (0-2)('q' 입력시 종료): ", terminator: "")
    let rowInput = readLine() ?? ""
    if rowInput == "q" { break }
    guard let row = Int(rowInput) else { continue }
    
    print("열 입력 (0-2)('q' 입력시 종료): ", terminator: "")
    let colInput = readLine() ?? ""
    if colInput == "q" { break }
    guard let column = Int(colInput) else { continue }
    if !game.makeMove(row: row, column: column) {
        print("잘못된 위치입니다. 다시 시도해주세요.")
        continue
    }
    
    if let winner = game.checkWinner() {
        game.printBoard()
        if winner == .empty {
            print("무승부")
        } else {
            print("\(winner) 승리")
        }
        break
    }
}
