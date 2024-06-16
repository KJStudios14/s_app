import SwiftUI

struct YearGroupSelectionView: View {
    @State private var selectedYear: Int = 7
        
    var body: some View {
        VStack {
            Spacer()
            
            Text("Please select your current year group.")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .padding(.bottom, 20)
            
            HStack {
                Text("Year")
                    .font(.title3)
                    .bold()
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                
                Picker(selection: $selectedYear, label: Text("")) {
                    ForEach(7..<14) { year in
                        Text("\(year)")
                            .tag(year)
                            .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 100, height: 45)
                .clipped()
                .background(Color(red: 220/255.0, green: 225/255.0, blue: 221/255.0))
                .cornerRadius(15)
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 50)
            
            Spacer()
            
            VStack {
                NavigationLink(destination: SubjectSelectionView()) {
                    Text("Next")
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: 250)
                        .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                        .cornerRadius(25)
                        .padding(.bottom, 10)
                }
                
                NavigationLink(destination: PreferredNameView()) {
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
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

#Preview {
    YearGroupSelectionView()
}
