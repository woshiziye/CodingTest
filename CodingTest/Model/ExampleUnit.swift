//
//  ExampleUnit.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import Foundation

enum CellType: String, Codable {
    case text = "text"
    case image = "img"
    case textAndImage = "text-img"
    case link = "text-link"
}

struct ExampleUnit: Codable {
    var id: Int?
    var type: CellType?
    var content: String?
    var imgUrls: [String]?
    var link: String?

    var isFormated: Bool {
        guard let _content = content else { return false }
        return _content.isTextFormated()
    }

    var formatUnits: [TextFormatUnit] {
        guard let _content = content else { return [] }
        return _content.getTextFormatUnit()
    }
    var short: String {
        guard let _content = content else { return "" }
        return _content.getShortText()

    }
}
