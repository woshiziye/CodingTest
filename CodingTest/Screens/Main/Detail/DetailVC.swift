//
//  DetailVC.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/8.
//

import UIKit
import M80AttributedLabel

class DetailVC: ViewController {

    let viewModel = DetailViewModel()

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()

    private lazy var contentLabel: M80AttributedLabel = {
        let label = M80AttributedLabel()
        label.backgroundColor = .white
        label.textColor = TSCOLOR_TEXT_333
        label.font = UIFont.systemFont(ofSize: 16)
        label.paragraphSpacing = 15.0
        label.underLineForLink = true
        label.lineSpacing = 5.0
        label.numberOfLines = 0
        return label
    }()

    private lazy var _tableView: ContentSizedTableView = {
        let tableView = ContentSizedTableView()
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DetaiImageCell.self, forCellReuseIdentifier: DetaiImageCell.reuseId)
        tableView.separatorInset = .zero
        tableView.isScrollEnabled = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad() 

        configureUI()
        setInfo()
    }

}

extension DetailVC {

//    func getFunc() {
//        startLoading()
//        viewModel.getFunc() { (result) in
//            self.endLoading()
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                self.view.makeToast(error)
//            }
//        }
//    }

}

extension DetailVC {

//    @objc func tapExample() {
//
//    }

}

extension DetailVC {

    func setInfo() {
        if let unit = viewModel.unit {
            contentLabel.text = unit.content
            let height = contentLabel.sizeThatFits(CGSize(width: SCREEN_WIDTH-30, height: CGFloat.greatestFiniteMagnitude)).height
            contentLabel.snp.makeConstraints {
                $0.height.equalTo(height)
            }
        }
    }

}

extension DetailVC {

    func configureUI() {

        title = "详情页"
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }

        let contentV = UIView()
        scrollView.addSubview(contentV)
        contentV.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
            $0.width.equalToSuperview()
        }

        contentV.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.top.left.right.equalToSuperview().inset(15)
        }

        contentV.addSubview(_tableView)
        _tableView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.bottom.equalToSuperview().inset(20)
        }

    }
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let unit = viewModel.unit else { return 0 }
        let count = unit.imgUrls.count
        return count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageUrl = viewModel.unit?.imgUrls[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: DetaiImageCell.reuseId, for: indexPath) as! DetaiImageCell
        cell.imageUrl = imageUrl
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


    }

}
