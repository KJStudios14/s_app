import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var rememberMe = false

    var body: some View {
        VStack {
            // Add custom back button
            HStack {
                NavigationLink(destination: GettingStartedView()) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 7, height: 10)
                        .foregroundColor(.black)
                        .padding()
                        .background(Circle().fill(Color.white).shadow(radius: 1))
                }
                Spacer()
            }
            .padding(.leading)
            
            Spacer()
            Text("Welcome Back!")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255)) // RGB: #47634D
                .padding(.bottom, 40)
            
            Group {
                VStack(alignment: .leading) {
                    Text("Email Address")
                        .font(.caption)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255)) // RGB: #47634D
                    TextField("", text: $email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1)) // RGB: #B3BDB6
                        .padding(.bottom, 20)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255)) // RGB: #47634D
                    SecureField("", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1)) // RGB: #B3BDB6
                        .padding(.bottom, 20)
                }
            }
           
            HStack {
                VStack { Divider() }
                Text("or")
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255)) // RGB: #47634D
                VStack { Divider() }
            }
            .padding(.vertical, 20)
            
            Button(action: {
            }) {
                HStack {
                    Image("applelogo")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("Sign in with Apple")
                        .foregroundColor(.white)
                        .bold()
                }
                .frame(maxWidth: 250, maxHeight: 20)
                .padding()
                .background(Color.black)
                .cornerRadius(25)
            }
            .padding(.bottom, 10)
            
            Button(action: {
            }) {
                HStack {
                    Image("googlelogo")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text("Sign in with Google")
                        .foregroundColor(.black)
                        .bold()
                }
                .frame(maxWidth: 250, maxHeight: 20)
                .padding()
                .background(Color(red: 244/255, green: 244/255, blue: 244/255))
                .cornerRadius(25)
            }
            .padding(.bottom, 40)
            
            Button(action: {
                // Log in action
            }) {
                Text("LOG IN")
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: 200)
                    .padding()
                    .background(Color(red: 179/255, green: 189/255, blue: 182/255)) // RGB: #B3BDB6
                    .cornerRadius(20)
            }
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    LoginView()
}
