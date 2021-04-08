//
//  DetaiImageCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/8.
//

import UIKit

class DetaiImageCell: UITableViewCell {

    static let reuseId: String = "DetaiImageCell"

    var imageUrl: String? {

        didSet {
            guard let _imageUrl = imageUrl, let url = URL(string: _imageUrl) else { return }
            photoImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
            nameLabel.text = getPicName(imageUrl: _imageUrl)
        }
    }

    private lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 0)
        view.layer.shadowOpacity = 2
        return view
    }()

    private lazy var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: ""))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let font = UIFont(name: "Zapfino", size: 14)
        let label = UILabel.custom_label(text: "", font: font!, textColor: .black)
        label.textAlignment = .center
        label.backgroundColor = .white

        return label
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



extension DetaiImageCell {

    func getPicName(imageUrl: String) -> String {
        let arr = imageUrl.components(separatedBy: "/")
        return arr.last ?? ""
    }

}

extension DetaiImageCell {

    func configureUI() {

        contentView.addSubview(whiteView)
        whiteView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.bottom.equalToSuperview().inset(10)
        }

        whiteView.addSubview(blackView)
        blackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.width.height.equalTo(SCREEN_WIDTH-20)
        }

        whiteView.addSubview(photoImageView)
        photoImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(10)
            $0.width.height.equalTo(SCREEN_WIDTH-30)
        }

        whiteView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(blackView.snp.bottom)
            $0.left.right.bottom.equalToSuperview()
        }

//        view.addSubview(line)
//        line.snp.makeConstraints {
//            $0.left.right.top.bottom.equalToSuperview()
//        }

    }

}
