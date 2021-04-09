//
//  ImagesView.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/8.
//

import UIKit

class ImagesView: UIView {

    var imageViewArr: [UIImageView] = []
    var boundsWidth: CGFloat = 0.0

    let BOUNDS_WIDTH = SCREEN_WIDTH-24

    var imageUrls: [String]? {

        didSet {
            guard let urls = imageUrls else {
                return
            }

            let count = urls.count
            let width = count > 0 ? getImageWidth(imageCount: count) : 0.0
            let height = count == 1 ? width*3.0/4.0 : width
            numLabel.isHidden = count < 10
            numLabel.text = String(count)

            for i in 0..<imageViewArr.count {
                let imageView = imageViewArr[i]
                if i < count {
                    imageView.isHidden = false
                    imageView.frame = CGRect(x: CGFloat(CGFloat(i%3)*(CGFloat(DISTANCE)+width)), y: CGFloat(i/3)*(CGFloat(DISTANCE)+width), width: width, height: height)
                    if i == 8 {
                        numLabel.frame = imageView.frame
                    }
                    imageView.kf.setImage(with: URL(string: urls[i]), placeholder: UIImage(named: "placeholder"), options: nil) { (result) in
                        switch result {
                            case .success(_):
                                break
//                                imageView.addCorner(cornerRadius: 4.0)
                        case .failure(_):
                            break
                        }
                    }
                } else {
                    imageView.isHidden = true
                }
            }
        }

    }

    private lazy var numLabel: UILabel = {
        let label = UILabel.custom_label(text: "", font: .boldSystemFont(ofSize: 30), textColor: .white)
        label.backgroundColor = TSCOLOR_SHADOW
        label.textAlignment = .center
        return label
    }()

    init(boundsWidth: CGFloat) {
        super.init(frame: .zero)
        self.boundsWidth = boundsWidth
        for _ in 0..<9 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            TSViewBorder(imageView, 0.5, TSCOLOR_CCC)
            imageView.clipsToBounds = true
            addSubview(imageView)
            imageViewArr.append(imageView)
        }

        addSubview(numLabel)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension ImagesView {
    func getImageWidth(imageCount: Int) -> CGFloat {
        let count = imageCount > 3 ? 3: imageCount
        let distances = CGFloat(DISTANCE*Double((count-1)))
        let width = CGFloat(self.boundsWidth-distances)/CGFloat(count)
        return width
    }

    func getTotalHeight() -> CGFloat {
        guard let urls = imageUrls else { return 0.0 }
        let count = urls.count > 9 ? 9 : urls.count
        let width = getImageWidth(imageCount: count)
        if count == 1 {
            let height = count == 1 ? width*3.0/4.0 : width
            return height
        } else {
            let line = (CGFloat(count)/3.0).ceil
            return width*line+CGFloat(DISTANCE)*CGFloat(count/3-1)
        }
    }
}
