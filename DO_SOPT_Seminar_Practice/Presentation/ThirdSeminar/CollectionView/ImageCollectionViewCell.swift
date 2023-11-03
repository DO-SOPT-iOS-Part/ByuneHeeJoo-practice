//
//  ImageCollectionViewCell.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/10/28.
//

import UIKit

import SnapKit
import Then

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

final class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ImageCollectionViewCell"
    weak var delegate: ItemSelectedProtocol?
    private var itemRow: Int?

    private let imageView = UIImageView()
    private lazy var likeButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindData(data: ImageCollectionData, row: Int) {
        self.imageView.image = UIImage(named: data.image)
        self.likeButton.isSelected = data.isLiked
        self.itemRow = row
    }
    
    private func setStyle() {
        likeButton.do {
            $0.setImage(UIImage(systemName: "heart"), for: .normal)
            $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
            $0.addTarget(self, action: #selector(likeButtonTap),
                         for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        [imageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    @objc
    private func likeButtonTap() {
        self.likeButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.getButtonState(state: self.likeButton.isSelected, row: itemRow)
        }
    }
    
}
