//
//  MainViewModel.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

class MainViewModel {

    var list: [ExampleUnit] = []

    var start = 0
    let pageSize = 10
    var networkOn = true

    func getList(completion:@escaping TSValueClosure<TSFailureResult<String>>) {
        
        if let path = Bundle.main.path(forResource: "data", ofType: "json"),
           let content = try? String(contentsOfFile: path) {
            if let data = content.data(using: .utf8) {
                let arr: [ExampleUnit] = try! JSONDecoder().decode([ExampleUnit].self, from: data)
                self.list = arr
                start = self.list.count
                completion(.success)
            }
        }
    }

    func loadMore(completion:@escaping TSValueClosure<TSFailureResult<String>>) {

        if let path = Bundle.main.path(forResource: "data", ofType: "json"),
           let content = try? String(contentsOfFile: path) {
            if let data = content.data(using: .utf8) {
                let arr: [ExampleUnit] = try! JSONDecoder().decode([ExampleUnit].self, from: data)

                let totalNum = arr.count
                if start >= totalNum {
                    completion(.failure("没有更多数据"))
                    return
                }

                var end = start+pageSize
                end = end > totalNum ? totalNum : end
                for i in start..<end {
                    self.list.append(arr[i])
                }

                start = self.list.count
                completion(.success)
            }
        }
    }

}
