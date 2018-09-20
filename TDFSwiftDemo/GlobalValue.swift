//
//  GlobalValue.swift
//  TDFSwiftDemo
//
//  Created by 汤丹峰 on 2018/6/29.
//  Copyright © 2018年 tangdanfeng. All rights reserved.
//

import Foundation
import UIKit

//屏幕宽高
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

////手机屏幕判断
let kIsIpad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
let kIsIphone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
let kIsRetina = UIScreen.main.scale >= 2.0

let kIsIphone4OrLess = kIsIphone && kScreenHeight < 568.0
let kIsIphone5 = kIsIphone && kScreenHeight == 568.0
let kIsIphone6 = kIsIphone && kScreenHeight == 667.0
let kIsIphone6P = kIsIphone && kScreenHeight == 736.0
let kIsIphoneX = kIsIphone && kScreenHeight == 812.0

//尺寸比例
let kScaleX = kScreenWidth/375.0
let kScaleY = kScreenHeight/667.0

let kBottomSafeHeight: CGFloat = kIsIphoneX ? 34.0 : 0
let kBottomTabHeight: CGFloat = 49.0
let kBottomSystemHeight: CGFloat = kBottomSafeHeight + kBottomTabHeight
let kTopStatusbarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
let kTopNavHeight: CGFloat = 44.0
let kTopSystemHeight: CGFloat = kTopStatusbarHeight + kTopNavHeight

//RGB颜色
func TDFColorFromRGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
    return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
func TDFColorFromRGBA(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
     return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
}

func TDFColor(_ rgbValue: UInt) -> UIColor {
    return UIColor.init(red: (CGFloat((rgbValue & 0xFF0000) >> 16))/255.0, green: (CGFloat((rgbValue & 0xFF00) >> 8))/255.0, blue: (CGFloat(rgbValue & 0xFF))/255.0, alpha: 1.0)
    
}
func TDFColorA(_ rgbValue: UInt, _ alpha: CGFloat) -> UIColor {
    return UIColor.init(red: (CGFloat((rgbValue & 0xFF0000) >> 16))/255.0, green: (CGFloat((rgbValue & 0xFF00) >> 8))/255.0, blue: (CGFloat(rgbValue & 0xFF))/255.0, alpha: alpha)
    
}

//随机色
func TDFRandomColor() -> UIColor {
    return TDFColorFromRGB((CGFloat)(arc4random_uniform(256)), (CGFloat)(arc4random_uniform(256)), (CGFloat)(arc4random_uniform(256)))
}

