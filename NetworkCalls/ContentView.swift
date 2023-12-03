//
//  ContentView.swift
//  NetworkCalls
//
//  Created by Bengi Anıl on 3.12.2023.
//

import SwiftUI

struct ContentView: View {
    private let networkManager = NetworkManager()
    @State var user: GitHubUser?

    var body: some View {
        VStack(spacing: 20) {
            if let user = user {
                let imageUrl = URL(string: user.avatar_url)
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(.circle)
                } placeholder: {
                    Circle()
                        .foregroundStyle(.secondary)
                }
                .frame(width: 120, height: 120)
                
                Text(user.login)
                    .font(.title3)
                    .bold()
                
                Text(user.bio)
                    .padding()
                
                Spacer()
            }
        }
        .task {
            user = await networkManager.fetchData()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
