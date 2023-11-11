//
//  CheckUserExistService.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/11/11.
//

import Foundation

class CheckUserExistService {
    static let shared = CheckUserExistService()
    private init() {}
    
    func makeRequest(userName: String) -> URLRequest {
        // URL 인코딩
        guard let encodedUserName = userName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            fatalError("Failed to encode username")
        }

        let urlString = "http://3.39.54.196:8080/api/v1/members/check?username=\(encodedUserName)"
        
        // URL 생성
        guard let url = URL(string: urlString) else {
            fatalError("Failed to create URL")
        }

        // URLRequest 생성
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // 헤더 추가
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return request
    }

    
    func GetRegisterData(userName: String) async throws -> CheckUserExist? {
        do {
            let request = self.makeRequest(userName: userName)
            let (data, response) = try await URLSession.shared.data(for: request)
            dump(request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.responseError
            }
            dump(response)
            return parseCheckUserExist(data: data)
        } catch {
            throw error
        }
        
    }
    
    
    private func parseCheckUserExist(data: Data) -> CheckUserExist? {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode(CheckUserExist.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode)
        ?? NetworkError.unknownError
    }
    
}
