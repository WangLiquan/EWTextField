//
//  UITextField+Extension.swift
//  Group
//
//  Created by 新用户 on 2018/8/5.
//  Copyright © 2018年 Chuangrong. All rights reserved.
//

import Foundation
import UIKit
var maxTextNumberDefault = 15

extension UITextField {
    /// 使用runtime给textField添加最大输入数属性,默认15
    var maxTextNumber: Int {
        set {
            objc_setAssociatedObject(self, &maxTextNumberDefault, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            if let max = objc_getAssociatedObject(self, &maxTextNumberDefault) as? Int {
                return max
            }
            return 15
        }
    }
    /// 添加判断数量方法
    func addChangeTextTarget() {
        self.addTarget(self, action: #selector(changeText), for: .editingChanged)
    }
    @objc func changeText() {
        //判断是不是在拼音状态,拼音状态不截取文本
        if let positionRange = self.markedTextRange {
            guard self.position(from: positionRange.start, offset: 0) != nil else {
                checkTextFieldText()
                return
            }
        } else {
            checkTextFieldText()
        }
    }
    /// 判断已输入字数是否超过设置的最大数.如果是则截取
    func checkTextFieldText() {
        guard (self.text?.length)! <= maxTextNumber  else {
            self.text = (self.text?.stringCut(end: maxTextNumber))!
            return
        }
    }
}

extension String {

    var length: Int {
        ///更改成其他的影响含有emoji协议的签名
        return self.utf16.count
    }

    /// 截取第一个到第任意位置
    ///
    /// - Parameter end: 结束的位值
    /// - Returns: 截取后的字符串
    func stringCut(end: Int) -> String {
        if !(end <= count) { return self }
        let sInde = index(startIndex, offsetBy: end)
        return String(self[..<sInde])
    }
}
