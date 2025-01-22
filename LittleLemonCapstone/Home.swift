import SwiftUI
import UIKit

struct Home: View {
    
var body: some View {
    TabView {
        Menu()
            .tabItem({Label("Menu", systemImage: "list.dash")})
            .navigationBarTitle("Menu")
        UserProfile()
            .tabItem({Label("Profile", systemImage: "square.and.pencil")})
            .navigationBarTitle("Profile")
    }
    .navigationBarBackButtonHidden(true)
    }
    
}
