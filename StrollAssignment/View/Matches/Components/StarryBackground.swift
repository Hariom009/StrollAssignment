import SwiftUI

struct StarryBackground: View {
    var body: some View {
        ZStack {
            // Base black background
            Color.black
                .ignoresSafeArea()
            
            // Random white dots only on top
            GeometryReader { geo in
                let width = geo.size.width
                let height = geo.size.height / 3 // only top area
                
                Canvas { context, size in
                    for _ in 0..<40 { // number of dots
                        let x = CGFloat.random(in: 0...width)
                        let y = CGFloat.random(in: 0...height)
                        let radius = CGFloat.random(in: 1...3)
                        
                        var circle = Path()
                        circle.addEllipse(in: CGRect(x: x, y: y, width: radius, height: radius))
                        
                        context.fill(circle, with: .color(.white.opacity(0.3)))
                    }
                }
                .frame(height: height)
                .frame(maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

#Preview {
    StarryBackground()
}
