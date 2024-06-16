import SwiftUI

struct SubjectSelectionView: View {
    @State private var selectedSubjects: Set<String> = []

    let subjects = [
        "Maths", "English Language", "English Literature", "Biology", "Chemistry",
        "Physics", "Geography", "History", "Religious Studies", "Computer Science",
        "Economics", "Philosophy", "Psychology", "Further Maths", "French",
        "Spanish", "German", "Mandarin", "Latin", "Other"
    ]

    var body: some View {
        VStack {
            Spacer()
            Text("Please select all the subjects that you are taking.")
                .font(.title2)
                .bold()
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .multilineTextAlignment(.center)
                .padding(.bottom, 40)
            
            let columns = [GridItem(.adaptive(minimum: 100))]
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(subjects, id: \.self) { subject in
                    Button(action: {
                        if selectedSubjects.contains(subject) {
                            selectedSubjects.remove(subject)
                        } else {
                            selectedSubjects.insert(subject)
                        }
                    }) {
                        Text(subject)
                            .foregroundColor(selectedSubjects.contains(subject) ? Color.white : Color(red: 179/255, green: 189/255, blue: 182/255))
                            .padding()
                            .frame(minWidth: 100)
                            .background(selectedSubjects.contains(subject) ? Color(red: 179/255, green: 189/255, blue: 182/255) : Color.clear)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(selectedSubjects.contains(subject) ? Color(red: 71/255, green: 99/255, blue: 77/255) : Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1)
                            )
                            .cornerRadius(15)
                    }
                }
            }
            .padding(.bottom, 40)

            HStack {
                NavigationLink(
                    destination: YearGroupSelectionView(),
                    label: {
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
                )
                
                NavigationLink(
                    destination: selectedSubjects.contains("Other") ? AnyView(AddOtherSubjectView()) : AnyView(GoalSelectionView()),
                    label: {
                        Text("Next")
                            .bold()
                            .foregroundColor(Color.white)
                            .padding()
                            .frame(maxWidth: 250)
                            .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                            .cornerRadius(25)
                    }
                )
            }
            .frame(maxWidth: 300)
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct SubjectSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectSelectionView()
    }
}
