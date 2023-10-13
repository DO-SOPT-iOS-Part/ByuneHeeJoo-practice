//
//  UILabel+.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/13.
//

import UIKit

extension UILabel {
    // 두 줄 사이의 간격을 조정하는 함수
    func setLineSpacing(spacing: CGFloat) {
        guard let text = text else { return }

        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
}
