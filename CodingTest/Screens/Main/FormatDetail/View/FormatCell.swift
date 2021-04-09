//
//  FormatCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/9.
//

import UIKit
import M80AttributedLabel

class FormatCell: UITableViewCell {

    static let reuseId: String = "FormatCell"

    let image_width = SCREEN_WIDTH-40
    let image_height = (SCREEN_WIDTH-40)/2.0

    var tapLinkClosure: TSValueClosure<String>?

    var unit: TextFormatUnit? {

        didSet {
            guard let _unit = unit, let type = _unit.type, let value = _unit.value else { return }
            switch type {
            case .head:
                valueLabel.font = .boldSystemFont(ofSize: 30)
                valueLabel.text = value
                valueLabel.textColor = TSCOLOR_TEXT_333
                valueLabel.isHidden = false
                line.isHidden = true
                photoImageView.isHidden = true
                linkLabel.isHidden = true
                vline.isHidden = true
            case .date:
                valueLabel.font = .systemFont(ofSize: 14)
                valueLabel.textColor = TSCOLOR_CCC
                valueLabel.text = value
                valueLabel.isHidden = false
                line.isHidden = true
                photoImageView.isHidden = true
                linkLabel.isHidden = true
                vline.isHidden = true
            case .title:
                valueLabel.font = .boldSystemFont(ofSize: 26)
                valueLabel.textColor = TSCOLOR_TEXT_333
                valueLabel.text = value
                valueLabel.isHidden = false
                line.isHidden = false
                linkLabel.isHidden = true
                vline.isHidden = true
                if let imageUrl = _unit.imageUrl {
                    if let url = URL(string: imageUrl) {
                        photoImageView.isHidden = false
                        photoImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
                    }
                } else {
                    photoImageView.isHidden = true
                }
            case .link:
                configureLinkText(text: "·", linkStr: value)
                valueLabel.isHidden = true
                line.isHidden = true
                photoImageView.isHidden = true
                linkLabel.isHidden = false
                vline.isHidden = true
            case .short:
                configureLinkText(text: value, linkStr: "")
                valueLabel.isHidden = true
                line.isHidden = true
                photoImageView.isHidden = true
                linkLabel.isHidden = false
                vline.isHidden = false
            }

            if type == .title && _unit.haveImage {
                valueLabel.snp.remakeConstraints {
                    $0.top.left.right.equalToSuperview().inset(20)
                    $0.bottom.equalToSuperview().inset(10+30+image_height)
                }

            } else if type == .link {
                let height = linkLabel.sizeThatFits(CGSize(width: SCREEN_WIDTH-40, height: CGFloat.greatestFiniteMagnitude)).height
                linkLabel.snp.remakeConstraints {
                    $0.top.left.right.equalToSuperview().inset(20)
                    $0.height.equalTo(height)
                }

                valueLabel.snp.remakeConstraints {
                    $0.top.left.right.equalToSuperview().inset(20)
                    $0.height.equalTo(height)
                    $0.bottom.equalToSuperview().inset(10)
                }
            } else if type == .short {
                let height = linkLabel.sizeThatFits(CGSize(width: SCREEN_WIDTH-60, height: CGFloat.greatestFiniteMagnitude)).height

                vline.snp.remakeConstraints {
                    $0.left.top.equalToSuperview().inset(20)
                    $0.width.equalTo(4)
                    $0.height.equalTo(height)
                }

                linkLabel.snp.remakeConstraints {
                    $0.left.equalToSuperview().offset(40)
                    $0.top.right.equalToSuperview().inset(20)
                    $0.height.equalTo(height)
                }

                valueLabel.snp.remakeConstraints {
                    $0.top.left.right.equalToSuperview().inset(20)
                    $0.height.equalTo(height)
                    $0.bottom.equalToSuperview().inset(10)
                }
            } else {
                valueLabel.snp.remakeConstraints {
                    $0.top.left.right.equalToSuperview().inset(20)
                    $0.bottom.equalToSuperview().inset(10)
                }
            }
        }

    }

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()

    lazy var linkLabel : M80AttributedLabel = {
        let label = M80AttributedLabel()
        label.backgroundColor = .clear
        label.textColor = TSCOLOR_TEXT_333
        label.font = UIFont.systemFont(ofSize: 14)
        label.delegate = self
        label.lineSpacing = 5.0
        label.numberOfLines = 0
        return label
    }()

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        return imageView
    }()

    private lazy var vline: UIView = {
        let view = UIView()
        view.backgroundColor = TSCOLOR_CCC
        return view
    }()

    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = TSCOLOR_LINE
        return view
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


extension FormatCell: M80AttributedLabelDelegate {
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
        if text == unit?.value {
            guard let closure = self.tapLinkClosure, let unit = self.unit, let link = unit.link else { return }
            closure(link)
        }
    }
}

extension FormatCell {

    func configureUI() {

        contentView.addSubview(valueLabel)
        valueLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(20)
        }

        contentView.addSubview(linkLabel)

        contentView.addSubview(vline)

        contentView.addSubview(line)
        line.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(valueLabel.snp.bottom).offset(10)
            $0.height.equalTo(1)
        }

        contentView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(valueLabel.snp.bottom).offset(30)
            $0.height.equalTo(image_height)
        }

    }

}
