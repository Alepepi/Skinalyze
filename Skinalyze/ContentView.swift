//
//  ContentView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 11/11/24.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hexString = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
        
        let scanner = Scanner(string: hexString)
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct ContentView: View {
    init() {
            let appearance = UITabBarAppearance()
            UITabBar.appearance().scrollEdgeAppearance = appearance
        
            appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color(hex: "#0D5C8B"))
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color(hex: "#0D5C8B"))]
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
