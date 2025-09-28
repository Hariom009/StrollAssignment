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
                    Text("Cards")
                }
            
            BonfireView()
                .tag(1)
                .tabItem {
                    Image("bonfire")
                    Text("Bonfire")
                }
            
            MatchView()
                .tag(2)
                .tabItem {
                    Image("chat")
                    Text("Matches")
                }
            
            ProfileView()
                .tag(3)
                .tabItem {
                    Image("profile")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    MainTabView()
}
