//
//  main.swift
//  CodeStarterCamp_Week2
//
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

var pastLottoNumbers: [String: [Int]] = [:]

for _ in 0...4 {
    createRandomLottoNumbers()
}

doPrintPastLottoNumbers(4)

//로또 회차와 번호를 저장하는 함수 -> key = "n회차", value = [로또번호]
func saveLottoNumbers(_ lastLottoNumbers: [Int]) {
    let round = pastLottoNumbers.count + 1
    let roundToString = String(round) + "회차"
    pastLottoNumbers.updateValue(lastLottoNumbers, forKey: roundToString)
}

//로또 회차와 번호를 출력하는 함수
func doPrintPastLottoNumbers(_ roundNumber: Int) {
    var lottoNumbers: String = ""
    
    if let pastLottoNumbers = pastLottoNumbers[String(roundNumber) + "회차"] {
        for previousLottoNumbers in pastLottoNumbers {
            lottoNumbers += String(previousLottoNumbers) + ", "
        }
        print("\(roundNumber)회차의 로또 당첨 번호는 \(lottoNumbers.dropLast(2)) 입니다.")
    }
    else {
        print("\(roundNumber)회차의 로또 당첨 번호가 없습니다.")
    }

}

//찍은 번호와 로또 당첨번호 겹치는 숫자 확인하고 리턴하는 함수
func compareLottoNumbers(_ myLottoNumbers: [Int]) {
    var sameLottoNumbers: String = ""
    let lottoNumbers = createRandomLottoNumbers()
    
    for myLottoNum in myLottoNumbers {
        for lottoNum in lottoNumbers {
            if myLottoNum == lottoNum {
                sameLottoNumbers += String(myLottoNum) + ", "
                break
            }
        }
    }
    
    doPrintLottoResult(sameLottoNumbers)

}

//로또 결과 출력 함수
func doPrintLottoResult(_ sameLottoNumbers: String) {
    if sameLottoNumbers.count != 0 {
        print("축하합니다! 겹치는 번호는 \(sameLottoNumbers.dropLast(2)) 입니다.")
    }
    else {
        print("아쉽지만 겹치는 번호가 없습니다.")
    }
}

//로또 숫자 6개를 랜덤으로 생성하는 함수
@discardableResult
func createRandomLottoNumbers() -> [Int] {
    var setLottoNumbers: Set<Int> = Set<Int>()
    
    while setLottoNumbers.count < 6 {
        setLottoNumbers.insert(Int.random(in: 1...45))
    }
    
    let lottoNumbers = Array(setLottoNumbers.sorted())
    saveLottoNumbers(lottoNumbers)
    
    return lottoNumbers
}
