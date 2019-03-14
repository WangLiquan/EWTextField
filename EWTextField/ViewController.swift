//
//  ViewController.swift
//  EWTextField
//
//  Created by Ethan.Wang on 2018/8/31.
//  Copyright © 2018年 Ethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let phoneTF : CRTextField = {
        let textField = CRTextField(frame: CGRect(x: 24, y: 150, width: ScreenInfo.Width - 48, height: 35), isSecure: false)
        textField.label.text = "手机号"
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.clearButtonMode = .always
        textField.maxTextNumber = 11
        textField.keyboardType = .phonePad
        return textField
    }()
    let passwordTF : CRTextField = {
        let textField = CRTextField(frame: CGRect(x: 24, y: 210, width: ScreenInfo.Width - 48, height: 35), isSecure: true)
        textField.label.text = "密码"
        textField.maxTextNumber = 15
        textField.font = UIFont.systemFont(ofSize: 18)
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(phoneTF)
        self.view.addSubview(passwordTF)
        phoneTF.delegate = self
        passwordTF.delegate = self
    }

    /// 点击任意位置取消第一响应,弹回键盘
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard let textField = textField as? CRTextField else {
            return true
        }
        if textField.text == ""{
            textField.changeLabel()
        }
        textField.changeLineHidden()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let textField = textField as? CRTextField else {
            return
        }
        if textField.text == "" {
            textField.disChangeLabel()
        }
        textField.changeLineHidden()
    }
}
