//
//  CareTipsView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 19/11/24.
//

import SwiftUI

// MARK: - Modelo para los Tips
struct Tip: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let relatedIssues: [String] // Lista de severidades relacionadas
}

// MARK: - Datos de ejemplo
let sampleTips = [
    Tip(title: "Stay Hydrated", description: "Drink plenty of water to help your skin stay healthy and hydrated.", relatedIssues: ["Mild", "Moderate"]),
    Tip(title: "Use Sunscreen", description: "Protect your skin by applying sunscreen daily, even on cloudy days.", relatedIssues: ["Hazardous", "Severe"]),
    Tip(title: "Avoid Scratching", description: "Resist the urge to scratch affected areas to prevent worsening the condition.", relatedIssues: ["All"]),
    Tip(title: "Consult a Doctor", description: "Seek medical advice for severe or persistent issues.", relatedIssues: ["Severe", "Fatal"])
]

// MARK: - Vista principal de la lista de Tips
struct TipsListView: View {
    var tips = sampleTips
    @State private var searchText = "" // Para buscar tips
    @State private var selectedIssue: String = "All" // Para filtrar por tipo de issue
    
    let issueCategories = ["All", "Mild", "Moderate", "Hazardous", "Severe", "Fatal"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Barra de búsqueda y filtro
                HStack {
                    // Barra de búsqueda
                    TextField("Search tips...", text: $searchText)
                        .padding(9)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .frame(height: 3)

                    Spacer()
                        .frame(width: 20)
                    
                    // Menú de selección de categoría
                    Menu {
                        ForEach(issueCategories, id: \.self) { category in
                            Button(action: {
                                selectedIssue = category
                            }) {
                                Text(category)
                            }
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            .font(.title)
                            .padding(.trailing)
                    }
                }
                .padding(.horizontal)
                
                // Título de la sección
                Text("Tips for Skin Issues")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                // Lista de tips
                List(filteredTips) { tip in
                    NavigationLink(destination: TipDetailView(tip: tip)) {
                        TipRow(tip: tip)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
    
    // Filtrar los tips según texto de búsqueda y categoría
    private var filteredTips: [Tip] {
        tips.filter { tip in
            let matchesSearchText = searchText.isEmpty || tip.title.lowercased().contains(searchText.lowercased()) ||
                                    tip.description.lowercased().contains(searchText.lowercased())
            let matchesIssue = selectedIssue == "All" || tip.relatedIssues.contains(selectedIssue)
            return matchesSearchText && matchesIssue
        }
    }
}

// MARK: - Vista de detalles de un Tip
struct TipDetailView: View {
    var tip: Tip
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(tip.title)
                .font(.largeTitle)
                .bold()
            
            Text(tip.description)
                .font(.body)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Tip Details")
    }
}

// MARK: - Vista de una fila en la lista
struct TipRow: View {
    var tip: Tip
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(tip.title)
                    .font(.headline)
                Text(tip.description)
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Previews
struct TipsListView_Previews: PreviewProvider {
    static var previews: some View {
        TipsListView()
    }
}

struct TipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TipDetailView(tip: sampleTips[0])
    }
}

struct TipRow_Previews: PreviewProvider {
    static var previews: some View {
        TipRow(tip: sampleTips[0])
            .previewLayout(.sizeThatFits) // Ajusta la vista para verla en diferentes tamaños
            .padding()
    }
}

// MARK: - Punto de entrada de la App
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            TipsListView() // Llamar a la vista principal
        }
    }
}
