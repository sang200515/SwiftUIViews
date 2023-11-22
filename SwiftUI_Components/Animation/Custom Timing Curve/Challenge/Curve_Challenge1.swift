
import SwiftUI

private struct Curve_Challenge1: View {
    @State private var menuSelection = "car"
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)
    private var smallScale: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            backgroundGradient.ignoresSafeArea()
            
            HStack {
                Rectangle()
                    .fill(Color("Accent4"))
                    .frame(width: 60)
                    .ignoresSafeArea()
                
                Spacer()
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Button(action: {
                        menuSelection = "car"
                    }) {
                        Image(systemName: "car.fill")
                    }
                    .background(
                        Circle()
                            .fill(Color("Accent4"))
                            .frame(width: 100, height: 100))
                    .offset(x: menuSelection == "car" ? 0 : -10)
                    .scaleEffect(menuSelection == "car" ? 1 : smallScale)
                    
                    Spacer()
                    
                    Button(action: {
                        menuSelection = "tram"
                    }) {
                        Image(systemName: "tram.fill")
                    }
                    .background(
                        Circle()
                            .fill(Color("Accent4"))
                            .frame(width: 100, height: 100))
                    .offset(x: menuSelection == "tram" ? 0 : -10)
                    .scaleEffect(menuSelection == "tram" ? 1 : smallScale)
                    
                    Spacer()
                    
                    Button(action: {
                        menuSelection = "airplane"
                    }) {
                        Image(systemName: "airplane")
                    }
                    .background(
                        Circle()
                            .fill(Color("Accent4"))
                            .frame(width: 100, height: 100))
                    .offset(x: menuSelection == "airplane" ? 0 : -10)
                    .scaleEffect(menuSelection == "airplane" ? 1 : smallScale)
                    
                    Spacer()
                }
                .tint(Color("Tertiary4"))
                .padding(.horizontal)
                
                Spacer()
            }
        }
        .font(.largeTitle)
        .animation(.timingCurve(0.2, 1, 0.5, 1.5, duration: 0.3), value: menuSelection)
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                menuSelection = ["airplane","car","tram"].randomElement() ?? ""
            }
        }
    }
}

struct Curve_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Curve_Challenge1()
    }
}
