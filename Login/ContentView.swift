//
//  ContentView.swift
//  Login
//
//  Created by mac on 19/12/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var userName = ""
    @State var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue.ignoresSafeArea()
                Circle().scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle().scale(1.35)
                    .foregroundColor(.white)
                VStack {
                    Text("Login")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .padding()
                    TextField("Username", text: $userName)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .frame(width: 300, height: 50)
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))

                    Button("Login") {
                        authenticatUser(userName: userName, password: password)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    NavigationLink(destination:Text("You are logged in"),isActive: $showingLoginScreen){
                        EmptyView()
                    }
                }
            }
        }
    }

    func authenticatUser(userName: String, password: String) {
        if userName.lowercased() == "admin" {
            wrongUsername = 0
            if password.lowercased() == "admin" {
                wrongPassword = 0
                showingLoginScreen=true
            }else{
                wrongPassword = 1
            }
            
        }else{
            wrongUsername = 1
        }
    }
}

#Preview {
    ContentView()
}
