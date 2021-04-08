//
//  MainViewModel.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

class MainViewModel {

    var list: [ExampleUnit] = [.init(id: 1, type: .text, content: "首先，感谢您抽出宝贵的时间进行 Coding Test, 这个 Coding Test 的目标是实现一个多类型的列表页以及对应的详情页面，您可以自由发挥实现整体效果，我们将根据您的最终作品做一个评估考核。", imgUrls: [], link: ""), .init(id: 2, type: .image, content: "", imgUrls:[
        "https://www.arcblockio.cn/blog/static/2c6120caf67e5c927e7254f115e58fcd/38a09/cover.jpg"
    ], link: ""), .init(id: 3, type: .textAndImage, content: "下面是 ArcBlock DevCon 2020 的精彩图片...(可能是很长的文字，多张不同图片，图片可以是0张或者很多张，这里只给了三张为例子", imgUrls: [
        "https://www.arcblockio.cn/blog/static/88b798d281e42ae3570a25e208e89d39/38a09/cover.jpg",
        "https://www.arcblockio.cn/blog/static/461a789adcb0f768d46d60163ee73bd3/f5292/devcon.jpg",
        "https://www.arcblock.io/blog/static/fb2e8a2c56da3fadc4ff21ed5d96a4bc/38a09/cover.jpg"
    ], link: ""), .init(id: 4, type: .textAndImage, content: "这是 ArcBlock ABT Node 界面截图", imgUrls: [
        "https://www.arcblockio.cn/blog/static/e8e5ec2f2824b819380b605d6c50cc2b/92c65/blocklets.png"
    ], link: ""), .init(id: 5, type: .link, content: "这是 ABT 钱包的官网页面, 欢迎体验（需要考虑链接可访问）", imgUrls: [], link: "https://abtwallet.io/zh/")]

//    func getExample(completion:@escaping TSValueClosure<TSFailureResult<String>>) {
//        Network.default.request(ChatAPI.getChatInfoList(patientMobile: TSDefaults.patientMobile!), DefaultResponse.self) { [weak self] result  in
//            guard let self = self else { return }
//            if let arr = result {
//            }
//            completion(.success)
//            print("getExample result:\(String(describing: result))")
//        } error: { (error) in
//            completion(.failure(error))
//            print("getExample error:\(error)")
//        }
//    }

}
