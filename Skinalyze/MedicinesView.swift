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
    
    // State variables for toggling visibility
    @State private var showUses = false
    @State private var showSideEffects = false
    @State private var showDosage = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Title and classification
                HStack {
                    Text(medicine.name)
                        .font(.title)
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
                
                // Image section (with fixed size)
                if let imageName = medicine.imageName, let uiImage = UIImage(named: imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 300) // Fixed size for all images
                        .cornerRadius(15)
                        .padding(.bottom, 16)
                        .frame(maxWidth: .infinity) // Center the image horizontally
                        .clipped() // Ensure the image does not overflow
                }
                
                // Description section (no border)
                sectionWrapper(backgroundColor: Color.gray.opacity(0.3), hasBorder: false) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Description")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(hex: "#0D5C8B"))
                        Text(medicine.description)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                // Uses section (with border)
                sectionWrapper(backgroundColor: Color(hex: "0D5C8B"), hasBorder: true, borderColor: Color(hex: "#0D5C8B")) {
                    sectionToggle(title: "Uses", isExpanded: $showUses) {
                        ForEach(medicine.uses, id: \.self) { use in
                            Text("• \(use)")
                        }
                    }
                }
                
                // Side Effects section (with border)
                sectionWrapper(backgroundColor: Color(hex: "#0D5C8B"), hasBorder: true, borderColor: Color(hex: "#0D5C8B")) {
                    sectionToggle(title: "Side Effects", isExpanded: $showSideEffects) {
                        Text(medicine.sideEffects)
                    }
                }
                
                // Dosage section (with border)
                sectionWrapper(backgroundColor: Color(hex: "#0D5C8B"), hasBorder: true, borderColor: Color(hex: "#0D5C8B")) {
                    sectionToggle(title: "Dosage", isExpanded: $showDosage) {
                        Text(medicine.dosage)
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(false)
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
    
    // Reusable view for toggleable sections (similar to issues)
    @ViewBuilder
    private func sectionToggle<Content: View>(
        title: String,
        isExpanded: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    isExpanded.wrappedValue.toggle()
                }
            }) {
                HStack {
                    Text(title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(
                            title == "Uses" ? Color(hex:"#E2EFFD") :
                            title == "Side Effects" ? Color(hex:"#0D5C8B") :
                            title == "Dosage" ? Color(hex:"#E2EFFD"): .primary)
                    Spacer()
                    Image(systemName: isExpanded.wrappedValue ? "chevron.down" : "chevron.right")
                        .foregroundColor(.secondary)
                }
            }
            
            if isExpanded.wrappedValue {
                content()
                    .transition(.opacity) // Optional transition for smoothness
            }
        }
        .padding(.top, 8)
    }
    
    // Wrapper view for sections with background color, rounded corners, and optional border
    @ViewBuilder
    private func sectionWrapper<Content: View>(
        backgroundColor: Color,
        hasBorder: Bool = true,
        borderColor: Color = .clear,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        content()
            .padding()
            .background(RoundedRectangle(cornerRadius: 12).fill(backgroundColor))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(borderColor, lineWidth: hasBorder ? 2 : 0) // Optional border
            )
            .frame(maxWidth: .infinity) // Ensure all sections have the same width
            .padding(.bottom, 8) // Add spacing between sections
    }
}

// Preview for MedicineDetailView
struct MedicineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineDetailView(medicine: sampleMedicines[0])
    }
}


// MARK: - Main List View for Medicines
struct MedicinesListView: View {
    var medicines = sampleMedicines
    @State private var searchText = "" // Estado para el texto de búsqueda
    @State private var selectedClasification: String = "All" // Estado para la categoría seleccionada
    @State private var showingClasificationMenu = false // Estado para mostrar el menú de categorías
    
    // Lista de categorías disponibles
    let clasification = ["All", "OTC", "Prescription", "Controlled", "Restricted"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                    .frame(height: 3)
                
                HStack {
                    TextField("Search medicines...", text: $searchText)
                        .padding(9)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .frame(height: 3)
                    
                    Spacer()
                        .frame(width: 20)
                    
                    Button(action: {
                        showingClasificationMenu.toggle()
                    }) {
                        Image(systemName: "line.horizontal.3.decrease.circle.fill")
                            .font(.title)
                            .padding(.trailing)
                    }
                }
                .padding(.horizontal)
                
                Text("Medicines")
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                // Lista de medicinas filtrada por búsqueda y categoría
                List(filteredMedicines) { medicine in
                    NavigationLink(destination: MedicineDetailView(medicine: medicine)) {
                        MedicineRow(medicine: medicine)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .actionSheet(isPresented: $showingClasificationMenu) {
            ActionSheet(title: Text("Filter by Clasification"), message: nil, buttons: [
                .default(Text("All")) {
                    selectedClasification = "All"
                },
                .default(Text("OTC")) {
                    selectedClasification = "OTC"
                },
                .default(Text("Prescription")) {
                    selectedClasification = "Prescription"
                },
                .default(Text("Controlled")) {
                    selectedClasification = "Controlled"
                },
                .default(Text("Restricted")) {
                    selectedClasification = "Restricted"
                },
                .cancel()
            ])
        }
    }
    // Propiedad computada para filtrar las medicinas según el texto de búsqueda y la categoría seleccionada
    private var filteredMedicines: [MedicinesView] {
        medicines.filter { medicine in
            let matchesSearchTextMed = searchText.isEmpty ||
            medicine.name.lowercased().contains(searchText.lowercased()) ||
            medicine.description.lowercased().contains(searchText.lowercased())
            
            let matchesCategoryMed = selectedClasification == "All" || medicine.classification == selectedClasification
            
            return matchesSearchTextMed && matchesCategoryMed
        }
    }
}

// Preview for MedicinesListView
struct MedicinesListView_Previews: PreviewProvider {
    static var previews: some View {
        MedicinesListView()
    }
}
