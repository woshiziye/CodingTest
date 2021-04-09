//
//  TextFormatUnit.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/9.
//

import Foundation

enum FormatType: String, Codable {
    case head = "head"
    case date = "date"
    case short = "short"
    case title = "title"
    case link = "link"
}

struct TextFormatUnit: Codable {
    var type: FormatType?
    var link: String? = ""
    var value: String? = ""
    var imageUrl: String? = ""
    var haveImage: Bool {
        guard let url = imageUrl, url != "" else { return false }
        return true
    }
}
