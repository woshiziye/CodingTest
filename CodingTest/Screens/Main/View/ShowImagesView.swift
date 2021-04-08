//
//  ShowImagesView.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/8.
//

import UIKit

class ShowImagesView: UIView {

    var imageViewArr: [UIImageView] = []

    var imageUrls: [String]? {

        didSet {
            guard let urls = imageUrls else {
                return
            }

            let count = urls.count


        }

    }

    private lazy var scorllView: UIScrollView = {
        let view = UIScrollView()
        view.delegate = self
        view.isPagingEnabled = true
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        for i in 0..<9 {
            let imageView = UIImageView()
            addSubview(imageView)
            imageViewArr[i] = imageView
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension ShowImagesView: UIScrollViewDelegate {

}
