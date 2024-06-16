//
//  HomeVIe.swift
//  Efficio
//
//  Created by KJemide on 05/06/2024.
//

import SwiftUI

struct HomeView: View {
    var userName: String = "User3456"
    var buddyName: String = "Buddy"
    var level: String = "LEVEL 1: Novice"
    var xp: Int = 0
    var maxXP: Int = 100
    var memberSince: String = "Jan 2024"
    var revisionTip: String = "Tip of the day: Take regular breaks to improve retention."
    var hoursStudied: Int = 5
    var upcomingEvents: [String] = ["Math Test - June 10", "Science Project - June 15"]
    
    @State private var profileImage: Image? = Image(systemName: "person.circle.fill")
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?

    var body: some View {
        VStack(alignment: .leading) {
            // Welcome message
            Text("Welcome \(userName),")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .padding(.top, 20)
            
            // User profile
            HStack {
                VStack(alignment: .leading) {
                    profileImage?
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(red: 71/255, green: 99/255, blue: 77/255), lineWidth: 2))
                        .onTapGesture {
                            showingImagePicker = true
                        }
                        .overlay(
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                                .offset(x: 30, y: 30)
                        )
                    Text("Member since \(memberSince)")
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .font(.footnote)
                        .padding(.top, 5)
                }
                .padding(.trailing, 10)
                
                VStack(alignment: .leading) {
                    Text(buddyName)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        Text(level)
                            .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    }
                    .padding(.top, 5)
                    
                    Text("\(xp)/\(maxXP) XP")
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .font(.footnote)
                    
                    ProgressBar(value: Float(xp), maxValue: Float(maxXP))
                        .frame(height: 10)
                        .padding(.vertical, 10)
                    
                    Button(action: {
                        // Edit profile action
                    }) {
                        Text("Edit Profile")
                            .foregroundColor(.white)
                            .bold()
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                            .cornerRadius(15)
                    }
                }
                .padding(.top, 10)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 71/255, green: 99/255, blue: 77/255), lineWidth: 1))
            .padding(.bottom, 20)
            
            // Revision Tip of the Day
            VStack(alignment: .leading) {
                Text("Revision Tip of the Day")
                    .font(.headline)
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                Text(revisionTip)
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .padding(.top, 5)
                Button(action: {
                    // Action to view previous revision tips
                }) {
                    Text("See previous tips")
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .underline()
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 71/255, green: 99/255, blue: 77/255), lineWidth: 1))
            .padding(.bottom, 20)
            
            // Upcoming Events
            VStack(alignment: .leading) {
                Text("Upcoming Events")
                    .font(.headline)
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                ForEach(upcomingEvents, id: \.self) { event in
                    Text(event)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                        .padding(.top, 5)
                }
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 71/255, green: 99/255, blue: 77/255), lineWidth: 1))
            .padding(.bottom, 20)
            
            // Hours Studied this Week
            VStack(alignment: .leading) {
                Text("Hours Studied this Week")
                    .font(.headline)
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                Text("\(hoursStudied) hours")
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    .padding(.top, 5)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 71/255, green: 99/255, blue: 77/255), lineWidth: 1))
            .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        profileImage = Image(uiImage: inputImage)
    }
}

// ProgressBar View
struct ProgressBar: View {
    var value: Float
    var maxValue: Float
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5)
                .frame(maxWidth: .infinity)
                .foregroundColor(Color(red: 220/255, green: 225/255, blue: 221/255))
            RoundedRectangle(cornerRadius: 5)
                .frame(width: CGFloat(value / maxValue) * UIScreen.main.bounds.width, height: 10)
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
        }
    }
}

// ImagePicker View
struct ImagePicker: UIViewControllerRepresentable {
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
