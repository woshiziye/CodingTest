//
//  ImageAndTextCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit

class ImageAndTextCell: SeparaterCell {

    static let reuseId: String = "ImageAndTextCell"

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
            contentLabel.text = _unit.content
            let count = _unit.imgUrls.count
            if count > 0 {
                imagesView.imageUrls = _unit.imgUrls
                imagesView.snp.remakeConstraints {
                    $0.top.equalTo(contentLabel.snp.bottom).offset(15)
                    $0.left.right.equalToSuperview().inset(12)
                    $0.bottom.equalToSuperview().inset(18)
                    $0.height.equalTo(imagesView.getTotalHeight())
                }
            } else {
                imagesView.snp.remakeConstraints {
                    $0.top.equalTo(contentLabel.snp.bottom).offset(15)
                    $0.left.right.equalToSuperview().inset(12)
                    $0.bottom.equalToSuperview().inset(8)
                    $0.height.equalTo(0)
                }
            }
        }

    }

    private lazy var contentLabel: UILabel = {
        let label = UILabel.custom_label(text: "", font: .systemFont(ofSize: 14), textColor: TSCOLOR_TEXT_333)
        label.numberOfLines = 0
        return label
    }()

    private lazy var imagesView = ImagesView(boundsWidth: CGFloat(SCREEN_WIDTH-24))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ImageAndTextCell {

    func configureUI() {

        bgView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(12)
            $0.top.equalToSuperview().offset(18)
            $0.height.lessThanOrEqualTo(60)
        }

        bgView.addSubview(imagesView)

    }

}
