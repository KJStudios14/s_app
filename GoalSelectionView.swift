import SwiftUI

struct GoalSelectionView: View {
    @State private var selectedGoals: [String] = []
    let goals = [
        "Improve my grades in core subjects",
        "Complete all homework on time",
        "Prepare effectively for exams",
        "Enhance my understanding of challenging subjects",
        "Develop better study habits and routines"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Please select your goals for the academic year.")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .padding(.bottom, 5)
                
                Text("Select all that apply.")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    ForEach(goals, id: \.self) { goal in
                        Button(action: {
                            toggleSelection(for: goal)
                        }) {
                            Text(goal)
                                .font(.body)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(selectedGoals.contains(goal) ? .white : Color(red: 71/255, green: 99/255, blue: 77/255))
                                .background(selectedGoals.contains(goal) ? Color(red: 179/255, green: 189/255, blue: 182/255) : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 2)
                                )
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                VStack(spacing: 20) {
                    NavigationLink(destination: DailyGoalView()) {
                        Text("Next")
                            .bold()
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: 250)
                            .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                            .cornerRadius(25)
                            .padding(.bottom, 10)
                    }
                    
                    NavigationLink(destination: SubjectSelectionView()) {
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
        }
        .navigationBarBackButtonHidden(true) // Hide the back button from the navigation bar
    }
    
    private func toggleSelection(for goal: String) {
        if let index = selectedGoals.firstIndex(of: goal) {
            selectedGoals.remove(at: index)
        } else {
            selectedGoals.append(goal)
        }
    }
}

struct GoalSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GoalSelectionView()
    }
}
