
// MARK: - ChatListView.swift
import SwiftUI

struct ChatListView: View {
    let chats = [
        ChatItem(
            name: "Jessica",
            message: "New chat",
            time: "6:21 pm",
            profileImage: "dp_1",
            hasVoiceNote: true,
            voiceDuration: "00:58",
            isStarred: true,
            messageType: .newChat,
            isNewChat: true
        ),
        ChatItem(
            name: "Amanda",
            message: "Lol I love house music too",
            time: "6:21 pm",
            profileImage: "dp_2",
            hasVoiceNote: false,
            isYourMove: true,
            messageType: .text,
            isUnread: true
        ),
        ChatItem(
            name: "Sila",
            message: "You: I love the people there tbh, have you been?",
            time: "Wed",
            profileImage: "dp_3",
            hasVoiceNote: false,
            messageType: .sent
        ),
        ChatItem(
            name: "Marie",
            message: "Hahaha that's interesting, it does seem like people here are startin...",
            time: "6:21 pm",
            profileImage: "dp_4",
            hasVoiceNote: false,
            isYourMove: true,
            unreadCount: 4,
            messageType: .text,
            isUnread: true
        ),
        ChatItem(
            name: "Jessica",
            message: "Your move",
            time: "6:21 pm",
            profileImage: "dp_5",
            hasVoiceNote: false,
            isYourMove: true,
            messageType: .yourMove,
            isGrayed: true
        )
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header with proper spacing
            VStack(alignment: .leading, spacing: 12) {
                HStack(spacing: 28) {
                    VStack(alignment: .leading, spacing: 4){
                        Text("Chats")
                            .font(.system(size: 22, weight: .semibold, design: .default))
                            .foregroundColor(.white)
                        Rectangle()
                            .foregroundStyle(.white)
                            .frame(width: 60, height: 2)
                    }
                    
                    Text("Pending")
                        .font(.system(size: 22, weight: .semibold, design: .default))
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                
                Text("The ice is broken. Time to hit it off")
                    .font(.system(size: 11, weight: .medium, design: .default))
                    .foregroundStyle(Color.white.opacity(0.6))
                    .italic()
            }
            .padding(.horizontal, 16)
            .padding(.top, 8)
            .padding(.bottom, 16)
            
            // Chat List with proper spacing
            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(chats) { chat in
                        ChatRowView(chat: chat)
                            .padding(.horizontal, 16)
                        
                        if chat.id != chats.last?.id {
                            Divider()
                                .background(Color.gray.opacity(0.2))
                                .padding(.leading, 72)
                        }
                    }
                }
            }
        }
    }
}

struct ChatRowView: View {
    let chat: ChatItem
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile Image - larger and properly positioned
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.green, .blue, .purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 56, height: 56)
                
                Image(chat.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 56, height: 56)
                    .clipShape(.circle)
            }
            
            // Chat Content with better alignment
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .center) {
                    Text(chat.name)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .foregroundColor(chat.isGrayed ? .gray : .white)
                    
                    // Your move badge or new chat badge
                    if chat.isYourMove && !chat.isGrayed {
                        Text("Your move")
                            .font(.system(size: 10, weight: .medium, design: .default))
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.white.opacity(0.15))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    } else if chat.isNewChat {
                        HStack(spacing: 3) {
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 4, height: 4)
                            Text("New chat")
                                .font(.system(size: 10, weight: .medium, design: .default))
                        }
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color(red: 181/255, green: 178/255, blue: 255/255).opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    
                    Spacer()
                    
                    // Time with proper styling
                    Text(chat.time)
                        .font(.system(size: 11, weight: .bold, design: .default))
                        .foregroundStyle(chat.time == "Wed" ? Color.white : Color(red: 181/255, green: 178/255, blue: 255/255))
                        .opacity(0.7)
                }
                
                HStack(alignment: .center) {
                    // Voice note or message with proper spacing
                    if chat.hasVoiceNote {
                        HStack(spacing: 6) {
                            Image(systemName: "mic.fill")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(
                                    LinearGradient(colors: [Color(red: 181/255, green: 178/255, blue: 255/255),Color(red: 181/255, green: 178/255, blue: 255/255).opacity(0.8)], startPoint: .top, endPoint: .bottom)
                                )
                            
                            // Audio waveform representation
                            HStack(spacing: 1.5) {
                                ForEach(0..<8, id: \.self) { _ in
                                    Rectangle()
                                        .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                                        .frame(width: 2.5, height: CGFloat.random(in: 6...16))
                                        .cornerRadius(1.25)
                                }
                            }
                            
                            Text(chat.voiceDuration ?? "")
                                .font(.system(size: 14, weight: .medium, design: .default))
                                .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                        }
                    } else {
                        Text(chat.message)
                            .font(.system(size: 14, weight: chat.isUnread ? .medium : .regular, design: .default))
                            .foregroundColor(chat.isUnread ? .white : .gray)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    // Unread count or star with proper sizing
                    if let unreadCount = chat.unreadCount {
                        Text("\(unreadCount)")
                            .font(.system(size: 12, weight: .semibold, design: .default))
                            .foregroundStyle(.black)
                            .frame(width: 24, height: 18)
                            .background(
                                RoundedRectangle(cornerRadius: 9)
                                    .fill(Color(red: 181/255, green: 178/255, blue: 255/255))
                            )
                    } else if chat.isStarred {
                        Image(systemName: "star.fill")
                            .font(.system(size: 8, weight: .thin))
                            .foregroundStyle(.black)
                            .frame(width: 24, height: 18)
                            .background(
                                RoundedRectangle(cornerRadius: 9)
                                    .fill(Color(red: 181/255, green: 178/255, blue: 255/255))
                            )
                    }
                }
                .padding(.top, 1)
            }
        }
        .padding(.vertical, 10)
    }
}

struct ChatItem: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
    let profileImage: String
    let hasVoiceNote: Bool
    let voiceDuration: String?
    let isStarred: Bool
    let isYourMove: Bool
    let unreadCount: Int?
    let messageType: MessageType
    let isGrayed: Bool
    let isUnread: Bool
    let isNewChat: Bool
    
    init(name: String, message: String, time: String, profileImage: String, hasVoiceNote: Bool, voiceDuration: String? = nil, isStarred: Bool = false, isYourMove: Bool = false, unreadCount: Int? = nil, messageType: MessageType, isGrayed: Bool = false, isUnread: Bool = false, isNewChat: Bool = false) {
        self.name = name
        self.message = message
        self.time = time
        self.profileImage = profileImage
        self.hasVoiceNote = hasVoiceNote
        self.voiceDuration = voiceDuration
        self.isStarred = isStarred
        self.isYourMove = isYourMove
        self.unreadCount = unreadCount
        self.messageType = messageType
        self.isGrayed = isGrayed
        self.isUnread = isUnread
        self.isNewChat = isNewChat
    }
}

enum MessageType {
    case newChat
    case text
    case sent
    case yourMove
}

#Preview {
    ChatListView()
        .preferredColorScheme(.dark)
}
