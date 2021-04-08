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
    var content: String = ""
    var imgUrls: [String] = []
    var link: String = ""
}
