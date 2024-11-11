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
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Vista de Perfil")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Vista de Ajustes")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
    }
}

#Preview {
    ContentView()
}
