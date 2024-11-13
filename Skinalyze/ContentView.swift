//
//  ContentView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = .white
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            TabView {
                HomepageView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                RecordsView()
                    .tabItem {
                        Image(systemName: "book")
                        Text("Records")
                    }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
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
