import SwiftUI

struct ProfileScoreView: View {
    let score: Int = 80
    @State private var animateProgress = false
    
    var progress: Double {
        min(max(Double(score) / 100.0, 0.0), 1.0)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Score badge positioned above the circle
            Text("90")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 50, height: 25)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.black)
                )
                .offset(y:55)
                .zIndex(1) // Ensure it appears above the circle
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 4)
                    .frame(width: 60, height: 60)
                
                Circle()
                    .trim(from: 0, to: animateProgress ? progress : 0)
                    .stroke(
                        LinearGradient(colors: [Color.green.opacity(0.1),Color.green.opacity(0.3),Color.green.opacity(0.6)], startPoint: .bottom, endPoint: .top),
                        style: StrokeStyle(
                            lineWidth: 6,
                            lineCap: .round
                        )
                    )
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(410)) // Start from top
                    .animation(.easeInOut(duration: 1.0), value: animateProgress)
                
                Image("dp_5")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
            }
            .offset(y: -10) // Slight overlap with the score badge
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.0)) {
                animateProgress = true
            }
        }
    }
}

// Preview
struct ProfileScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScoreView()
            .preferredColorScheme(.dark)
    }
}
