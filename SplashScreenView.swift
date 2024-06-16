import SwiftUI

struct SplashScreenView: View {
    @State private var isShowingGettingStartedView = false

    var body: some View {
        ZStack {
            Color(red: 90/255, green: 114/255, blue: 98/255)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("darklogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250, height: 250)
                    .padding(.bottom, 150)
                
                Spacer()
            }
        }
        .opacity(isShowingGettingStartedView ? 0 : 1) //
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.isShowingGettingStartedView = true
            }
        }
        .fullScreenCover(isPresented: $isShowingGettingStartedView) {
            GettingStartedView()
        }
    }
}

// Preview
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
