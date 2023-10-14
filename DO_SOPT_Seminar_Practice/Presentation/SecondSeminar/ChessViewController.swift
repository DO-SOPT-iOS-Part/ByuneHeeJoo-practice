//
//  ViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/14.
//

import UIKit

final class ChessViewController: UIViewController {

    private var 바둑알1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private var 바둑알2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private var 방어막: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        view.backgroundColor = .blue
        view.clipsToBounds = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
    }
    
    private func setLayout() {
        [바둑알1, 바둑알2, 방어막].forEach { [weak self] view in
            guard let self else {return}
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate(
            [바둑알1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
             바둑알1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
             바둑알1.widthAnchor.constraint(equalToConstant: 20),
             바둑알1.heightAnchor.constraint(equalToConstant: 20)]
        )
        
        NSLayoutConstraint.activate(
            [바둑알2.topAnchor.constraint(equalTo: self.바둑알1.bottomAnchor, constant: 40),
             바둑알2.leadingAnchor.constraint(equalTo: self.바둑알1.trailingAnchor, constant: 40),
             바둑알2.widthAnchor.constraint(equalToConstant: 20),
             바둑알2.heightAnchor.constraint(equalToConstant: 20)]
        )
        
        NSLayoutConstraint.activate(
            [방어막.topAnchor.constraint(equalTo: self.바둑알2.bottomAnchor, constant: 20),
             방어막.leadingAnchor.constraint(equalTo: self.바둑알2.trailingAnchor, constant: 20),
             방어막.widthAnchor.constraint(equalToConstant: 60),
             방어막.heightAnchor.constraint(equalToConstant: 20)]
        )
    }

}
