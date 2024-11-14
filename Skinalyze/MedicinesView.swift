//
//  MedicinesView.swift
//  Skinalyze
//
//  Created by Frida Pérez Perfecto on 13/11/24.
//

import SwiftUI

// MARK: - Model for Medicines
struct MedicinesView: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let uses: [String]
    let sideEffects: String
    let dosage: String
    let classification: String
    let imageName: String?
}

// Sample data for testing
let sampleMedicines = [
    MedicinesView(name: "Ibuprofen", description: "A common pain reliever and anti-inflammatory.", uses: ["Pain relief", "Fever reduction", "Inflammation reduction"], sideEffects: "Stomach pain, nausea, dizziness.", dosage: "200-400 mg every 4-6 hours.", classification: "OTC", imageName: "ibuprofen1"),
    MedicinesView(name: "Amoxicillin", description: "An antibiotic used to treat bacterial infections.", uses: ["Bacterial infections", "Sinusitis", "Pneumonia"], sideEffects: "Diarrhea, nausea, skin rash.", dosage: "500 mg every 8 hours.", classification: "Prescription", imageName: "ibuprofen1"),
    MedicinesView(name: "Metformin", description: "Medication for managing type 2 diabetes.", uses: ["Blood sugar control", "Type 2 diabetes management"], sideEffects: "Nausea, stomach upset, diarrhea.", dosage: "500-1000 mg daily.", classification: "Prescription", imageName: "ibuprofen1"),
    MedicinesView(name: "Methadone", description: "A synthetic opioid used to treat opioid addiction and severe pain.", uses: ["Opioid addiction", "Severe pain relief"], sideEffects: "Dizziness, nausea, constipation.", dosage: "10-80 mg daily.", classification: "Restricted", imageName: "ibuprofen1"),
    MedicinesView(name: "Cetirizine", description: "An antihistamine for allergy relief.", uses: ["Allergy relief", "Itching reduction", "Runny nose relief"], sideEffects: "Drowsiness, dry mouth, fatigue.", dosage: "10 mg once daily.", classification: "OTC", imageName: "ibuprofen1"),
    MedicinesView(name: "Clonazepam", description: "A medication used to treat seizure disorders and panic attacks.", uses: ["Seizures", "Panic attacks"], sideEffects: "Drowsiness, dizziness, memory problems.", dosage: "0.5-2 mg daily.", classification: "Controlled", imageName: "ibuprofen1"),
    MedicinesView(name: "Aspirin", description: "A medication used for pain relief, inflammation, and fever reduction.", uses: ["Pain relief", "Fever reduction", "Heart disease prevention"], sideEffects: "Stomach irritation, nausea, ulcers.", dosage: "81-325 mg daily.", classification: "OTC", imageName: "ibuprofen1"),
    MedicinesView(name: "Prednisone", description: "A corticosteroid used for inflammation and immune system modulation.", uses: ["Inflammation", "Allergic reactions", "Autoimmune diseases"], sideEffects: "Weight gain, mood changes, increased blood pressure.", dosage: "5-60 mg daily.", classification: "Prescription", imageName: "ibuprofen1"),
    MedicinesView(name: "Loratadine", description: "An antihistamine used to treat allergy symptoms.", uses: ["Allergy relief", "Itching reduction", "Runny nose relief"], sideEffects: "Headache, dry mouth, fatigue.", dosage: "10 mg once daily.", classification: "OTC", imageName: "ibuprofen1")
]

// MARK: - Row View for Each Medicine
struct MedicineRow: View {
    let medicine: MedicinesView

    // Function to get icon and color based on classification level
    private func classificationIconAndColor(for classification: String) -> (String, Color) {
        switch classification {
        case "OTC":
            return ("checkmark.circle", .green)
        case "Prescription":
            return ("exclamationmark.circle", .yellow)
        case "Controlled":
            return ("exclamationmark.triangle", .orange)
        case "Restricted":
            return ("xmark.octagon", .red)
        default:
            return ("questionmark.circle", .gray)
        }
    }

    var body: some View {
        HStack {
            // Classification icon
            let (icon, color) = classificationIconAndColor(for: medicine.classification)
            Image(systemName: icon)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(color)

            VStack(alignment: .leading) {
                Text(medicine.name)
                    .font(.headline)
                Text(medicine.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 8)
        }
        .padding()
    }
}

// Preview for MedicineRow
struct MedicineRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineRow(medicine: sampleMedicines[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

// MARK: - Detail View for Each Medicine
struct MedicineDetailView: View {
    let medicine: MedicinesView

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(medicine.name)
                        .font(.largeTitle)
                        .bold()
                    
                    // Classification icon and description
                    let (icon, color) = classificationIconAndColor(for: medicine.classification)
                    HStack {
                        Image(systemName: icon)
                            .foregroundColor(color)
                        Text(medicine.classification)
                            .font(.title3)
                            .foregroundColor(color)
                    }
                }

                //Image
                if let imageName = medicine.imageName, let uiImage = UIImage(named: imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(10)
                        .padding(.bottom, 16)

                }

                // Description section
                Text("Description")
                    .font(.title2)
                    .bold()
                Text(medicine.description)

                // Uses section
                Text("Uses")
                    .font(.title2)
                    .bold()
                ForEach(medicine.uses, id: \.self) { use in
                    Text("• \(use)")
                }

                // Side Effects section
                Text("Side Effects")
                    .font(.title2)
                    .bold()
                Text(medicine.sideEffects)

                // Dosage section
                Text("Dosage")
                    .font(.title2)
                    .bold()
                Text(medicine.dosage)
            }
            .padding()
        }
        //.navigationTitle(medicine.name)
        .navigationBarBackButtonHidden(true) // This hides the second back button
    }

    // Helper function for icon and color in detail view
    private func classificationIconAndColor(for classification: String) -> (String, Color) {
        switch classification {
        case "OTC":
            return ("checkmark.circle", .green)
        case "Prescription":
            return ("exclamationmark.circle", .yellow)
        case "Controlled":
            return ("exclamationmark.triangle", .orange)
        case "Restricted":
            return ("xmark.octagon", .red)
        default:
            return ("questionmark.circle", .gray)
        }
    }
}

// Preview for MedicineDetailView
struct MedicineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MedicineDetailView(medicine: sampleMedicines[0])
        }
    }
}

// MARK: - Main List View for Medicines
struct MedicinesListView: View {
    var medicines = sampleMedicines

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Medicines")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 12)

                List(medicines) { medicine in
                    NavigationLink(destination: MedicineDetailView(medicine: medicine)) {
                        MedicineRow(medicine: medicine)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarHidden(false)
        }
    }
}

// Preview for MedicinesListView
struct MedicinesListView_Previews: PreviewProvider {
    static var previews: some View {
        MedicinesListView()
    }
}
