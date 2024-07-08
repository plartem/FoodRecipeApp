//
//  LoginView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import PopupView
import SwiftUI

@ViewAction(for: LoginFeature.self)
struct LoginView: View {
    typealias Feature = LoginFeature
    @Bindable var store: StoreOf<Feature>

    @FocusState private var focusedField: Feature.State.Field?

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(L10n.Login.title)
                        .headerStyle()
                        .fontWeight(.semibold)
                        .primaryColor()
                        .padding(.bottom, .Padding.headerBottom)
                    Text(L10n.Login.caption)
                        .normalStyle()
                        .primaryColor()
                        .padding(.bottom, .Padding.formElementBottom)

                    emailField
                    passwordField

                    Text(L10n.Login.forgotPassword)
                        .normalStyle()
                        .bold()
                        .foregroundColor(Asset.accentColor.swiftUIColor)
                        .padding(.bottom, .Padding.formElementBottom)
                        .onTapGesture {
                            send(.forgotPasswordButtonTapped)
                        }

                    ThirdPartyAuthProvidersView {
                        send(.thirdPartyAuthButtonTapped($0))
                    }
                }
                .padding(.Padding.content)
            }

            Spacer()
            Divider()
                .defaultStyle()
            Button(L10n.Login.signIn) {
                send(
                    .signInButtonTapped,
                    animation: .default
                )
            }
            .buttonStyle(.primary)
            .padding(.Padding.content)
        }
        .background(Asset.primaryBackground.swiftUIColor)
        .task {
            await send(.task).finish()
        }
        .loadingPopup(
            isPresented: $store.showLoginPopup,
            message: L10n.Login.Popup.message
        )
        .bind($store.focusedField, to: $focusedField)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackSymbolButton {
                    send(.backButtonTapped)
                }
            }
        }
        .navigationDestination(
            item: $store.scope(
                state: \.destination?.forgotPassword,
                action: \.destination.forgotPassword)
        ) { store in
            ForgotPasswordView(store: store)
        }
    }

    private var emailField: some View {
        Group {
            Text(L10n.Login.Email.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.email.removeDuplicates(),
                prompt: Text(L10n.Login.Email.placeholder)
                    .placeholderStyle()
            )
            .customizeTextField(onSubmitNoHideKeyboard: {
                send(.textFieldSubmitted)
            })
            .textFieldStyle(BottomBorderTextFieldStyle())
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .focused($focusedField, equals: .email)
            .submitLabel(.next)
            .id(Feature.State.Field.email)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }

    private var passwordField: some View {
        Group {
            Text(L10n.Login.Password.label)
                .textFieldLabelStyle()
            SecureToggleTextField(
                L10n.Login.Password.placeholder,
                text: $store.password.removeDuplicates(),
                prompt: Text(L10n.Login.Password.placeholder)
                    .placeholderStyle()
            )
            .customizeTextField(onSubmitNoHideKeyboard: {
                send(.textFieldSubmitted)
            })
            .textContentType(.password)
            .focused($focusedField, equals: .password)
            .submitLabel(.done)
            .id(Feature.State.Field.password)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }
}

#if DEBUG
    #Preview {
        LoginView(
            store: Store(initialState: LoginFeature.State()) {
                LoginFeature()
            })

    }
#endif
