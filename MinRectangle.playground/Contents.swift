import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    guard sizes.count >= 1, sizes.count <= 10000 else {return -1}
    //큰거중에 큰거, 작은거중에 큰거 쓰면 되겠는디
    //제한사항은 왜 w랑 h로 혼란을 야기시키는겨? 쓰잘데없는 아이큐테스트인가 이건..
    //만약 초보자가 명시적 표현을 좋아하는 입장이면.. 코드가 방대해지겠군.
    //성실하면 욕먹기 좋다는 소리
    var bigMax = [Int](), smallMax = [Int]()
    
    for i in 0..<sizes.count{
        if sizes[i][0] > sizes[i][1]{
            bigMax.append(sizes[i][0])
            smallMax.append(sizes[i][1])
        }else{
            bigMax.append(sizes[i][1])
            smallMax.append(sizes[i][0])
        }
    }
    let w = bigMax.sorted(by:>)
    let h = smallMax.sorted(by:>)

    
    if w.min()! >= 1, h.min()! >= 1, w.max()! <= 1000, h.max()! <= 1000 {
        
        return w[0] * h[0]
    } else { return -1
        //    print(#function)
    }
}
    //그냥 실험해봄.
//    let sortedSizes = sizes.sorted(by: {$0.max()! > $1.max()!})
//    print(sortedSizes)
    
    
    
    //있는 그대로 들어오는 배열값 0과 1 구분해준것
    /*var w : [Int] = []
    var h : [Int] = []
    var result = 0
    for i in sizes {
        w.append(i[0])
        h.append(i[1])
    }
    
    
    return result*/

            //3000  //2100  //1800  //3200
//solution([[60, 50],[30,70],[60,30],[80,40]])
//[[80, 40], [30, 70], [60, 50], [60, 30]]\n


//solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])
//[[8, 15], [5, 15], [14, 7], [12, 3], [10, 7]]\n


solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]])
//[[19, 6], [18, 7], [6, 16], [14, 4], [7, 11]]\n


//forEach로 푸신분 자료
/*
 func solution(_ sizes:[[Int]]) -> Int {
     var widths = [Int](), height = [Int]()
     
     sizes.forEach { size in
         let sorted = size.sorted(by: >)
         widths.append(sorted[0])
         height.append(sorted[1])
     }

     return widths.max()! * height.max()!
 }
 */


//map에 max를 또 뽑아서.. 곱
/*
 import Foundation

 func solution(_ sizes:[[Int]]) -> Int {
     return (sizes.map{ $0.max() ?? 0 }.max() ?? 0) * (sizes.map{ $0.min() ?? 0 }.max() ?? 0)
 }
 */


//2차원 배열은 이렇게 접근하면 되긴 하는구나;
/*
 func solution(_ sizes:[[Int]]) -> Int {
 var bigSizes = [Int]()
     var smallSizes = [Int]()
     for i in 0..<sizes.count{
         if sizes[i][0] > sizes[i][1]{
             bigSizes.append(sizes[i][0])
             smallSizes.append(sizes[i][1])
         }else{
             bigSizes.append(sizes[i][1])
             smallSizes.append(sizes[i][0])
         }
     }
         let width = bigSizes.sorted(by:>)
         let height = smallSizes.sorted(by:>)
     
     
     return width[0] * height[0]
 }
 */

/*
 func solution(_ sizes:[[Int]]) -> Int {
     //먼저 각배열을 크기 순으로 정렬해서 긴쪽이 세로로 가도록 정렬
     let sizes_sorted = sizes.map({$0.sorted()})
     let w_max = sizes_sorted.map({$0[0]}).max()
     let h_max = sizes_sorted.map({$0[1]}).max()

     let answer = w_max! * h_max!

     return answer
 }
 */

/*
 func solution(_ sizes:[[Int]]) -> Int {
     let kk = sizes.map({$0.sorted()})
     return kk.map({$0[0]}).max()! * kk.map({$0[1]}).max()!
 }
 */

/*
 func solution(_ sizes:[[Int]]) -> Int {
     return sizes.map{$0.max()!}.max()! * sizes.map{$0.min()!}.max()!
 }
 */
