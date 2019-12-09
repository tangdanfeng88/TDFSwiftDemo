//
//  HomeVC.swift
//  TDFSwiftDemo
//
//  Created by 汤丹峰 on 2018/6/29.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

import UIKit

class HomeVC: BaseUIViewController {
    var btnArr = Array<UIButton>()
    var itemArr = Array<Dictionary<String, String>>()
    
    //在类中有一个专用的关键字 class，用来定义可被子类重写的计算属性
    public class var AppName: String {
        let nameKey = "CFBundleName"
        let appName = Bundle.main.object(forInfoDictionaryKey: nameKey) as? String
        return appName!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for btn in btnArr {
            btn.backgroundColor = kRandomColor()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = kColorFromValue(0xffffff)
        
        itemArr = [["title":"BigImage旋转缩放", "action":"BigImageRoateScaleVC"]]
        
        self.setupView()
    }
    
    func setupView() {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight-kTopSystemHeight-kBottomSystemHeight))
        self.view.addSubview(scrollView)
        
        let magin = 10*kScaleX
        let dw = (kScreenWidth-4*magin)*0.333
        let dh = 50*kScaleX
        for (i, itemDict) in itemArr.enumerated() {
            let btn = UIButton(frame: CGRect(x: magin+CGFloat(i%3)*(dw+magin), y: magin+CGFloat(i/3)*(dh+magin), width: dw, height: dh))
            btn.tag = i;
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14*kScaleX)
            btn.titleLabel?.numberOfLines = 0
            btn.backgroundColor = kRandomColor()
            btn.setTitle(itemDict["title"], for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
            scrollView.addSubview(btn)
            btnArr.append(btn)
        }
    }
    @objc func btnAction(_ button: UIButton) {
        let vcName: String = (itemArr[button.tag] as NSDictionary)["action"] as! String
        let actualName = HomeVC.AppName + "." + vcName
        let vcClass: AnyClass? = NSClassFromString(actualName)
        let vc = (vcClass as! NSObject.Type).init()
        self.navigationController?.pushViewController(vc as! UIViewController, animated: true)
    }
}
