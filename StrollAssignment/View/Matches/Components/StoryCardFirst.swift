//
//  StoryCard.swift
//  StrollAssignment
//
//  Created by Hari's Mac on 28.09.2025.
//

import SwiftUI

struct StoryCardFirst: View {
    var text: String
    var description: String
    var age: Int
    
    var body: some View {
        ZStack {
            // Background gradient matching the exact image
            LinearGradient(
                colors: [
                    Color(red: 0.4, green: 0.8, blue: 0.65),   // Bright teal-green top
                    Color.black // Very dark bottom
                ],
                startPoint: .topLeading,
                endPoint: .bottom
            )
            
            .overlay(
                // Purple overlay from right side
                LinearGradient(
                    colors: [
                        Color.purple.opacity(0.7),
                        Color.purple.opacity(0.4),  // Strong purple
                        Color.gray.opacity(0.2),
                        Color.gray.opacity(0.1)
                    ],
                    startPoint: .topTrailing,
                    endPoint: .leading
                )
                .mask(
                    LinearGradient(
                        colors: [Color.black, Color.clear],
                        startPoint: .trailing,
                        endPoint: .leading
                    )
                )
            )
            
            VStack(spacing: 0) {
                // Top section - reserve space even when empty
                VStack {
                    // Empty space to match the height of notification in StoryCard
                    Color.clear
                        .frame(height: 46) // 20 (top padding) + 26 (notification height with padding)
                }
                
                Spacer()
                
                // "Tap to answer" text in the middle
                Text("Tap to answer")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundStyle(Color.white.opacity(0.6))
                
                Spacer()
                
                // Bottom content
                VStack(spacing: 4) {
                    Text("\(text), \(age)")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundStyle(.white)
                    
                    Text(description)
                        .font(.system(size: 10, weight: .regular))
                        .foregroundStyle(Color.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                }
                .padding(.bottom, 32)
            }
        }
        .frame(width: 160, height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 12, x: 0, y: 8)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        HStack(spacing: 20) {
            StoryCardFirst(
                text: "Amanda",
                description: "What is your most favorite childhood memory?",
                age: 22
            )
            
            StoryCard(
                text: "Malte",
                description: "What is the most important quality in friendships to you?",
                age: 31
            )
        }
    }
}
