//
//  String+TextFormat.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/9.
//

import Foundation

extension String {
    func getFormatArray() -> [[String: Any]] {
        var result: [[String: Any]] = []
        let filterResult1 = self.components(separatedBy: "<")
        for str in filterResult1 {
            var type = ""
            var value = ""
            var link = ""

            let filterResult2 = str.components(separatedBy: ">")
            if filterResult2.count > 1 {
                var prefix = filterResult2[0]
                prefix.trim()
                if prefix.contains("href") {
                    type = "link"
                    link = prefix.components(separatedBy: "=").last ?? ""
                    link = link.replacingOccurrences(of: "'", with: "")
                    link = link.replacingOccurrences(of: "\\", with: ",")
                } else {
                    type = prefix
                }

                value = filterResult2[1]
                result.append(["type": type, "value": value, "link": link])
            }
        }

        return result
    }

    func getTextFormatUnit() -> [TextFormatUnit] {
        let arr = self.getFormatArray()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: arr) else { return [] }
        let result: [TextFormatUnit] = try! JSONDecoder().decode([TextFormatUnit].self, from: jsonData)
        return result
    }

    func getShortText() -> String {
        if !self.isTextFormated() { return "" }
        var short = ""
        let units = self.getTextFormatUnit()
        for unit in units {
            if unit.type == FormatType.short {
                short = unit.value ?? ""
            }
        }

        return short
    }

    func isTextFormated() -> Bool {
        return (self.contains("<") && self.contains(">"))
    }
}
