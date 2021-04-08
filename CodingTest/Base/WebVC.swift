//
//  WebVC.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/19.
//

import UIKit
import WebKit

class WebVC: ViewController {

    var titleStr: String?
    var urlStr: String?

    private lazy var webView: WKWebView = {

        let view = WKWebView()
        view.uiDelegate = self
        view.navigationDelegate = self
        return view
    }()

    override func leftItemControlClick() {
        if webView.canGoBack {
            webView.goBack()
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        loadWebView()
    }
}

extension WebVC {
    func configureUI() {
        title = titleStr
        view.addSubview(webView)
        webView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    @objc func loadWebView() {
        guard let url = URL(string: self.urlStr) else { return }
        self.webView.load(URLRequest.init(url: url))
        self.webView.scrollView.contentInsetAdjustmentBehavior = .never
    }
}

extension WebVC: WKUIDelegate, WKNavigationDelegate {
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("webViewDidStartLoad")
        self.view.makeToastActivity(self.view.center)
    }

    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("webView load failed")
        self.view.hideToastActivity()
        self.view.makeToast("加载错误：\(error)")
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {

        if (navigationAction.navigationType == WKNavigationType.linkActivated) {
            UIApplication.shared.open(navigationAction.request.url!)
        }

        decisionHandler(.allow)
    }


    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webview finish loading")
        self.view.hideToastActivity()
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("webview didCommit")
    }

}
