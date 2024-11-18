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
    let imageName: String?
}

// Sample data for testing
let sampleSkinIssues = [
    SkinIssue(name: "Actinic Keratosis", description: "Scaly spots or patches on the top layer of skin.", symptoms: ["Rough, dry or scaly patch of skin, usually less than 1 inch (2.5 centimeters) in diameter", "Flat to slightly raised patch or bump on the top layer of skin", "In some cases, a hard, wartlike surface", "Color variations from red to brown","Itching, burning, bleeding or crusting"], causes: "The most common cause of actinic keratosis is too much exposure to ultraviolet (UV) light. UV light comes from the sun or indoor tanning equipment, such as tanning beds. UV light can damage your outer layer of skin cells, called keratinocytes. Damage to the skin from UV rays builds up over time. This means that even short-term exposure to sun on a regular basis can build up over a lifetime and increase the risk of actinic keratoses.", treatments: "If you only have 1 actinic keratoses patch, a GP might suggest waiting to see if it goes away by itself. \nIf you have more than 1 patch, or a patch is causing you problems such as pain and itchiness, treatment is usually recommended. A GP may refer you to a skin specialist (dermatologist).\nTreatments for actinic keratoses include:\n-prescription creams and gels;\n-freezing the patches (cryotherapy). This makes the patches turn into blisters and fall off after a few weeks;\n-Surgery to cut out or scrape away the patches. You'll be given a local anaesthetic first, so it does not hurt;\n-Photodynamic therapy (PDT), where special cream is applied to the patches and a light is shone on them.", severity: "Mild", imageName: "actinickeratosis"),
    SkinIssue(name: "Basal Cell Carcinoma", description: "A type of skin cancer", symptoms: ["A shiny, translucent bump: This bump may be skin-colored, appearing pearly white or pink on lighter skin tones, and glossy black or brown on darker skin tones. Small blood vessels may be visible, though they can be harder to detect on darker skin. The bump might bleed and develop a scab.", "A lesion with darker pigmentation: This may appear brown, black, or blue, with dark spots and a slightly raised, translucent border.", "A flat, scaly patch with a raised edge: These patches can grow larger over time.","A white, waxy lesion resembling a scar: These may lack a clearly defined border."], causes:"Prolonged exposure to sunlight; radiation therapy; fair skin; use of immune-suppressing medications", treatments: "Surgical Approaches: \nSurgery is commonly used to remove basal cell carcinoma, along with some surrounding healthy tissue. Surgical methods include:\n-Surgical excision: In this procedure, the affected area is removed along with a margin of healthy skin. The tissue is examined under a microscope to ensure all cancer cells have been eliminated. This method is often chosen for lesions located on areas such as the chest, back, hands, and feet. \n-Mohs surgery: This technique involves removing the cancer layer by layer while examining each layer under a microscope. This ensures that all cancerous tissue is removed while preserving as much healthy skin as possible. Mohs surgery is typically recommended for cancers at higher risk of recurrence or those located on sensitive areas, such as the face.\n\nOther Treatment Options: \nIn cases where surgery is not feasible or preferred, other treatments may be considered, including: \n-Curettage and electrodessication (C and E): This involves scraping away the cancerous tissue and using an electric needle to destroy any remaining cancer cells. It is often used for smaller lesions with a low likelihood of recurrence. \n-Radiation therapy: This uses high-energy beams like X-rays to destroy cancer cells. It is sometimes recommended after surgery or when surgery is not an option. \n-Cryosurgery: This method involves freezing the cancer cells with liquid nitrogen, often combined with curettage to remove surface-level cancer cells. It is typically used for small, thin lesions. \n-Topical treatments: Prescription creams or ointments may be applied to treat small and superficial lesions, particularly when surgery is not viable. \n-Photodynamic therapy: This involves applying a drug that makes cancer cells sensitive to light, followed by exposure to a specialized light source to destroy the cells.\n\nAdvanced Treatment for Cancer Spread:\nAlthough rare, basal cell carcinoma can spread to nearby lymph nodes or other parts of the body. Additional treatments in such cases may include: \n-Targeted drug therapy: These drugs block specific molecular pathways that cancer cells use to grow and survive, causing them to die. They are typically used when other treatments have failed or are not possible. \n-Chemotherapy: Powerful drugs are used to destroy cancer cells, generally reserved for advanced cases where other treatments are ineffective.", severity: "Severe", imageName: "basalcellcarcinoma"),
    SkinIssue(name: "Benign Keratosis", description: "Also called seborrheic keratosis, it is a common noncancerous (benign) skin growth.", symptoms: ["A waxy or rough growth, often round or oval in shape, typically found on areas like the face, chest, shoulders, or back.", "Growths that appear flat or slightly raised with a scaly surface, often described as having a \"pasted on\" appearance.", "Varied size, from very small to more than 1 inch (2.5 centimeters) across.", "Varied number, ranging from a single growth to multiple growths","Very small growths clustered around the eyes or elsewhere on the face, sometimes called flesh moles or dermatosis papulosa nigra, common on Black or brown skin", "Varied in color, ranging from light tan to brown or black","itchiness"], causes: "Experts don't completely understand what causes a seborrheic keratosis. This type of skin growth does tend to run in families, so there is likely an inherited tendency. If you've had one seborrheic keratosis, you're at risk of developing others. Sun exposure and changes in estrogen levels have also been linked to seborrheic keratosis.", treatments: "A seborrheic keratosis typically doesn't go away on its own, but treatment isn't needed. You might choose to have it removed if it becomes irritated or bleeds, or if you don't like how it looks or feels.\nSeborrheic keratosis removal can be achieved with one or a combination of the following methods:\n-Freezing the growth: freezing a growth with liquid nitrogen (cryotherapy) can be an effective way to remove a seborrheic keratosis. It doesn't always work on raised, thicker growths. This method carries the risk of permanent loss of pigment, especially on Black or brown skin.\n-Scraping (curettage) or shaving the skin's surface: first your doctor will numb the area and then use a scalpel blade to remove the growth. Sometimes shaving or scraping is used along with cryosurgery to treat thinner or flat growths.\n-Burning with an electric current (electrocautery): first your doctor will numb the area and then destroy the growth with electrocautery. This method can be used alone or with scraping, especially when removing thicker growths.", severity: "Mild", imageName: "benignkeratosis"),
    SkinIssue(name: "Dermatofibroma", description: "Harmless growths within the skin that usually have a small diameter", symptoms: ["A firm, raised bump that feels like a small, rubbery button beneath the skin’s surface", "Its size usually does not exceed 1 cm in diameter", "The lesion may range in color from purple to pink, and in some cases, it can appear brown or grey", "When the area is pinched, a dimple may form over the bump."], causes: "These growths are sometimes linked to minor skin injuries, such as insect bites, injections, or injuries caused by thorns, though this connection is not always clear. Multiple dermatofibromas are more likely to develop in individuals with weakened immune systems, such as those with HIV or those undergoing immunosuppressive treatment. They tend to be more common in women than in men.", treatments: "In many instances, dermatofibromas resolve on their own, but they can remain for an extended period or even indefinitely. Since these growths are generally harmless, treatment is usually not required other than for proper diagnosis and reassurance. \n\nTreatment methods include: \n-Steroid Injections: Injecting steroids directly into the lesion may help flatten the dermatofibroma to some extent. \n-Cryotherapy: This involves freezing the lesion, but it may leave a scar, and there is a possibility of recurrence. \n-Excision: Surgical removal of the dermatofibroma under local anesthesia, though this method will always leave a scar.", severity: "Mild", imageName: "dermatofibroma"),
    SkinIssue(name: "Melanocytic Nevus", description: "Also known as mole, it is usually a noncancerous condition of pigment-producing skin cells.", symptoms: ["Uniform color, which can range from flesh-toned to dark brown", "They are generally round or oval in shape", "These moles are also symmetrical, meaning that if a line is drawn down the middle, both sides mirror each other in appearance."], causes: "Melanocytic nevi result from both genetic influences, including family history, and environmental factors, with sun exposure being a key contributor.", treatments: "Most melanocytic nevi do not need treatment. However, those that are benign but cause cosmetic concerns or irritation can be removed. Removal may be performed using either the shave technique or through surgical excision with sutures. \nAtypical melanocytic nevi are usually biopsied if a healthcare provider suspects the presence of cutaneous melanoma.", severity: "Mild", imageName: "melanocyticnevus"),
    SkinIssue(name: "Melanoma", description: "A type of skin cancer", symptoms: ["Changes in an existing mole.", "The appearance of a new, pigmented, or irregularly shaped growth on the skin. Melanoma may not always originate from a mole and can sometimes develop on skin that appears normal.",], causes: "The exact cause of the DNA alterations in skin cells that lead to melanoma is not fully understood. It is believed to result from a combination of genetic and environmental factors. However, exposure to ultraviolet (UV) light, such as from the sun or tanning beds, is considered the primary risk factor for melanoma.", treatments: "Treatment for melanoma generally begins with surgery to excise the cancerous tissue. Additional treatments may involve radiation therapy or medication. The choice of treatment depends on several factors, including the cancer’s stage, the patient’s overall health, and personal treatment preferences.", severity: "Fatal", imageName: "melanoma"),
    SkinIssue(name: "Squamous Cell Carcinoma", description: "Squamous cell carcinoma is a type of skin cancer caused by an overproduction of squamous cells in your epidermis, the top layer of your skin.", symptoms: ["A firm lump on the skin, known as a nodule. Its color may match the surrounding skin or differ, appearing pink, red, black, or brown, depending on the individual's skin tone.", "A flat, scaly sore with a crusted surface.", "The emergence of a new sore or a raised area on a preexisting scar or wound.", "A coarse, flaky patch on the lip that might evolve into an open sore.", "A rough or ulcerated spot inside the mouth.", "A raised lesion or wart-like growth on or around the anus or genital area."], causes: "Various factors can elevate the likelihood of developing squamous cell carcinoma of the skin, such as:\n-Having skin prone to sunburn.\n-Prolonged exposure to sunlight.\n-Use of tanning beds.\n-A history of sunburn episodes.\n-A past occurrence of precancerous skin growths.\n-A personal history of skin cancer.\n-A compromised immune system.\nRare inherited genetic disorders.\n-Infection with human papillomavirus (HPV).\n-Presence of chronic scars or persistent wounds on the skin.", treatments: "TREATMENTS FOR VERY SMALL SKIN CANCERS.\n\nIf the skin cancer is small, not deep into the skin, called superficial, and has a low risk of spreading, less-invasive treatment choices include:\n-Curettage and electrodessication. This treatment involves removing the top of the skin cancer with a scraping tool called a curet. Then an electric needle is used to sear the base of the cancer.\n-Laser therapy. This treatment uses an intense beam of light to destroy growths. There's usually little damage to nearby tissue. And there's a reduced risk of bleeding, swelling and scarring.\n-Freezing. This treatment, called cryosurgery, involves freezing cancer cells with liquid nitrogen. Freezing might be done after using a scraping tool, called a curet, to remove the surface of the skin cancer.\n-Photodynamic therapy. During photodynamic therapy, a liquid medicine that makes the cancer cells sensitive to light is applied to the skin. Later, a light that destroys the skin cancer cells is shined on the area. This treatment might be used with surgery or other treatments.\n\nTREATMENTS FOR LARGER SKIN CANCERS\nMore-invasive treatments might be recommended for larger squamous cell carcinomas and those that go deeper into the skin. Options might include:\n-Simple excision. This involves cutting out the cancer and a margin of healthy skin around it. Sometimes more skin around the tumor is removed, called a wide excision.\n-Mohs surgery. Mohs surgery involves removing the cancer layer by layer and looking at each layer under the microscope until no cancer cells are left. This allows the surgeon to remove the whole growth without taking too much of the healthy skin around it.\n-Radiation therapy. Radiation therapy uses powerful energy beams to kill cancer cells. Radiation therapy is sometimes used after surgery when there is an increased risk that the cancer might return. It also might be an option for people who can't have or don't want surgery.\n\nTREATMENTS FOR SKIN CANCER THAT SPREADS PAST THE SKIN.\n\nWhen squamous cell carcinoma spreads to other parts of the body, medicines might be recommended, including:\n-Chemotherapy. Chemotherapy uses strong medicines to kill cancer cells. If squamous cell carcinoma spreads to the lymph nodes or other parts of the body, chemotherapy can be used alone or with other treatments, such as targeted therapy and radiation therapy.\n-Targeted therapy. Targeted therapy uses medicines that attack specific chemicals in the cancer cells. By blocking these chemicals, targeted treatments can cause cancer cells to die. Targeted therapy is usually used with chemotherapy.\n-Immunotherapy. Immunotherapy is a treatment with medicine that helps the body's immune system kill cancer cells. The immune system fights off diseases by attacking germs and other cells that shouldn't be in the body. Cancer cells survive by hiding from the immune system. Immunotherapy helps the immune system cells find and kill the cancer cells. For squamous cell carcinoma of the skin, immunotherapy might be considered when the cancer is advanced and other treatments aren't an option.", severity: "Hazardous", imageName: "squamouscellcarcinoma"),
    SkinIssue(name: "Vascular Lesion", description: "Vascular lesions are abnormal growths or malformations in the blood vessels, which can occur in various parts of the body.", symptoms: ["Vascular malformations that affect the skin often appear as raised marks that can be red, blue, purple, brown, or black. These skin marks may swell, bleed, or cause discomfort.", "When an arteriovenous malformation (AVM) occurs in the brain, it may remain asymptomatic unless a bleed happens. Bleeding from brain AVMs can result in headaches, seizures, or muscle weakness affecting one side of the body.", "Venous malformations, on the other hand, may lead to body pain, swelling, clotting issues, and potential organ damage."], causes: "Vascular malformations are usually caused by abnormal development of vascular or lymphatic channels during fetal development, meaning they are typically present from birth (congenital).\nIn rarer cases, these malformations can develop later due to unrecognized damage to blood vessels following an injury. Additionally, hormonal changes, such as those occurring during puberty or pregnancy, can make venous malformations more noticeable for the first time.\nA small percentage of individuals may have a genetic predisposition due to inherited mutations, which increase the likelihood of developing vascular malformations.", treatments: "Not all malformations require treatment, especially if they do not cause symptoms or complications. In such cases, monitoring over time may be sufficient.\nFor those that do require intervention, a variety of minimally invasive treatment options are available, including:\n-Sclerotherapy;\n-Catheter embolization;\n-Laser therapy;\n-Radiation therapy (radiosurgery).", severity: "Moderate", imageName: "vascularlesion"),
]

// MARK: - Row View for Each Skin Issue
struct SkinIssueRow: View {
    let issue: SkinIssue

    // Function to get icon and color based on severity level
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
    
    // State variables for toggling visibility
    @State private var showSymptoms = false
    @State private var showCauses = false
    @State private var showTreatments = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Title and severity
                HStack {
                    Text(issue.name)
                        .font(.title)
                        .bold()
                    
                    let (icon, color) = severityIconAndColor(for: issue.severity)
                    HStack {
                        Image(systemName: icon)
                            .foregroundColor(color)
                        Text(issue.severity)
                            .font(.title3)
                            .foregroundColor(color)
                    }
                }
                
                // Image centered at the top
                if let imageName = issue.imageName, let uiImage = UIImage(named: imageName) {
                    GeometryReader { geometry in
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * 1) // Image will take 80% of the screen width
                            .cornerRadius(12)
                            .padding(.bottom, 16)
                            .frame(maxWidth: .infinity) // Center the image horizontally
                    }
                    .frame(height: 250) // Ensure the image has a defined height for clarity
                }
                
                // Description section (no border)
                sectionWrapper(backgroundColor: Color(hex: "#F0F0F0"), hasBorder: false) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Description")
                            .font(.title2)
                            .bold()
                            .foregroundColor(Color(hex: "#00336"))
                        Text(issue.description)
                    }
                }
                
                // Symptoms section (with border)
                sectionWrapper(backgroundColor: Color(hex: "#D9F0FF"), hasBorder: false, borderColor: Color(hex: "#AEE0F9")) {
                    sectionToggle(title: "Symptoms", isExpanded: $showSymptoms) {
                        ForEach(issue.symptoms, id: \.self) { symptom in
                            Text("• \(symptom)")
                        }
                    }
                }
                
                // Causes section (with border)
                sectionWrapper(backgroundColor: Color(hex: "#BFE6FB"), hasBorder: false, borderColor: Color(hex: "#80B3E6")) {
                    sectionToggle(title: "Causes", isExpanded: $showCauses) {
                        Text(issue.causes)
                    }
                }
                
                // Treatments section (with border)
                sectionWrapper(backgroundColor: Color(hex: "#A6D2F5"), hasBorder: false, borderColor: Color(hex: "#3366CC")) {
                    sectionToggle(title: "Treatments", isExpanded: $showTreatments) {
                        Text(issue.treatments)
                    }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
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
    
    // Reusable view for toggleable sections
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
                            title == "Symptoms" ? Color(hex:"#6C9FC8") :
                                title == "Causes" ? Color(hex:"#517DC0"):
                                title == "Treatments" ? Color(hex:"#3F70A7"): .primary)
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
            .padding(.bottom, 8) // Add spacing between sections
    }
}






    
// Preview for SkinIssueDetailView
struct SkinIssueDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SkinIssueDetailView(issue: sampleSkinIssues[0])
    }
}

// MARK: - Main List View for Skin Issues
struct SkinIssuesListView: View {
    var issues = sampleSkinIssues
    
    var body: some View {
        NavigationView {
            List(issues) { issue in
                NavigationLink(destination: SkinIssueDetailView(issue: issue)) {
                    SkinIssueRow(issue: issue)
                }
            }
            .navigationTitle("Skin Issues")
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
