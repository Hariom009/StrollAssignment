import SwiftUI

struct ProfileScoreView: View {
    let score: Int = 90
    @State private var animateProgress = false
    
    var progress: Double {
        min(max(Double(score) / 100.0, 0.0), 1.0)
    }
    
    var body: some View {
        VStack(spacing: 18) {
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 4)
                    .frame(width: 60, height: 60)
                
                Circle()
                    .trim(from: 1 - progress, to: animateProgress ? progress : 0)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 6,
                            lineCap: .round
                        )
                    )
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(380)) // Start from top
                    .animation(.easeInOut(duration: 1.0), value: animateProgress)
                Image("dp_5")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
            }
            Text("90")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 60,height: 25)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.black)
                )
                .offset(y:-30)
        }
        .onAppear {
            // Trigger animation when view appears
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
