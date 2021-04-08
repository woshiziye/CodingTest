//
//  SeparaterCell.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/27.
//

import UIKit

class SeparaterCell: UITableViewCell {

    lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        TSViewBorder(view, 0.6, TSCOLOR_CCC)
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none

        self.backgroundColor = .clear
        self.addSubview(bgView)

        bgView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.left.right.bottom.equalToSuperview()
        }

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
