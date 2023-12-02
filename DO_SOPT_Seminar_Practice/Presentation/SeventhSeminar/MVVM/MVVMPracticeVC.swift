//
//  MVCPracticeVC.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/12/02.
//

import UIKit

import SnapKit
import Then

class MVVMPracticeVC: UIViewController {
    var viewModel = MVVMPracticeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLayout()
        self.bindViewModel()
    }
    
    private func setLayout() {
        [tableView, randomButton].forEach {
            self.view.addSubview($0)
        }
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        randomButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    private func bindViewModel() {
        self.tableView.dataSource = viewModel
    }
    
    @objc private func randomButtonTap() {
        if viewModel.randomButtonTap() {
            self.tableView.reloadData()
        }
    }
    
    private lazy var randomButton = UIButton().then {
        $0.setTitle("두근두근 뽑기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget(self,
                     action: #selector(randomButtonTap),
                     for: .touchUpInside)
        $0.backgroundColor = .blue
    }
    
    private lazy var tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(CustomTVC.self, forCellReuseIdentifier: CustomTVC.identifier)
    }
}
