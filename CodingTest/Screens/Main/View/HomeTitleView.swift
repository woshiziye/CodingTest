//
//  HomeTitleView.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/8.
//

import UIKit

class HomeTitleView: UIView {

    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon"))
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel.custom_label(text: "ArcBlock", font: .boldSystemFont(ofSize: 20), textColor: .black)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension HomeTitleView {

    func configureUI() {


        addSubview(iconImageView)
        iconImageView.snp.makeConstraints {
            $0.width.height.equalTo(34)
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview().offset(-60)
        }

        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(iconImageView.snp.right).offset(10)
            $0.top.bottom.right.equalToSuperview()
        }

    }
}
