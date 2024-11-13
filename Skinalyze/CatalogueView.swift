//
//  CatalogueView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 13/11/24.
//

import SwiftUI

// Model for a Skin Issue
struct SkinIssue: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var symptoms: String
    var causes: String
}

// Sample data for Skin Issues
let sampleSkinIssues = [
    SkinIssue(name: "Eczema", description: "A condition that causes inflamed, itchy skin.", symptoms: "Redness, itching, dry skin", causes: "Allergies, stress, irritants"),
    SkinIssue(name: "Psoriasis", description: "A disease that causes red, scaly patches on the skin.", symptoms: "Red patches, scaling, itching", causes: "Genetics, immune system"),
    SkinIssue(name: "Acne", description: "A skin condition that causes pimples and blemishes.", symptoms: "Pimples, blackheads, whiteheads", causes: "Hormones, bacteria, clogged pores")
]

// Main View
struct SkinIssuesView: View {
    var skinIssues = sampleSkinIssues
    @State private var searchText = ""
    
    var filteredSkinIssues: [SkinIssue] {
        skinIssues.filter { searchText.isEmpty || $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            List(filteredSkinIssues) { issue in
                NavigationLink(destination: SkinIssueDetailView(issue: issue)) {
                    SkinIssueRow(issue: issue)
                }
            }
            .navigationTitle("Skin Issues")
            .searchable(text: $searchText, prompt: "Search issues")
        }
    }
}

// Row View for each Skin Issue (Text aligned to the left)
struct SkinIssueRow: View {
    var issue: SkinIssue
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                Text(issue.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(issue.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2) // Ensures that the description doesn't extend too far
            }
            .padding(.vertical, 8)
        }
    }
}

// Detailed View for each Skin Issue
struct SkinIssueDetailView: View {
    var issue: SkinIssue
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(issue.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Symptoms")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Text(issue.symptoms)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Text("Causes")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 10)
                
                Text(issue.causes)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle(issue.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesView()
    }
}
