import Foundation

func winProbability(myScore: Int, opponent1Score: Int, opponent2Score: Int) -> Double {
    let totalPossibleScores = 1000 // 총 가능한 점수 (0부터 999까지)
    let myRemainingScores = totalPossibleScores - myScore // 남은 내 점수
    let opponent1RemainingScores = totalPossibleScores - opponent1Score // 형택이의 남은 점수
    let opponent2RemainingScores = totalPossibleScores - opponent2Score // 창선이의 남은 점수
    
    // 내가 이길 수 있는 경우의 수 계산
    var winCount = 0
    for myRemaining in 1...myRemainingScores {
        for opponent1Remaining in 1...opponent1RemainingScores {
            for opponent2Remaining in 1...opponent2RemainingScores {
                if myRemaining > opponent1Remaining && myRemaining > opponent2Remaining {
                    winCount += 1
                }
            }
        }
    }
    
    // 이길 확률 계산
    let totalPossibleOutcomes = myRemainingScores * opponent1RemainingScores * opponent2RemainingScores
    let winProbability = Double(winCount) / Double(totalPossibleOutcomes)
    
    return winProbability * 100 // 확률을 백분율로 반환
}

// 테스트
let myScore = 180
let opponent1Score = 350
let opponent2Score = 500

let probability = winProbability(myScore: myScore, opponent1Score: opponent1Score, opponent2Score: opponent2Score)
print("내가 이길 확률: \(probability)%")
