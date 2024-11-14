//
//  CatalogueView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 13/11/24.
//

import SwiftUI

// MARK: - Model for Skin Issues
struct SkinIssue: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let symptoms: [String]
    let causes: String
    let treatments: String
    let severity: String
}

// Sample data for testing
let sampleSkinIssues = [
    SkinIssue(name: "Acne", description: "A common skin condition causing pimples.", symptoms: ["Pimples", "Blackheads", "Whiteheads"], causes: "Blocked pores, excess oil, bacteria.", treatments: "Topical treatments, oral medication.", severity: "Leve"),
    SkinIssue(name: "Eczema", description: "A condition causing itchy, inflamed skin.", symptoms: ["Dry skin", "Itching", "Red patches"], causes: "Genetics, immune system issues.", treatments: "Moisturizers, steroid creams.", severity: "Moderado"),
    SkinIssue(name: "Psoriasis", description: "A chronic autoimmune condition causing skin cells to build up rapidly.", symptoms: ["Red patches", "Itching", "Scales"], causes: "Genetic factors, immune system issues.", treatments: "Topical treatments, light therapy.", severity: "Peligroso"),
    SkinIssue(name: "Melanoma", description: "A type of skin cancer that can spread rapidly.", symptoms: ["New mole", "Change in existing mole", "Itching"], causes: "UV exposure, genetics.", treatments: "Surgery, radiation therapy.", severity: "Mortal"),
    SkinIssue(name: "Rosacea", description: "A condition causing redness and visible blood vessels in the face.", symptoms: ["Facial redness", "Pimples", "Swelling"], causes: "Genetic factors, environmental triggers.", treatments: "Topical creams, laser therapy.", severity: "Moderado"),
    SkinIssue(name: "Cold Sores", description: "Blisters that appear around the mouth, caused by the herpes simplex virus.", symptoms: ["Blisters", "Itching", "Burning sensation"], causes: "Herpes simplex virus (HSV-1).", treatments: "Antiviral creams, oral medications.", severity: "Leve"),
    SkinIssue(name: "Chickenpox", description: "A contagious viral infection that causes an itchy rash with red spots.", symptoms: ["Itchy rash", "Fever", "Fatigue"], causes: "Varicella-zoster virus.", treatments: "Calamine lotion, antihistamines.", severity: "Moderado"),
    SkinIssue(name: "Shingles", description: "A painful rash caused by the reactivation of the chickenpox virus.", symptoms: ["Painful rash", "Blisters", "Itching"], causes: "Varicella-zoster virus.", treatments: "Antiviral drugs, pain relievers.", severity: "Peligroso"),
    SkinIssue(name: "Basal Cell Carcinoma", description: "A type of skin cancer that typically grows slowly and rarely spreads.", symptoms: ["Painless lump", "Ulcerated sore", "Bleeding"], causes: "UV exposure, sun damage.", treatments: "Surgical removal, radiation therapy.", severity: "Peligroso"),
    SkinIssue(name: "Fungal Infection", description: "An infection caused by fungi that affects the skin.", symptoms: ["Red, itchy patches", "Scaly skin", "Blisters"], causes: "Fungal spores", treatments: "Antifungal creams, oral antifungal medications.", severity: "Leve")
]

// MARK: - Row View for Each Skin Issue
struct SkinIssueRow: View {
    let issue: SkinIssue

    // Function to get icon and color based on severity level
    private func severityIconAndColor(for severity: String) -> (String, Color) {
        switch severity {
        case "Leve":
            return ("checkmark.circle", .green)
        case "Moderado":
            return ("exclamationmark.circle", .yellow)
        case "Peligroso":
            return ("exclamationmark.triangle", .orange)
        case "Severo":
            return ("exclamationmark.octagon", .red)
        case "Mortal":
            return ("xmark.octagon", .red)
        default:
            return ("questionmark.circle", .gray)
        }
    }

    var body: some View {
        HStack {
            // Severity icon
            let (icon, color) = severityIconAndColor(for: issue.severity)
            Image(systemName: icon)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(color)

            VStack(alignment: .leading) {
                Text(issue.name)
                    .font(.headline)
                Text(issue.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 8)
        }
        .padding()
    }
}

// Preview for SkinIssueRow
struct SkinIssueRow_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssueRow(issue: sampleSkinIssues[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

// MARK: - Detail View for Each Skin Issue
struct SkinIssueDetailView: View {
    let issue: SkinIssue

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Title
                Text(issue.name)
                    .font(.largeTitle)
                    .bold()

                // Severity icon and description
                let (icon, color) = severityIconAndColor(for: issue.severity)
                HStack {
                    Image(systemName: icon)
                        .foregroundColor(color)
                    Text(issue.severity)
                        .font(.title3)
                        .foregroundColor(color)
                }

                // Description section
                Text("Description")
                    .font(.title2)
                    .bold()
                Text(issue.description)

                // Symptoms section
                Text("Symptoms")
                    .font(.title2)
                    .bold()
                ForEach(issue.symptoms, id: \.self) { symptom in
                    Text("• \(symptom)")
                }

                // Causes section
                Text("Causes")
                    .font(.title2)
                    .bold()
                Text(issue.causes)

                // Treatments section
                Text("Treatments")
                    .font(.title2)
                    .bold()
                Text(issue.treatments)
            }
            .padding()
        }
        .navigationTitle(issue.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    // Helper function for icon and color in detail view
    private func severityIconAndColor(for severity: String) -> (String, Color) {
        switch severity {
        case "Mild":
            return ("checkmark.circle", .green)
        case "Moderate":
            return ("exclamationmark.circle", .yellow)
        case "Hazardous":
            return ("exclamationmark.triangle", .orange)
        case "Severe":
            return ("exclamationmark.octagon", .red)
        case "Fatal":
            return ("xmark.octagon", .red)
        default:
            return ("questionmark.circle", .gray)
        }
    }
}

// Preview for SkinIssueDetailView
struct SkinIssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SkinIssueDetailView(issue: sampleSkinIssues[0])
        }
    }
}

// MARK: - Main List View for Skin Issues
struct SkinIssuesListView: View {
    var issues = sampleSkinIssues

    var body: some View {
        NavigationView {
            VStack(spacing: 20) { // Add space between title and list
                Text("Skin Issues")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)

                List(issues) { issue in
                    NavigationLink(destination: SkinIssueDetailView(issue: issue)) {
                        SkinIssueRow(issue: issue)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(true) // Hide default navigation title
        }
    }
}

// Preview for SkinIssuesListView
struct SkinIssuesListView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssuesListView()
    }
}

// MARK: - App Entry Point
struct SkinScannerApp: App {
    var body: some Scene {
        WindowGroup {
            SkinIssuesListView()
        }
    }
}
