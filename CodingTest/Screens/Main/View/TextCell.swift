//
//  TextCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit

class TextCell: SeparaterCell {

    static let reuseId: String = "TextCell"

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
            contentLabel.text = _unit.content
        }

    }

    private lazy var contentLabel: UILabel = {
        let label = UILabel.custom_label(text: "", font: UIFont(name: "ArialMT", size: 17)!, textColor: TSCOLOR_TEXT_333)
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TextCell {

    func configureUI() {

        bgView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview().inset(12)
        }

    }

}
