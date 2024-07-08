//
//  RegistrationView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import SwiftUI

@ViewAction(for: RegistrationFeature.self)
struct RegistrationView: View {
    typealias Feature = RegistrationFeature
    @Bindable var store: StoreOf<Feature>

    @FocusState private var focusedField: Feature.State.Field?

    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(L10n.Registration.title)
                            .headerStyle()
                            .fontWeight(.semibold)
                            .primaryColor()
                            .padding(.bottom, .Padding.headerBottom)
                        Text(L10n.Registration.caption)
                            .normalStyle()
                            .primaryColor()
                            .padding(.bottom, .Padding.formElementBottom)

                        emailField
                        passwordField
                        confirmPasswordField

                        ThirdPartyAuthProvidersView {
                            send(.thirdPartyAuthButtonTapped($0))
                        }
                        .padding(.top, 16.0)
                    }
                    .padding(.Padding.content)
                    .onChange(of: focusedField) { _, val in
                        guard let val else { return }
                        withAnimation {
                            proxy.scrollTo(val, anchor: .bottom)
                        }
                    }
                }
            }

            Divider()
                .defaultStyle()
            Button(L10n.Registration.BottomBar.signup) {
                send(
                    .signUpButtonTapped,
                    animation: .default
                )
            }
            .buttonStyle(.primary)
            .disabled(store.disableProceedButton)
            .padding(.Padding.content)
        }
        .background(Asset.primaryBackground.swiftUIColor)
        .task {
            await send(.task).finish()
        }
        .loadingPopup(
            isPresented: $store.showRegisteringPopup,
            message: L10n.Registration.Popup.message
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
    }

    private var emailField: some View {
        Group {
            Text(L10n.Registration.Email.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.email.removeDuplicates(),
                prompt: Text(L10n.Registration.Email.placeholder)
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
            Text(L10n.Registration.Password.label)
                .textFieldLabelStyle()
            SecureToggleTextField(
                L10n.Registration.Password.placeholder,
                text: $store.password.removeDuplicates(),
                prompt: Text(L10n.Registration.Password.placeholder)
                    .placeholderStyle()
            )
            .customizeTextField(onSubmitNoHideKeyboard: {
                send(.textFieldSubmitted)
            })
            .textContentType(.newPassword)
            .focused($focusedField, equals: .password)
            .submitLabel(.next)
            .id(Feature.State.Field.password)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }

    private var confirmPasswordField: some View {
        Group {
            Text(L10n.Registration.ConfirmPassword.label)
                .textFieldLabelStyle()
            SecureToggleTextField(
                L10n.Registration.ConfirmPassword.placeholder,
                text: $store.confirmPassword.removeDuplicates(),
                prompt: Text(L10n.Registration.ConfirmPassword.placeholder)
                    .placeholderStyle()
            )
            .customizeTextField(onSubmitNoHideKeyboard: {
                send(.textFieldSubmitted)
            })
            .textContentType(.password)
            .focused($focusedField, equals: .confirmPassword)
            .submitLabel(.done)
            .id(Feature.State.Field.confirmPassword)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }
}

#if DEBUG
    #Preview {
        RegistrationView(
            store: Store(
                initialState: RegistrationFeature.State(),
                reducer: {
                    EmptyReducer()
                }))
    }
#endif
