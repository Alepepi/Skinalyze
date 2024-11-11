//
//  ContentView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomepageView()
                .tabItem {
                    Image(systemName: "house.fill")
                }
            
            RecordsView()
                .tabItem {
                    Image(systemName: "book")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
    }
}

struct RecordsView: View {
    var body: some View {
        Text("Records")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

#Preview {
    ContentView()
}
