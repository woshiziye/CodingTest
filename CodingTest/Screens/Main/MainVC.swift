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

    private lazy var homeTitleView = HomeTitleView()

    private lazy var rightBtn = UIBarButtonItem.init(title:"关网络", style: .plain, target: self, action: #selector(switchNetwork))

    private lazy var _refreshControl: UIRefreshControl = {
        let control = UIRefreshControl()
        control.addTarget(self, action: #selector(getList), for: .valueChanged)
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
        tableView.register(TextCell.self, forCellReuseIdentifier: TextCell.reuseId)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCell.reuseId)
        tableView.register(ImageAndTextCell.self, forCellReuseIdentifier: ImageAndTextCell.reuseId)
        tableView.register(LinkCell.self, forCellReuseIdentifier: LinkCell.reuseId)
        tableView.refreshControl = _refreshControl
        tableView.mj_footer = MJRefreshAutoFooter.init(refreshingBlock: {
            self.loadMore()
        })
        tableView.separatorInset = .zero
        return tableView
    }()

    private lazy var noNetworkView = UIView()

    private lazy var errImageView = UIImageView(image: UIImage(named: "error"))
    private lazy var noNetworkLabel: UILabel = {
        let label = UILabel.custom_label(text: "无网络连接", font: .systemFont(ofSize: 24), textColor: TSCOLOR_CCC)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad() 

        configureUI()
        getList()
    }

}

extension MainVC {

    @objc func getList() {
        startLoading()
        viewModel.getList() { (result) in
            self.endLoading()
            self._refreshControl.endRefreshing()
            switch result {
            case .success:
                self._tableView.reloadData()
                break
            case .failure(let error):
                self.view.makeToast(error)
            }
        }
    }

    func loadMore() {
        startLoading()
        viewModel.loadMore() { (result) in
            self.endLoading()
            self._tableView.mj_footer?.endRefreshing()
            switch result {
            case .success:
                self._tableView.reloadData()
                break
            case .failure(let error):
                self.view.makeToast(error)
            }
        }
    }

    @objc func switchNetwork() {
        viewModel.networkOn = !viewModel.networkOn
        switch viewModel.networkOn {
        case true:
            rightBtn.title = "关网络"
            _tableView.isHidden = false
            noNetworkView.isHidden = true
            getList()
        case false:
            rightBtn.title = "开网络"
            viewModel.list = []
            _tableView.isHidden = true
            noNetworkView.isHidden = false
        }
    }

}

extension MainVC {

    func configureUI() {

        title = "列表展示页"
        navigationController?.navigationBar.isHidden = false
        navigationItem.titleView = homeTitleView

        navigationItem.rightBarButtonItem = rightBtn

        view.addSubview(_tableView)
        _tableView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }

        view.addSubview(noNetworkView)
        noNetworkView.isHidden = true
        noNetworkView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview()
        }

        noNetworkView.addSubview(errImageView)
        errImageView.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-60)
        }

        noNetworkView.addSubview(noNetworkLabel)
        noNetworkLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(errImageView.snp.bottom)
            $0.height.equalTo(30)
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
            cell.tapLinkClosure = {link in
                let vc = WebVC()
                vc.urlStr = link
                vc.titleStr = "这是一个网页"
                self.navigationController?.pushViewController(vc, animated: true)
            }
            return cell
        case .none:
            return UITableViewCell()
        }
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unit = viewModel.list[indexPath.row]
        if unit.type != .link {
            if unit.isFormated {
                let vc = FormatDetailVC()
                vc.viewModel.data = unit
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let vc = DetailVC()
                vc.viewModel.unit = unit
                navigationController?.pushViewController(vc, animated: true)
            }
        }
    }

}
