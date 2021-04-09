//
//  FormatDetailViewModel.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/9.
//

class FormatDetailViewModel {

    var list: [TextFormatUnit] = []
    var data: ExampleUnit?

    func getList() {
        guard let _data = data else {return }
        ///这里是把图片imageUrls分配个每个title的部分
        let originalList = _data.formatUnits
        if var imageUrls = _data.imgUrls {
            for formatUnit in originalList {
                var unit = formatUnit
                if unit.type == FormatType.title {
                    if imageUrls.count > 0 {
                        unit.imageUrl = imageUrls.first
                        imageUrls.remove(at: 0)
                    }
                }
                self.list.append(unit)
            }
        }
    }

}
