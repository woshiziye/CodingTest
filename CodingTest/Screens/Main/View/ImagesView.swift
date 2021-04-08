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

            for i in 0..<imageViewArr.count {
                let imageView = imageViewArr[i]
                if i < count {
                    imageView.isHidden = false
                    imageView.frame = CGRect(x: CGFloat(CGFloat(i%3)*(CGFloat(DISTANCE)+width)), y: CGFloat(i/3)*(CGFloat(DISTANCE)+width), width: width, height: height)
                    imageView.kf.setImage(with: URL(string: urls[i]))
                } else {
                    imageView.isHidden = true
                }
            }

            
        }

    }

    init(boundsWidth: CGFloat) {
        super.init(frame: .zero)
//        self.backgroundColor = .yellow
        self.boundsWidth = boundsWidth
        for _ in 0..<9 {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            TSViewRadius(imageView, 4.0)
            TSViewBorder(imageView, 0.5, TSCOLOR_LINE)
            addSubview(imageView)
            imageViewArr.append(imageView)
        }

    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension ImagesView {
    func getImageWidth(imageCount: Int) -> CGFloat {
        let distances = CGFloat(DISTANCE*Double((imageCount-1)))
        let width = CGFloat(self.boundsWidth-distances)/CGFloat(imageCount)
        return width
        return (CGFloat(BOUNDS_WIDTH-CGFloat(DISTANCE*Double((imageCount+1)))/CGFloat(imageCount)))
    }

    func getTotalHeight() -> CGFloat {
        guard let urls = imageUrls else { return 0.0 }
        let count = urls.count
        let width = getImageWidth(imageCount: count)
        if count == 1 {
            let height = count == 1 ? width*3.0/4.0 : width
            return height
        } else {
            return width*CGFloat(count/3)+CGFloat(DISTANCE)*CGFloat(count/3-1)
        }
    }
}
