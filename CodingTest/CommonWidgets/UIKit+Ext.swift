//
//  UIKit+Ext.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import UIKit
import Foundation
//MARK: - UIView
extension UIView{
    static func custom_lineView()->UIView{
        let view = UIView()
        view.backgroundColor = TSCOLOR_LINE
        return view
    }
}
//MARK: - UILabel
extension UILabel{
    ///333颜色 12fontSize
    static func custom_label333F12(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_TEXT_333)
    }

    ///333颜色 14fontSize
    static func custom_label333F14(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 14), textColor: TSCOLOR_TEXT_333)
    }

    ///333颜色 16fontSize
    static func custom_label333F16(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 16), textColor: TSCOLOR_TEXT_333)
    }

    ///333颜色 20fontSize
    static func custom_label333F20(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 20), textColor: TSCOLOR_TEXT_333)
    }

    ///666颜色 12fontSize
    static func custom_label666F12(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_TEXT_666)
    }

    ///666颜色 14fontSize
    static func custom_label666F14(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 14), textColor: TSCOLOR_TEXT_666)
    }

    ///666颜色 16fontSize
    static func custom_label666F16(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 16), textColor: TSCOLOR_TEXT_666)
    }

    ///666颜色 18fontSize
    static func custom_label666F18(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 18), textColor: TSCOLOR_TEXT_666)
    }


    ///999颜色 18fontSize
    static func custom_label999F18(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 18), textColor: TSCOLOR_TEXT_999)
    }

    ///999颜色 16fontSize
    static func custom_label999F16(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 16), textColor: TSCOLOR_TEXT_999)
    }


    ///999颜色 14fontSize
    static func custom_label999F14(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 14), textColor: TSCOLOR_TEXT_999)
    }

    ///999颜色 12fontSize
    static func custom_label999F12(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_TEXT_999)
    }

    ///999颜色 10fontSize
    static func custom_label999F10(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 10), textColor: TSCOLOR_TEXT_999)
    }

    ///orange颜色 24fontSize
    static func custom_labelBlueF24(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 24), textColor: TSCOLOR_BLUE)
    }

    ///orange颜色 16fontSize
    static func custom_labelBlueF16(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 16), textColor: TSCOLOR_BLUE)
    }

    ///orange颜色 14fontSize
    static func custom_labelBlueF14(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 14), textColor: TSCOLOR_BLUE)
    }

    static func custom_labelBlueF12(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_BLUE)
    }

    ///orange颜色 18fontSize
    static func custom_labelBlueF18(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 18), textColor: TSCOLOR_BLUE)
    }

    static func custom_labelC4C412(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_C4C4)
    }

    static func custom_label131312(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_TEXT_1313)
    }

    static func custom_labelRedF14(text: String = "")->UILabel{
        return self.custom_label(text: text, font: UIFont.systemFont(ofSize: 14), textColor: TSCOLOR_TEXT_RED)
    }


    static func custom_label(text: String, font: UIFont, textColor: UIColor)->UILabel{
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        return label
    }
}

//MARK: - UITextField
extension UITextField{
    static func custom_textfield(placeholder: String="",font: UIFont = UIFont.systemFont(ofSize: 14))->UITextField{
        let field = UITextField()
        field.font = font
        field.placeholder = placeholder
        return field
    }

    static func custom_textfieldRightAlign(placeholder: String="",fontSize:CGFloat  = 14)->UITextField{
        let field = UITextField()
        field.textAlignment = .right
        field.font = UIFont.systemFont(ofSize: fontSize)
        field.placeholder = placeholder
        return field
    }



}

//MARK: - UIButton
extension UIButton{
    static func custom_button333F16(text: String)->UIButton{
        return self.custom_button(text: text, font: UIFont.systemFont(ofSize: 16), textColor: TSCOLOR_TEXT_333)
    }
    ///字体颜色666字号12，背景透明
    static func custom_button666F12(text: String)->UIButton{
        return self.custom_button(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_TEXT_666)
    }

    ///字体颜色999字号12，背景透明
    static func custom_button999F12(text: String)->UIButton{
        return self.custom_button(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_TEXT_999)
    }

    ///背景色666字号16
    static func custom_buttonDarkBgF16(text: String)->UIButton{
        let button = self.custom_button(text: text, font: UIFont.systemFont(ofSize: 16), textColor: .white,bgColor: TSCOLOR_TEXT_666)
        button.clipsToBounds = true
        TSViewRadius(button, 8)
        return button
    }


    ///橙色背景字号16
    static func custom_buttonBlueBg(text:String)->UIButton{
        let button = self.custom_button(text: text, font: UIFont.systemFont(ofSize: 16), textColor: .white,bgColor: TSCOLOR_BTN_BLUE)
        TSViewRadius(button, 8)
        return button
    }

    static func custom_buttonBlueBg(text:String, fontSize: CGFloat)->UIButton{
        let button = self.custom_button(text: text, font: UIFont.systemFont(ofSize: fontSize), textColor: .white,bgColor: TSCOLOR_BTN_BLUE)
        TSViewRadius(button, 8)
        return button
    }

    static func custom_buttonRedBg(text:String)->UIButton{
        let button = self.custom_button(text: text, font: UIFont.systemFont(ofSize: 16), textColor: .white,bgColor: TSCOLOR_BTN_RED)
        TSViewRadius(button, 8)
        return button
    }

    ///橙色文字，字号12
    static func custom_buttonBlueTextF12(text:String)->UIButton{
        let button = self.custom_button(text: text, font: UIFont.systemFont(ofSize: 12), textColor: TSCOLOR_BLUE)
        TSViewRadius(button, 8)
        return button
    }

    static func custom_button(text: String, font: UIFont, textColor: UIColor, bgColor: UIColor = .clear)->UIButton{
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.backgroundColor = bgColor
        button.titleLabel?.font = font
        return button
    }
}
