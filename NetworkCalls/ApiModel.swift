//
//  ApiModel.swift
//  NetworkCalls
//
//  Created by Bengi Anıl on 3.12.2023.
//

import Foundation

struct GitHubUser: Codable {
    let login: String
    let avatar_url: String
    let bio: String
}
