//
//  RegisterRequestBody.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/11/11.
//

import Foundation

struct RegisterRequestBody: Codable {
    let username: String
    let password: String
    let nickname: String
}
