//
//  LinkCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit
import WebKit
import M80AttributedLabel

class LinkCell: UITableViewCell {

    static let reuseId: String = "LinkCell"
    var tapLinkClosure: TSValueClosure<String>?

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
            configureLinkText(text: _unit.content, linkStr: _unit.link)

            let size = linkLabel.sizeThatFits(CGSize(width: SCREEN_WIDTH-24, height: CGFloat.greatestFiniteMagnitude))
            linkLabel.snp.remakeConstraints {
                $0.left.right.top.bottom.equalToSuperview().inset(12)
                $0.height.lessThanOrEqualTo(60)
                $0.height.equalTo(size.height)
            }
        }
    }

    lazy var linkLabel : M80AttributedLabel = {
        let label = M80AttributedLabel()
        label.backgroundColor = .clear
        label.textColor = TSCOLOR_TEXT_333
        label.font = UIFont.systemFont(ofSize: 14)
        label.delegate = self
        label.underLineForLink = true
        label.lineSpacing = 5.0
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

extension LinkCell: M80AttributedLabelDelegate {
    private func configureLinkText(text: String, linkStr: String){
        let content = text+linkStr
        linkLabel.text = content
        let range = (content as NSString).range(of: linkStr)
        if range.location != NSNotFound {
            linkLabel.addCustomLink(NSValue(range: range), for: range, linkColor: TSCOLOR_BLUE)
        }
    }

    func m80AttributedLabel(_ label: M80AttributedLabel, clickedOnLink linkData: Any) {
        guard let range = linkData as? NSRange  else { return}

        let text = (linkLabel.text! as NSString).substring(with: range)
        if text == unit?.link {
            guard let closure = self.tapLinkClosure, let unit = self.unit else { return }
            closure(unit.link)
        }
    }
}

extension LinkCell {

    func configureUI() {

        contentView.addSubview(linkLabel)


//        bgView.snp.makeConstraints {
//            $0.
//        }
    }

}


