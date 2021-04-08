//
//  ImageCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit

class ImageCell: SeparaterCell {

    static let reuseId: String = "ImageCell"

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
            imagesView.imageUrls = _unit.imgUrls
//            let count = _unit.imgUrls.count
            imagesView.snp.remakeConstraints {
                $0.top.left.bottom.right.equalToSuperview()
//                $0.height.equalTo(width*CGFloat(count)+CGFloat(DISTANCE)*CGFloat(count+1))
                $0.height.equalTo(imagesView.getTotalHeight())
            }
        }

    }

    private lazy var imagesView  = ImagesView(boundsWidth: CGFloat(SCREEN_WIDTH-24))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ImageCell {

    func configureUI() {

        bgView.snp.remakeConstraints {
            $0.left.right.equalToSuperview().inset(12)
            $0.top.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview()
        }
        TSViewRadius(bgView, 4.0)

        bgView.addSubview(imagesView)

    }

}
