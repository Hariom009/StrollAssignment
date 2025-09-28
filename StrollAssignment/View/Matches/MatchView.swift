//
//  MatchView.swift
//  StrollAssignment
//
//  Created by Hari's Mac on 28.09.2025.
//

import SwiftUI

struct MatchView: View {
    var body: some View {
        ZStack{
            StarryBackground()
            VStack(alignment: .leading,spacing: 12){
                navTitleHeader
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 12){
                        StoryCardFirst(text: "Amanda", description: "What is your most favourite childhood memory?", age: 22)
                        StoryCard(text: "Malte", description: "What is the most important quality in friendship to you?", age: 31)
                        StoryCard(text: "Amanda", description: "What is your most favourite childhood memory?", age: 22)
                    }
                }
                
                ChatListView()
            }
        }
    }
    
    private var navTitleHeader: some View {
        HStack{
            VStack(alignment: .leading,spacing: 8){
                HStack(spacing: 8){
                    Text("Your Turn")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    ZStack{
                        Circle()
                            .frame(width: 20,height: 20)
                            .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                        Text("7")
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .foregroundStyle(.black)
                        
                    }
                }
                Text("Make your move ,they are waiting🎵")
                    .font(.system(size: 12,weight: .semibold))
                    .foregroundStyle(Color.white.opacity(0.6))
                    .italic()
            }
            Spacer()
            ProfileScoreView()
        }
        .padding()
    }
    private var chatAndPendingPicker: some View {
        HStack{
            VStack{
                Text("Chats")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                    .foregroundStyle(.white)
            }
            
            Text("Pending")
                .font(.system(size: 32, weight: .semibold, design: .default))
                .foregroundStyle(.white)
        }
    }
}



#Preview {
    MatchView()
}
