//
//  NetworkManager.swift
//  NetworkCalls
//
//  Created by Bengi Anıl on 3.12.2023.
//

import Foundation

enum AppError: Error {
    case invalidUrl
    case invalidResponse
    case invalidData
}

class NetworkManager {
    
    func fetchData() async throws -> GitHubUser? {
        guard let url = URL(string: "https://api.github.com/users/bengiianil") else {
            print("Invalid Url")
            throw AppError.invalidUrl
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                print("Invalid Response")
                throw AppError.invalidResponse
            }
            
            let decodedData = try JSONDecoder().decode(GitHubUser.self, from: data)
            return decodedData
        } catch {
            print("Invalid Data")
            throw AppError.invalidData
        }
    }
}
