//
//  CommonHelper.swift
//  EWDatePicker
//
//  Created by Ethan.Wang on 2018/8/27.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import Foundation
import UIKit

struct ScreenInfo {
    static let Frame = UIScreen.main.bounds
    static let Height = Frame.height
    static let Width = Frame.width
    static let navigationHeight:CGFloat = navBarHeight()

    static func isIphoneX() -> Bool {
        return UIScreen.main.bounds.equalTo(CGRect(x: 0, y: 0, width: 375, height: 812))
    }
    static private func navBarHeight() -> CGFloat {
        return isIphoneX() ? 88 : 64
    }
}
//便捷的类方法
extension UIColor {
    class func colorWithRGBA(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}
// swiftlint:disable identifier_name
extension UIColor {

    @nonobjc static let x666666 = UIColor.colorWithRGBA(red: 102, green: 102, blue: 102, alpha: 1)

    @nonobjc static let x333333 = UIColor.colorWithRGBA(red: 51, green: 51, blue: 51, alpha: 1)

    @nonobjc static let x4FB0FF = UIColor.colorWithRGBA(red: 79, green: 176, blue: 255, alpha: 1)

    @nonobjc static let x333333_alpha40 = UIColor.colorWithRGBA(red: 51, green: 51, blue: 51, alpha: 0.4)

}
