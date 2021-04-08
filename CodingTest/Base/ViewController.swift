//
//  ViewController.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/5.
//

import Foundation

import UIKit

class ViewController: UIViewController {

    lazy var leftItemControl: UIControl = {
        $0.frame.size = CGSize(width: 44, height: 44)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(leftItemControlClick), for: .touchUpInside)

        let imageView = UIImageView()
        imageView.image = UIImage(named: "navgation_back")
        imageView.frame.size = CGSize(width: 10, height: 18)
        imageView.frame.origin.x = 0
        imageView.center.y = $0.center.y
        $0.addSubview(imageView)

        return $0
    }(UIControl())

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initalize()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalize()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = TSCOLOR_BG
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        if navigationController?.children.count ?? 0 > 1 {
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftItemControl)
        }
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)

    }

    private func initalize() {
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }

    @objc func leftItemControlClick() {
        back()
    }

    @objc open func back() {
        navigationController?.popViewController(animated: true)
    }

    func rootPushTo(vc: UIViewController) {
        var vcs:[UIViewController] = []
        if let viewControllers = navigationController?.viewControllers {
            vcs.append(viewControllers[0])
            vcs.append(vc)
            navigationController?.viewControllers = vcs
        }
    }

    @objc open func backHome() {
        navigationController?.popToRootViewController(animated: true)
    }

    open func showImagePickerActionSheet(delegate: (UIImagePickerControllerDelegate & UINavigationControllerDelegate)) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "拍照", style: .default) { (action) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .camera
            imagePickerController.delegate = delegate
            self.present(imagePickerController, animated: true)
        }
        let photoAction = UIAlertAction(title: "从相册选择照片", style: .default) { (action) in
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.delegate = delegate
            self.present(imagePickerController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .default) { (action) in
            alert.dismiss(animated: true) {

            }
        }

        alert.addAction(cameraAction)
        alert.addAction(photoAction)
        alert.addAction(cancelAction)
        alert.show()

    }

    func startLoading() {
        self.view.makeToastActivity(self.view.center)
    }

    func endLoading() {
        self.view.hideToastActivity()
    }

    func topSubView() -> UIView {
        guard let view = self.view.subviews.last else { return self.view }
        return view
    }

    func keyWindow() -> UIWindow {
        guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else{
            return UIWindow()

        }
        return window
    }

    open func mainWindow() -> UIWindow  {
        let window = UIWindow()
        if #available(iOS 13.0, *) {
            guard let scene = UIApplication.shared.connectedScenes.first,
                  let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
                  let _window = windowSceneDelegate.window else {
                return UIWindow()
            }
            return _window!
        } else {
            // Fallback on earlier versions
        }
        return window
    }
}
