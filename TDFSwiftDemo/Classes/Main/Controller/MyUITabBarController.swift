//
//  MyUITabBarController.swift
//  TDFSwiftDemo
//
//  Created by 汤丹峰 on 2018/6/29.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

import UIKit

class MyUITabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeVC()
        self.addChildVc(childVc: homeVC, title: "首页", image: "tabbar_home", selImage: "tabbar_home_sel")
        let meVC = MeVC()
        self.addChildVc(childVc: meVC, title: "我的", image: "tabbar_me", selImage: "tabbar_me_sel")
        
    }
    
    func addChildVc(childVc: UIViewController, title: String, image: String, selImage: String)  {
        childVc.title = title
        
        childVc.tabBarItem.image = UIImage.init(named: image)
        childVc.tabBarItem.selectedImage = UIImage.init(named: selImage)
        
        let textAttrs = [NSAttributedStringKey.foregroundColor : kColorFromValue(0x929292)]
        let selectedTextAttrs = [NSAttributedStringKey.foregroundColor : kColorFromValue(0x4c90f2)]
        childVc.tabBarItem.setTitleTextAttributes(textAttrs, for: UIControlState.normal)
        childVc.tabBarItem.setTitleTextAttributes(selectedTextAttrs, for: UIControlState.selected)
        
        let nc = BaseUINavigationController.init(rootViewController: childVc)
        self.addChildViewController(nc)
    }
}
