//
//  MainCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import  UIKit

class MainCell: UITableViewCell {

    static let reuseId: String = "MainCell"

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
        }

    }

    private lazy var contentLabel: UILabel = {
        let label = UILabel.custom_label(text: "", font: .systemFont(ofSize: 14), textColor: .black)
        return label
    }()

    private lazy var imagesView: UIView = {
        let view = UIView()
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



extension MainCell {

//    @objc func tapExample() {
//
//    }

}

extension MainCell {

    func configureUI() {

//        view.addSubview(contentLabel)
//        contentLabel.snp.makeConstraints {
//            $0.left.right.top.bottom.equalToSuperview()
//        }

//        view.addSubview(imagesView)
//        imagesView.snp.makeConstraints {
//            $0.left.right.top.bottom.equalToSuperview()
//        }

//        view.addSubview(line)
//        line.snp.makeConstraints {
//            $0.left.right.top.bottom.equalToSuperview()
//        }

    }

}
