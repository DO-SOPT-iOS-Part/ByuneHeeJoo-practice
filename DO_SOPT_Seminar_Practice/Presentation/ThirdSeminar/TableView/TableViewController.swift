//
//  TableViewController.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/28.
//

import UIKit

import SnapKit
import Then

final class TableViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        setTableViewConfig()
    }
    
    private func setStyle() {
        tableView.do {
            $0.backgroundColor = .init(red: 33.0 / 255.0,
                                       green: 33.0 / 255.0,
                                       blue: 33.0 / 255.0,
                                       alpha: 1.0)
            $0.separatorColor = .lightGray
            $0.separatorStyle = .singleLine
        }
    }
    
    private func setLayout() {
        self.view.addSubviews(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setTableViewConfig() {
        self.tableView.register(ItemListTableViewCell.self,
                                forCellReuseIdentifier: ItemListTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
}

extension TableViewController: UITableViewDelegate {}
extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier, for: indexPath) as? ItemListTableViewCell else {return UITableViewCell()}
        cell.likeTapCompletion = { state in
            itemListData[indexPath.row].isLike = state
        }
        cell.bindData(data: itemListData[indexPath.row])
        return cell
    }
}
