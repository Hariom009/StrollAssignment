//
//  StoryCard.swift
//  StrollAssignment
//
//  Created by Hari's Mac on 28.09.2025.
//

import SwiftUI

struct StoryCard: View {
    var text: String
    var description: String
    var age: Int
    var gradientColors: [Color] = [
        Color(red: 0.76, green: 0.55, blue: 0.35),
        Color.black
    ]
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                colors: gradientColors,
                startPoint: .top,
                endPoint: .bottom
            )
            
            VStack(spacing: 0) {
                // Top notification
                HStack {
                    Spacer()
                    Text("📣 They made a move!")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.black.opacity(0.8))
                        )
                    Spacer()
                }
                .padding(.top, 20)
                
                Spacer()
                
                // "Tap to answer" text in the middle
                Text("Tap to answer")
                    .font(.system(size: 12, weight: .bold,design: .rounded))
                    .foregroundStyle(Color.white.opacity(0.6))
                
                Spacer()
                
                // Bottom content
                VStack(spacing: 12) {
                    Text("\(text), \(age)")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text(description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 32)
            }
        }
        .frame(width: 190, height: 290)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 8)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        StoryCard(
            text: "Malte",
            description: "What is the most important quality in friendships to you?",
            age: 31
        )
    }
}
