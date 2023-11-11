//
//  CheckUserExist.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/11/11.
//

import Foundation

struct CheckUserExist: Codable {
    let isExist: Bool
    
    enum CodingKeys: CodingKey {
        case isExist
    }
}
