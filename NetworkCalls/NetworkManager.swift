//
//  NetworkManager.swift
//  NetworkCalls
//
//  Created by Bengi Anıl on 3.12.2023.
//

import Foundation

class NetworkManager {
    
    func fetchData() async -> GitHubUser? {
        if let url = URL(string: "https://api.github.com/users/bengiianil") {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedData = try JSONDecoder().decode(GitHubUser.self, from: data)
                return decodedData
            } catch {
                fatalError()
            }
        }
        return nil
    }
}
