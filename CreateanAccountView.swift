import SwiftUI

struct CreateanAccountView: View {
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
            Text("Create an Account")
                .font(.largeTitle)
                .bold()
                .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                .padding(.bottom, 25)
            
            Group {
                VStack(alignment: .leading) {
                    Text("Username")
                        .font(.caption)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    TextField("", text: .constant(""))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1))
                        .padding(.bottom, 20)
                }
                
                VStack(alignment: .leading) {
                    Text("Email Address")
                        .font(.caption)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    TextField("", text: .constant(""))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1))
                        .padding(.bottom, 20)
                }
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.caption)
                        .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                    SecureField("", text: .constant(""))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color(red: 179/255, green: 189/255, blue: 182/255), lineWidth: 1))
                        .padding(.bottom, 20)
                }
            }
            
            HStack {
                VStack { Divider() }
                Text("or")
                    .foregroundColor(Color(red: 71/255, green: 99/255, blue: 77/255))
                VStack { Divider() }
            }
            .padding(.vertical, 20)
            
            Button(action: {
            }) {
                HStack {
                    Image("applelogo")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Text("Continue with Apple")
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
                    Text("Continue with Google")
                        .foregroundColor(.black)
                        .bold()
                }
                .frame(maxWidth: 250, maxHeight: 20)
                .padding()
                .background(Color(red: 244/255, green: 244/255, blue: 244/255))
                .cornerRadius(25)
            }
            .padding(.bottom, 30)
            
            NavigationLink(destination: PreferredNameView()){
                Text("CREATE ACCOUNT")
                    .foregroundColor(.white)
                    .bold()
                    .frame(maxWidth: 200)
                    .padding()
                    .background(Color(red: 179/255, green: 189/255, blue: 182/255))
                    .cornerRadius(20)
            }
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true) // Hide the back button
    }
}

struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateanAccountView()
    }
}
