import SwiftUI

struct PreferredNameView: View {
    @State private var preferredName: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Please enter your preferred name.")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .padding(.bottom, 5)
            
            Text("What would you like to be called?")
                .font(.subheadline)
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .padding(.bottom, 50)
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    TextField("Type here...", text: $preferredName, onEditingChanged: { _ in
                        if preferredName.count > 20 {
                            preferredName = String(preferredName.prefix(20))
                        }
                    })
                    .padding(.vertical, 10)
                    .foregroundColor(Color(red: 77/255, green: 97/255, blue: 79/255))
                    .overlay(
                        VStack {
                            Divider()
                                .background(Color(red: 71/255, green: 99/255, blue: 77/255))
                            Spacer()
                        }
                    )
                    .onChange(of: preferredName) { newValue in
                        if newValue.count > 20 {
                            preferredName = String(newValue.prefix(20))
                        }
                    }
                    
                    Text("\(preferredName.count)/20")
                        .font(.footnote)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .padding(.top, 5)
                        .padding(.trailing, 10)
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
            
            Spacer()
            
            VStack {
                
                NavigationLink(destination: YearGroupSelectionView()) {
                    Text("Next")
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: 250)
                        .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                        .cornerRadius(25)
                        .padding(.bottom, 10)
                }
                NavigationLink(destination:
                                CreateanAccountView()){
                    Text("Back")
                        .bold()
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .padding()
                        .frame(maxWidth: 250)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 30)
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct PreferredNameView_Previews: PreviewProvider {
    static var previews: some View {
        PreferredNameView()
    }
}
