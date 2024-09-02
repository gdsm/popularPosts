//
//  LoginView.swift
//  PopularPosts
//
//  Created by Gagandeep on 28/08/24.
//

import Combine
import RxSwift
import SwiftUI

struct LoginView: View {
    
    enum Field: Hashable {
        case username, password
    }
    
    @StateObject private var loginViewModel = LoginViewModel()
    
    @State private var navigationPath = NavigationPath()
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isValidLoginCreds: Bool = false
    @State private var iswaiting: Bool = false
    @State private var errMessage: String?
    @FocusState private var focusedField: Field?
    @State private var userTypeSegmentSelection = 0
    let disposeBag = DisposeBag()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(alignment: .leading, spacing: 20) {
                Text(LocalizedStrings.popularPosts)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                
                // Username Field
                TextField(LocalizedStrings.enterEmail, text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .focused($focusedField, equals: .username)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .password
                    }
                
                // Password Field
                SecureField(LocalizedStrings.enterPassword, text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)
                    .focused($focusedField, equals: .password)
                    .submitLabel(.done)
                    .onSubmit {
                        handleLogin()
                    }
                
                Picker("", selection: $userTypeSegmentSelection) {
                    Text(LocalizedStrings.existingUser).tag(0)
                    Text(LocalizedStrings.newUser).tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Done Button
                Button(action: {
                    handleLogin()
                }) {
                    HStack {
                        Text(LocalizedStrings.done)
                            .foregroundColor(.white)
                            .padding()
                        
                        if iswaiting {
                            ProgressView()
                                .foregroundColor(.white)
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(1)
                                .padding()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .background(isValidLoginCreds ? Color.blue : Color.gray)
                .cornerRadius(8)
                .disabled(!isValidLoginCreds)
                .padding(.top, 20)
                
                Spacer()

                if let err = errMessage {
                    Text(err)
                }

                Spacer()
            }
            .padding()
            .onReceive(Just(username)) { value in
                loginViewModel.email.onNext(value)
            }
            .onReceive(Just(password)) { value in
                loginViewModel.password.onNext(value)
            }
            .onAppear {
                connectListener()
            }
            .navigationDestination(for: AppViews.self) { view in
                switch view {
                case .Posts:
                    PopularPostsView(navigationPath: $navigationPath)
                default:
                    Text("No View")
                }
            }
        }
    }
    
    private func handleLogin() {
        if (iswaiting) {
            // Already waiting for previous login.
            return
        }
        iswaiting = true
        loginViewModel.login(isNewUser: userTypeSegmentSelection == 1).subscribe { value in
            print("Login complete user \(value)")
//            iswaiting = false
            switch value {
            case .success(_):
                errMessage = nil
                navigationPath.append(AppViews.Posts)
            case .failure(let error):
                errMessage = "Error in login. \(error)"
            }
        }
        .disposed(by: disposeBag)
    }
    
    private func connectListener() {
        loginViewModel.isLoginEnabled.subscribe { value in
            isValidLoginCreds = value
        }
        .disposed(by: disposeBag)
    }
}

#Preview {
    LoginView()
}
