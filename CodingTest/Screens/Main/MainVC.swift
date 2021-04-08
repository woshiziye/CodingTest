//
//  MainVC.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit
import MJRefresh

class MainVC: ViewController {

    let viewModel = MainViewModel()
    private lazy var _refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(), for: .valueChanged)
        return control
    }()

    private lazy var _tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MainCell.self, forCellReuseIdentifier: MainCell.reuseId)
        tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.reuseId)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseId)
        tableView.register(ImageAndTextCell.self, forCellReuseIdentifier: ImageAndTextCell.reuseId)
        tableView.register(LinkCell.self, forCellReuseIdentifier: LinkCell.reuseId)
        tableView.refreshControl = _refreshControl
        tableView.separatorInset = .zero
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad() 

        configureUI()
//        _refreshControl.beginRefreshing()
    }

}

extension MainVC {

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

extension MainVC {

//    @objc func tapExample() {
//
//    }

}

extension MainVC {

//    func setInfo() {
//
//    }

}

extension MainVC {

    func configureUI() {

        title = "列表展示页"
        navigationController?.navigationBar.isHidden = false

        view.addSubview(_tableView)
        _tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }

    }
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let unit = viewModel.list[indexPath.row]
        switch unit.type {
        case .text:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.reuseId, for: indexPath) as! TextCell
            cell.unit = unit
            return cell
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.reuseId, for: indexPath) as! ImageCell
            cell.unit = unit
            return cell
        case .textAndImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageAndTextCell.reuseId, for: indexPath) as! ImageAndTextCell
            cell.unit = unit
            return cell
        case .link:
            let cell = tableView.dequeueReusableCell(withIdentifier: LinkCell.reuseId, for: indexPath) as! LinkCell
            cell.unit = unit
            return cell
        case .none:
            return UITableViewCell()
        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
