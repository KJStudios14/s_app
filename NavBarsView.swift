//
//  NavBarsView.swift
//  Efficio
//
//  Created by KJemide on 05/06/2024.
//

import SwiftUI

struct NavBarsView: View {
    @State private var showSettings = false
    
    var body: some View {
        VStack {
            // Top Navigation Bar
            HStack {
                HStack(spacing: 5) {
                    Image(systemName: "flame.fill")
                        .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
                    Text("0")
                        .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
                }
                
                Spacer()
                
                Text("EFFICIO")
                    .font(.headline)
                    .foregroundColor(Color(red: 90/255, green: 114/255, blue: 98/255))
                
                Spacer()
                
                HStack(spacing: 5) {
                    Image(systemName: "bell.fill")
                        .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color(red: 179/255, green: 189/255, blue: 182/255))
                        .onTapGesture {
                            showSettings.toggle()
                        }
                }
            }
            .padding()
            
            Spacer()
            
            // Bottom Navigation Bar
            VStack {
                Spacer()
                
                HStack(spacing: -1) { // Reduce spacing between tab buttons
                    Spacer()
                    
                    NavigationLink(destination: HomeView()) {
                        TabBarButton(imageName: "house.fill", title: "Home")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ToDoListView()) {
                        TabBarButton(imageName: "list.bullet", title: "To Do")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: MyCalendarView()) {
                        TabBarButton(imageName: "calendar", title: "My Calendar")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: ProductivityView()) {
                        TabBarButton(imageName: "chart.pie.fill", title: "Productivity")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: BuddiesView()) {
                        TabBarButton(imageName: "person.2.fill", title: "My Buddies")
                    }
                    
                    Spacer()
                }
                .frame(height: 50)
                .background(Color(red: 90/255, green: 114/255, blue: 98/255))
            }
        }
    }
    
    struct TabBarButton: View {
        let imageName: String
        let title: String
        
        var body: some View {
            VStack(spacing: -25) { // Reduce spacing between icon and title
                Image(systemName: imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                    .padding(.top, 5) // Adjust top padding to shift down icon and title
                    .padding(.bottom, 15)
                Text(title)
                    .font(.custom("Nunito-Regular", size: 11))
                    .lineLimit(1) // Limit title to one line
                    .multilineTextAlignment(.center) // Center-align the text
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top, 15)
                    .padding(.bottom, -15)
                
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
        }
    }
    
    
    struct SettingsView: View {
        var body: some View {
            NavigationView {
                List {
                    NavigationLink(destination: AccountDetailsView()) {
                        Text("Account Details")
                    }
                    NavigationLink(destination: PrivacySettingsView()) {
                        Text("Privacy Settings")
                    }
                    NavigationLink(destination: NotificationsSettingsView()) {
                        Text("Notification Settings")
                    }
                    NavigationLink(destination: HelpSupportView()) {
                        Text("Help & Support")
                    }
                    NavigationLink(destination: AboutView()) {
                        Text("About")
                    }
                }
                .navigationTitle("Settings")
            }
        }
    }
    
    struct AccountDetailsView: View {
        var body: some View {
            Text("Account Details")
        }
    }
    
    struct PrivacySettingsView: View {
        var body: some View {
            Text("Privacy Settings")
        }
    }
    
    struct NotificationsSettingsView: View {
        var body: some View {
            Text("Notification Settings")
        }
    }
    
    struct HelpSupportView: View {
        var body: some View {
            Text("Help and Support")
            Text("Need assistance or have a question? We're here to help!")
            Text("At EFFICIO, we're committed to providing you with the best possible support to ensure your experience with our app is seamless and enjoyable. Whether you encounter a technical issue, have feedback to share, or simply need guidance on using EFFICIO effectively, our support team is ready to assist you.")
            Text("Please don't hesitate to reach out to us via email at efficioapp@gmail.com. We strive to respond to all inquiries promptly and provide you with the assistance you need.")
        }
    }
    
    struct AboutView: View {
        var body: some View {
            Text("About EFFICIO")
            
            Text("Welcome to EFFICIO, your ultimate study companion designed to boost your academic performance and streamline your study routine")
            
            Text("At EFFICIO, our mission is to empower secondary school students like you to achieve academic excellence through efficient study management and collaboration. Whether you're tackling assignments, preparing for exams, or organizing your study schedule, EFFICIO is here to support you every step of the way.")
            
            Text("With EFFICIO, you can:")
            
            Text("- Effortlessly manage your tasks and deadlines")
            Text("- Track your study progress and productivity")
            Text("- Connect with study buddies for motivation and collaboration")
            Text("- Set and accomplish your study goals effectively")
            
            Text("Our team is dedicated to providing you with a seamless and intuitive platform that enhances your study experience and helps you succeed in school. We're committed to continuous improvement and innovation to ensure that EFFICIO meets your evolving needs and exceeds your expectations.")
            
            Text("Thank you for choosing EFFICIO as your study companion! Let's study smarter and achieve greatness together.")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            NavBarsView()
        }
    }
    
    
}
