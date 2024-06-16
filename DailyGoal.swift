import SwiftUI

struct DailyGoalView: View {
    @State private var selectedHour = 1
    @State private var selectedMinute = 0
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("How many hours per day")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .multilineTextAlignment(.center)
            
            Text("would you like to dedicate to studying?")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack(spacing: 20) {
                Picker(selection: $selectedHour, label: Text("")) {
                    ForEach(1..<6) { hour in
                        Text("\(hour)").tag(hour)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 50, height: 60)
                .clipped()
                
                Text("hour(s)")
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .fontWeight(.bold)
                
                Picker(selection: $selectedMinute, label: Text("")) {
                    Text("0").tag(0)
                    Text("15").tag(15)
                    Text("30").tag(30)
                    Text("45").tag(45)
                }
                .pickerStyle(WheelPickerStyle())
                .frame(width: 50, height: 60)
                .clipped()
                
                Text("mins")
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .fontWeight(.bold)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 5)
            .background(Color(red: 220/255, green: 225/255, blue: 221/255))
            .cornerRadius(10)
            
            Spacer()
            
            VStack(spacing: 20) {
                NavigationLink(destination: WelcomeView()) {
                    Text("Next")
                        .bold()
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(maxWidth: 250)
                        .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                        .cornerRadius(25)
                        .padding(.bottom, 10)
                }
                
                Button(action: {
                    // Handle Back button action
                }) {
                    NavigationLink(destination: GoalSelectionView()) {
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
                .padding(.horizontal, 30)
                .padding(.bottom, 20)
            }
            .padding(.top, 40) // Shift everything up the page
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
    
    struct StudyTimeView_Previews: PreviewProvider {
        static var previews: some View {
            DailyGoalView()
        }
    }
}
