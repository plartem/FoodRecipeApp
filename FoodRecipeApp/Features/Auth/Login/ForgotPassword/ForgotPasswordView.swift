//
//  ForgotPasswordView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import Foundation
import PopupView
import SwiftUI

@ViewAction(for: ForgotPasswordFeature.self)
struct ForgotPasswordView: View {
    typealias Feature = ForgotPasswordFeature
    @Bindable var store: StoreOf<Feature>

    @FocusState private var focusedField: Feature.State.Field?

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(L10n.ForgotPassword.title)
                        .headerStyle()
                        .fontWeight(.semibold)
                        .primaryColor()
                        .padding(.bottom, .Padding.headerBottom)
                    Text(L10n.ForgotPassword.caption)
                        .normalStyle()
                        .primaryColor()
                        .padding(.bottom, .Padding.formElementBottom)

                    emailField
                }
                .padding(.Padding.content)
            }

            Spacer()
            Divider()
                .defaultStyle()
            Button(L10n.ForgotPassword.continue) {
                send(
                    .continueButtonTapped,
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
            isPresented: $store.showProcessingPopup,
            message: L10n.ForgotPassword.Popup.message
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
            Text(L10n.ForgotPassword.Email.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.email.removeDuplicates(),
                prompt: Text(L10n.ForgotPassword.Email.placeholder)
                    .placeholderStyle()
            )
            .textFieldStyle(BottomBorderTextFieldStyle())
            .textContentType(.emailAddress)
            .keyboardType(.emailAddress)
            .autocapitalization(.none)
            .focused($focusedField, equals: .email)
            .submitLabel(.next)
            .id(Feature.State.Field.email)
            .onSubmit {
                send(.textFieldSubmitted)
            }
            .padding(.bottom, .Padding.formElementBottom)
        }
    }
}

#if DEBUG
    #Preview {
        ForgotPasswordView(
            store: Store(initialState: ForgotPasswordFeature.State()) {
                ForgotPasswordFeature()
            })
    }
#endif
