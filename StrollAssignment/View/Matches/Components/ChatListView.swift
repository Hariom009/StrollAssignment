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
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 0) {
                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(spacing: 20) {
                            VStack(spacing: 0){
                                Text("Chats")
                                    .font(.system(size: 24, weight: .bold,design: .rounded))
                                    .foregroundColor(.white)
                                Rectangle()
                                    .foregroundStyle(.white)
                                    .frame(width: 70,height: 2)
                            }
                            
                            Text("Pending")
                                .font(.system(size: 24, weight: .bold,design: .rounded))
                                .foregroundColor(.gray)
                            
                            Spacer()
                        }
                        
                        Text("The ice is broken. Time to hit it off")
                            .font(.system(size: 12,weight: .semibold))
                            .foregroundStyle(Color.white.opacity(0.6))
                            .italic()
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    
                    // Chat List
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(chats) { chat in
                                ChatRowView(chat: chat)
                                    .padding(.horizontal, 20)
                                
                                if chat.id != chats.last?.id {
                                    Divider()
                                        .background(Color.gray.opacity(0.3))
                                        .padding(.leading, 80)
                                }
                            }
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ChatRowView: View {
    let chat: ChatItem
    
    var body: some View {
        HStack(spacing: 15) {
            // Profile Image
            ZStack {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [.green, .blue, .purple]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 50, height: 50)
                
                Image(chat.profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(.circle)
            }
            
            // Chat Content
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(chat.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(chat.isGrayed ? .gray : .white)
                    // Your move badge or time
                    if chat.isYourMove && !chat.isGrayed {
                        Text("Your move")
                            .font(.caption)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }else if chat.isNewChat{
                        HStack{
                            Circle()
                                .foregroundStyle(.white)
                                .frame(width: 5,height:5)
                            Text("New chat")
                        }
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(red: 181/255, green: 178/255, blue: 255/255).opacity(0.6))
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    Spacer()
                    Text(chat.time)
                        .font(.system(size: 12,weight: .semibold,design: .rounded))
                        .foregroundStyle(chat.time == "Wed" ? Color.white : Color(red: 181/255, green: 178/255, blue: 255/255))
                }
                
                HStack {
                    // Voice note or message
                    if chat.hasVoiceNote {
                        HStack(spacing: 6) {
                            Image(systemName: "mic.fill")
                                .font(.headline)
                                .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                            
                            // Audio waveform representation
                            HStack(spacing: 2) {
                                ForEach(0..<8, id: \.self) { _ in
                                    Rectangle()
                                        .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                                        .frame(width: 3, height: CGFloat.random(in: 8...20))
                                        .cornerRadius(1.5)
                                }
                            }
                            
                            Text(chat.voiceDuration ?? "")
                                .font(.headline)
                                .foregroundStyle(Color(red: 181/255, green: 178/255, blue: 255/255))
                        }
                    } else {
                        Text(chat.message)
                            .font(.subheadline)
                            .fontWeight(chat.isUnread ? .semibold : .regular)
                            .foregroundColor(chat.isUnread ? .white : .gray)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    // Unread count or star
                    if let unreadCount = chat.unreadCount {
                        Text("\(unreadCount)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 20)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 181/255, green: 178/255, blue: 255/255))
                            )
                    } else if chat.isStarred {
                        Image(systemName: "star.fill")
                            .font(.caption2)
                            .fontWeight(.thin)
                            .foregroundStyle(.black)
                            .frame(width: 30, height: 20)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 181/255, green: 178/255, blue: 255/255))
                            )
                    }

                }
            } 
        }
        .padding(.vertical, 12)
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
    
    init(name: String, message: String, time: String, profileImage: String, hasVoiceNote: Bool, voiceDuration: String? = nil, isStarred: Bool = false, isYourMove: Bool = false, unreadCount: Int? = nil, messageType: MessageType, isGrayed: Bool = false,isUnread: Bool = false,isNewChat: Bool = false) {
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
}
