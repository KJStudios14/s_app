import SwiftUI

struct AddOtherSubjectView: View {
    @State private var subjects: [String] = [""]

    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                Text("Please enter your other subjects.")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .padding(.bottom, 10)

                Text("Type in any subjects that we have not mentioned.")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .padding(.bottom, 30)

                VStack(spacing: 20) {
                    ForEach(subjects.indices, id: \.self) { index in
                        TextField("Type here...", text: Binding(
                            get: {
                                subjects[index]
                            },
                            set: {
                                subjects[index] = $0
                            }
                        ))
                        .padding()
                        .frame(width: 270)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1)
                        )
                    }
                    .onDelete { indexSet in
                        subjects.remove(atOffsets: indexSet)
                    }

                    if subjects.count < 5 {
                        Button(action: {
                            subjects.append("")
                        }) {
                            Text("+ Add another subject")
                                .font(.subheadline)
                                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        }
                    }
                }
                .padding(.bottom, 50)

                Spacer()

                VStack {
                    NavigationLink(destination: GoalSelectionView()) {
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
                .padding(.horizontal, 40)
                .padding(.bottom, 30)
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true) // Hide the back button
        }
    }
}

// Preview
struct AddOtherSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddOtherSubjectView()
    }
}
