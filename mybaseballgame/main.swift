//
//  main.swift
//  mybaseballgame
//
//  Created by 신상규 on 6/14/24.
//

import Foundation

func Randomnumber() -> String {  //함수 스트링타입으로 만들기
    var numbers = [Int](1...9) // 1~9까지의 넘버 생성
    numbers.shuffle() // 배열을 랜덤으로 돌림
    let randomnumber = numbers.prefix(3) // 랜덤한 숫자 3가지를 가져옴
    return randomnumber.map{ String($0)}.joined() // map메서드와 클로저 함수를 사용하여 라턴값을 반환
}
func strikeandball(_ answer: String, _ guess: String) -> (strike: Int, ball: Int) {
    let answerdigit = Array(answer)
    let guessdigit = Array(guess)
    var strike = 0
    var ball = 0
    
    for (index, digit) in guessdigit.enumerated() {
        if digit == answerdigit[index] {
            strike += 1
        }else if answerdigit.contains(digit) {
            ball += 1
        }
    }
    return (strike, ball)
}


func PlayMygame() {
    let answer = Randomnumber()
    var attk = 0
    
    print("게임을 시작합니다. 준비되셨나요?")
    
    while true {
        print("3자리 숫자를 입력해 주세요:", terminator: "")
        if let guess = readLine(), guess.count == 3 {
            attk += 1
            
            let score = strikeandball(answer, guess)
            print("결과: \(score.strike)스트라이크, & \(score.ball)볼")
        } else {
            print("숫자 입력이 잘못 되었습니다 다시 입력해 주세요")
        }
    }
}


