//
//  LinkCell.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/7.
//

import UIKit
import WebKit

class LinkCell: SeparaterCell {

    static let reuseId: String = "LinkCell"

    var unit: ExampleUnit? {

        didSet {
            guard let _unit = unit else { return }
            contentLabel.text = _unit.content
            self.loadWebView(urlStr: _unit.link)
            errorLabel.isHidden = true
        }

    }

    private lazy var contentLabel: UILabel = {
        let label = UILabel.custom_label(text: "", font: .systemFont(ofSize: 14), textColor: TSCOLOR_TEXT_333)
        label.numberOfLines = 0
        return label
    }()

    private lazy var webView: WKWebView = {
        let view = WKWebView()
        view.backgroundColor = .gray
        view.uiDelegate = self
        view.navigationDelegate = self
        view.isUserInteractionEnabled = false
        view.scrollView.showsVerticalScrollIndicator = false
        return view
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel.custom_label(text: "加载失败", font: .systemFont(ofSize: 14), textColor: .white)
        label.isHidden = true
        return label
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

extension LinkCell {

    func configureUI() {

        bgView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints {
            $0.left.right.top.equalToSuperview().inset(12)
            $0.height.lessThanOrEqualTo(60)
        }

        bgView.addSubview(webView)
        webView.snp.makeConstraints {
            $0.left.right.equalTo(contentLabel)
            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
            $0.height.equalTo((SCREEN_WIDTH-24)*3/4)
            $0.bottom.equalToSuperview().offset(-12)
        }

    }

    func loadWebView(urlStr: String) {
        self.webView.load(URLRequest.init(url: URL.init(string: urlStr)!))
        self.webView.scrollView.contentInsetAdjustmentBehavior = .never
    }
}

extension LinkCell: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("webViewDidStartLoad")
        self.makeToastActivity(self.center)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("webView load failed")
        self.hideToastActivity()
        errorLabel.isHidden = false
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if (navigationAction.navigationType == WKNavigationType.linkActivated) {
            UIApplication.shared.open(navigationAction.request.url!)
        }

        decisionHandler(.allow)
    }


    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webview finish loading")
        self.hideToastActivity()
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("webview didCommit")
    }

}

