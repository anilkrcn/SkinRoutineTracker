import SwiftUI

struct ChooseProductFormView: View {
    @State private var selectedForm: String? = nil
    
    let productForms = [
        ("drop.fill", "Serum"),
        ("rectangle.roundedbottom.fill", "Cream"),
        ("leaf.fill", "Gel"),
        ("sparkles", "Foam"),
        ("wind", "Spray"),
        ("drop.circle", "Oil"),
        ("face.smiling", "Sheet Mask")
    ]
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Başlık
            
            Image("skincare")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.background)
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding(.top, 80)
            
            VStack(alignment: .leading) {
                Text("Choose Product Form")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
            
            
            // Grid düzeninde form ikonları
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 24) {
                ForEach(productForms, id: \.1) { icon, name in
                    ZStack{
                        Circle().fill(Color.background)
                        VStack(spacing: 10) {
                            Image(systemName: icon)
                                .font(.system(size: 30))
                                .foregroundColor(selectedForm == name ? .white : .gray)
                                .frame(width: 60, height: 60)
                                .background(selectedForm == name ? Color.background : Color.clear)
                                .cornerRadius(14)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedForm = name
                        }
                    }
                }
            }
            .padding(.horizontal, 24)
            
            Spacer()
            
            // Next Button
            NavigationLink(destination: SetRoutineFrequencyView()){
                Text("Next")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedForm != nil ? Color.background : Color.primaryAccent)
                    .foregroundColor(.white)
                    .cornerRadius(25)
            }
            .padding(.horizontal, 30)
            .disabled(selectedForm == nil)
        }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.secondaryAccent.ignoresSafeArea())
    }
}

#Preview {
    ChooseProductFormView()
}
