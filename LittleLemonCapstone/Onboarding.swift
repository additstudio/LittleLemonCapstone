import SwiftUI
import UIKit

struct Onboarding: View {
    @State var firstName:String = ""
    @State var lastName:String = ""
    @State var email:String=""
    @State var showAlert:Bool = false
    @State var isLoggedin = false
    
    @FocusState private var focus: formFieldFocus?
    
    var defaults = UserDefaults.standard
    
    enum formFieldFocus: Hashable {
        case firstName, lastName, email;
    }
    
    enum validateInfoError: Error {
        case firstNameEmpty
        case lastNameEmpty
        case emailEmpty
    }
    
    @State var errorMessage: String = ""
    @State var successMessage: String = ""
    
    func validateInfo(firstName: String, lastName: String, email: String) throws {
        if firstName.isEmpty {
            throw validateInfoError.firstNameEmpty
        }
        if lastName.isEmpty {
            throw validateInfoError.lastNameEmpty
        }
        if email.isEmpty {
            throw validateInfoError.emailEmpty
        }
        else {
            defaults.set(firstName, forKey: "FirstNameKey")
            defaults.set(lastName, forKey: "kLastNameKey")
            defaults.set(email, forKey: "EmailKey")
            isLoggedin=true
        }
    }
    
     func submit() {
        do {
            try validateInfo(firstName: firstName, lastName: lastName, email: email)
        }
        
        catch validateInfoError.firstNameEmpty {
            errorMessage = "First name is empty"
            showAlert = true
        }
        
        catch validateInfoError.lastNameEmpty {
            errorMessage = "Last name is empty"
            showAlert = true
        }
        
        catch validateInfoError.emailEmpty {
            errorMessage = "Email is empty"
            showAlert = true
        }
        
        catch {
        }
        
    }
    
    var body: some View {
        
        NavigationView{
            VStack{
                Text("Please Login to continue")
                    .fontWeight(.bold)
                    .padding()
                VStack{
                    TextField("First Name", text:$firstName)
                        .focused($focus, equals: .firstName)
                        .onSubmit {
                            focus = .lastName
                        }
                    TextField("Last Name", text:$lastName)
                        .focused($focus, equals: .lastName)
                        .onSubmit {
                            focus = .email
                        }
                    TextField("Email", text:$email)
                        .focused($focus, equals: .email)
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                
                
                Button("Login"){
                    submit()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                .buttonStyle(.borderedProminent)
                
            }
        }
        .navigationDestination(isPresented: $isLoggedin) { Home()}
    }
}

