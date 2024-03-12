import Foundation
// MARK: - 동기와 비동기

// 동기적으로 실행되는 작업
DispatchQueue.global().sync {
    print("Synchronous Task")
}

// 비동기적으로 실행되는 작업
DispatchQueue.global().async {
    print("Asynchronous Task")
}

// 백그라운드에서 비동기 작업 실행
DispatchQueue.global().async {
    // 여기서 백그라운드에서 실행될 작업을 수행합니다.
    for i in 1...5 {
        print("Background Task \(i)")
    }
    
    // 작업이 완료되었음을 메인 스레드로 알립니다.
    DispatchQueue.main.async {
        print("Background Task Completed, Updating UI")
        // UI 업데이트 등을 수행할 수 있습니다.
    }
}

/*
위의 예시는 DispatchQueue.global().async를 사용하여 백그라운드에서 비동기 작업을
실행하는 코드입니다. 이 코드는 백그라운드에서 1부터 5까지의 작업을 실행한 후,
해당 작업이 완료된 후에 메인 스레드에서 UI 업데이트를 실행합니다.
*/


// MARK: - 네트워킹

// 네트워크 작업을 처리할 함수
func fetchData() {
    if let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // 네트워크 작업 완료 후 실행될 코드 (비동기적으로 실행)
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
            }
            
            if let data = data {
                do {
                    // JSON 데이터 파싱
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let jsonDict = json as? [String: Any] {
                        // 파싱된 데이터 활용
                        print("Received JSON data: \(jsonDict)")
                    }
                } catch {
                    print("JSON parsing error: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume() // 네트워크 작업 시작 (비동기적으로 실행됨)
    }
}

// fetchData 함수 호출
fetchData()




