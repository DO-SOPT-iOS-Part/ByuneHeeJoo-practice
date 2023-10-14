//
//  CrossViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/14.
//

import UIKit

final class CrossViewController: UIViewController {
    
    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    // 세로 스택뷰
    private let verticalFirstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let verticalSecondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    private func setLayout() {
        
        let width = UIScreen.main.bounds.width / 2
        let height = UIScreen.main.bounds.height / 4
        
        view.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        [verticalFirstStackView, verticalSecondStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            horizontalStackView.addArrangedSubview($0)
        }
              
        
        NSLayoutConstraint.activate(
            [horizontalStackView.topAnchor.constraint(equalTo: view.topAnchor),
             horizontalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        )
        
        [yellowView, blackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            verticalFirstStackView.addArrangedSubview($0)
            
            let whiteView = UIView()
            whiteView.backgroundColor = .white
            whiteView.translatesAutoresizingMaskIntoConstraints = false
            verticalFirstStackView.addArrangedSubview(whiteView)
        }
        
        [greenView, blueView].forEach {
            let whiteView = UIView()
            whiteView.backgroundColor = .white
            whiteView.translatesAutoresizingMaskIntoConstraints = false
            verticalSecondStackView.addArrangedSubview(whiteView)
            
            $0.translatesAutoresizingMaskIntoConstraints = false
            verticalSecondStackView.addArrangedSubview($0)
        }
    }
}
