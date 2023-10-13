//
//  UIImage+.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/13.
//

import UIKit

extension UIImage {
    // 버튼 안에 들어가는 이미지 사이즈 조정을 위한 함수
    func resize(targetSize: CGSize) -> UIImage? {
        let newRect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height).integral
        UIGraphicsBeginImageContextWithOptions(newRect.size, false, 0)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        context.interpolationQuality = .high
        draw(in: newRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
