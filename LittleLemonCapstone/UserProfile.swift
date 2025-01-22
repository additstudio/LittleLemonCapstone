import SwiftUI
import UIKit

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation
    
    var firstName = UserDefaults.standard.string(forKey: "FirstNameKey")
    var lastName = UserDefaults.standard.string(forKey: "kLastNameKey")
    var email = UserDefaults.standard.string(forKey: "EmailKey")

    func logout() {
        UserDefaults.standard.set(false,forKey: "FirstNameKey")
        UserDefaults.standard.set(false,forKey: "kLastNameKey")
        UserDefaults.standard.set(false,forKey: "EmailKey")
        self.presentation.wrappedValue.dismiss()
    }
    
    
    
    var body: some View
    {
    VStack {
        
        Text("Personal Information")
            .font(.headline)
            .padding()
        VStack {
                
            VStack{
                Image("profile-image-placeholder")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .frame(width: 200, height: 200, alignment: .center)
            .padding()
            Text("Name : \(firstName ?? "") \(lastName ?? "")")
                .font(.subheadline)
            Text("Email: \(email ?? "")")
                .font(.subheadline)
        }
        .padding()
        Button("Logout") {
            logout()
        }
        .buttonStyle(.borderedProminent)
    }
    
    }
    
}
