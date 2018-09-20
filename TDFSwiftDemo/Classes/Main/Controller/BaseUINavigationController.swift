//
//  BaseUINavigationController.swift
//  TDFSwiftDemo
//
//  Created by 汤丹峰 on 2018/6/29.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

import UIKit

class BaseUINavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count>0 {
            viewController.hidesBottomBarWhenPushed = true;
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named:"返回")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backAction))
        }
        super.pushViewController(viewController, animated: animated)
        viewController.navigationController?.navigationBar.isTranslucent = false
    }
    @objc func backAction() {
        self .popViewController(animated: true)
    }
}
