
// MARK: - MatchView.swift
import SwiftUI

struct MatchView: View {
    var body: some View {
        ZStack {
            StarryBackground()
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 8) {
                    navTitleHeader
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            StoryCardFirst(text: "Amanda", description: "What is your most favourite childhood memory?", age: 22)
                            StoryCard(text: "Malte", description: "What is the most important quality in friendship to you?", age: 31)
                            StoryCard(text: "Amanda", description: "What is your most favourite childhood memory?", age: 22)
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    ChatListView()
                        .background(Color.black)
                }
            }
        }
    }
    
    private var navTitleHeader: some View {
        HStack(alignment: .center) { // center alignment instead of top
            VStack(alignment: .leading, spacing: 6) {
                HStack(spacing: 8) {
                    Text("Your Turn")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                    ZStack {
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                        Text("7")
                            .font(.system(size: 10, weight: .bold))
                            .foregroundStyle(.black)
                    }
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(Color.white.opacity(0.6))
                    .italic()
            }
            Spacer()
            ProfileScoreView()
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

}

#Preview {
    MatchView()
}
