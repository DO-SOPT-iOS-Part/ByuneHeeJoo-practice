//
//  UserInfoDataModel.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/11/11.
//

import Foundation

// MARK: - UserInfoDataModel
struct UserInfoDataModel: Codable {
    let username, nickname: String
    
    enum CodingKeys: CodingKey {
        case username
        case nickname
    }
}
