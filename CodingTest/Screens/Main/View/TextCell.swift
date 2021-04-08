//
//  TextCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit
import M80AttributedLabel

class TextCell: SeparaterCell {

    static let reuseId: String = "TextCell"

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
            contentLabel.text = "📝 "+_unit.content
            let height = contentLabel.sizeThatFits(CGSize(width: SCREEN_WIDTH-24, height: CGFloat.greatestFiniteMagnitude)).height
            contentLabel.snp.remakeConstraints {
                $0.left.right.equalToSuperview().inset(12)
                $0.top.bottom.equalToSuperview().inset(18)
                $0.height.equalTo(height)
            }
        }

    }

    private lazy var contentLabel: M80AttributedLabel = {
        let label = M80AttributedLabel()
        label.backgroundColor = .white
        label.textColor = TSCOLOR_TEXT_333
        label.font = UIFont(name: "ArialMT", size: 17)
        label.paragraphSpacing = 15.0
        label.underLineForLink = true
        label.lineSpacing = 2.0
        label.numberOfLines = 0
        return label
    }()

//    private lazy var contentLabel: UILabel = {
//        let label = UILabel.custom_label(text: "", font: UIFont(name: "ArialMT", size: 17)!, textColor: TSCOLOR_TEXT_333)
//        label.numberOfLines = 0
//        return label
//    }()

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


    }

}
