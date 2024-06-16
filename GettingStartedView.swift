
import SwiftUI

struct GettingStartedView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Welcome to")
                    .font(.system(size: 50, weight: .medium))
                    .foregroundColor(Color(red: 90/255, green: 114/255, blue: 98/255))
                    .padding(.vertical, 10)
                Text("EFFICIO")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(Color(red: 90/255, green: 114/255, blue: 98/255))
                
                Image("Screenshot 2024-05-28 at 12.25.16")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 175, height: 175)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                
                NavigationLink(destination: CreateanAccountView()) {
                    Text("Create an Account")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 5)
                
                NavigationLink(destination: LoginView()) { // Added NavigationLink here
                    Text("Already have an account? Log in")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color(red: 90/255, green: 114/255, blue: 98/255))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 90/255, green: 114/255, blue: 98/255), lineWidth: 2)
                        )
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true) 
            
        }
        .navigationBarBackButtonHidden(true) 
        
    }
}

struct GettingStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GettingStartedView()
    }
}
