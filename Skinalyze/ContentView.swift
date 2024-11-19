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
        // Configuración global de la apariencia del Tab Bar
        let appearance = UITabBarAppearance()
        
        // Cambiar color para la selección de iconos y títulos
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color(hex: "#0D5C8B"))
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(Color(hex: "#0D5C8B"))]
        
        // Cambiar color para los iconos y títulos no seleccionados
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.gray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray]

        // Aplicar el estilo de la apariencia
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
        
    var body: some View {
            TabView {
                HomepageView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Scanner")
                    }
                
                SkinIssuesListView()
                    .tabItem {
                        Image(systemName: "books.vertical.fill")
                        Text("Catalogue")
                    }
                
                MedicinesListView()
                    .tabItem {
                        Image(systemName: "pills.fill")
                        Text("Medicines")
                    }
            }
        }
    }

#Preview {
    ContentView()
}
