//
//  FormatDetailVC.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/9.
//

import UIKit

class FormatDetailVC: ViewController {

    let viewModel = FormatDetailViewModel()

    private lazy var _tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 64
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(FormatCell.self, forCellReuseIdentifier: FormatCell.reuseId)
        tableView.separatorInset = .zero
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad() 

        configureUI()
        getList()
    }

}

extension FormatDetailVC {

    func getList() {
        viewModel.getList()
        _tableView.reloadData()
    }

}

extension FormatDetailVC {

    func configureUI() {

        title = "带排版的详情页"

        view.addSubview(_tableView)
        _tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }

    }
}

extension FormatDetailVC: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.list.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let unit = viewModel.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormatCell.reuseId, for: indexPath) as! FormatCell
        cell.unit = unit
        cell.tapLinkClosure = { link in
            let vc = WebVC()
            vc.urlStr = link
            vc.titleStr = "这是一个网页"
            self.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


    }

}
