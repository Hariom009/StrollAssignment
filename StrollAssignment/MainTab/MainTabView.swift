import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    
    
    init() {
     
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Background color (#0F1115)
        appearance.backgroundColor = UIColor(red: 15/255, green: 17/255, blue: 21/255, alpha: 1)
        
        // Unselected item (white with 0.5 opacity)
        let unselectedColor = UIColor(white: 1.0, alpha: 0.5)
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor]
        
        // Selected item (#B5B2FF)
        let selectedColor = UIColor(red: 181/255, green: 178/255, blue: 255/255, alpha: 1)
        appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedColor]
        
        // Badge styling - keep background color, black text with semibold font
        appearance.stackedLayoutAppearance.normal.badgeBackgroundColor = selectedColor
        appearance.stackedLayoutAppearance.normal.badgeTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize, weight: .semibold)
        ]
        
        appearance.stackedLayoutAppearance.selected.badgeBackgroundColor = selectedColor
        appearance.stackedLayoutAppearance.selected.badgeTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize, weight: .semibold)
        ]
        
        // Apply appearance
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CardsView()
                .tag(0)
                .tabItem {
                    Image("card")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    Text("Cards")
                }
                .badge(10)
            
            BonfireView()
                .tag(1)
                .tabItem {
                    Image("bonfire")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    Text("Bonfire")
                }
            
            MatchView()
                .tag(2)
                .tabItem {
                    Image("chat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    Text("Matches")
                }
            
            ProfileView()
                .tag(3)
                .tabItem {
                    Image("profile")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainTabView()
}
