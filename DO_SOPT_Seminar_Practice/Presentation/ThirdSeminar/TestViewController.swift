//
//  TestViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/28.
//

import UIKit

import SnapKit
import Then

final class TestViewController: UIViewController {
    
    private let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        blueView.do {
            $0.backgroundColor = .systemBlue
        }
    }
    
    private func setLayout() {
        self.view.addSubview(blueView)

        blueView.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    
}
