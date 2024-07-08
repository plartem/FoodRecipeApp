//
//  OnboardingExtraInfoView.swift
//  FoodRecipeApp
//

import ComposableArchitecture
import PhotosUI
import SwiftUI

@ViewAction(for: OnboardingExtraInfoFeature.self)
struct OnboardingExtraInfoView: View {
    typealias Feature = OnboardingExtraInfoFeature
    @Bindable var store: StoreOf<Feature>

    @FocusState var focusedField: Feature.State.Field?

    var body: some View {
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(L10n.Onboarding.Extra.title)
                            .headerStyle()
                            .fontWeight(.semibold)
                            .primaryColor()
                            .padding(.bottom, .Padding.headerBottom)
                        Text(L10n.Onboarding.Extra.caption)
                            .normalStyle()
                            .primaryColor()
                            .padding(.bottom, .Padding.formElementBottom)

                        profileImagePicker
                        usernameField
                        fullNameField
                        phoneNumberField
                        genderField
                        birthDateField
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
            Button(L10n.Onboarding.BottomBar.proceed) {
                send(
                    .proceedButtonTapped,
                    animation: .default
                )
            }
            .disabled(store.disableProceedButton)
            .animation(.default, value: store.disableProceedButton)
            .buttonStyle(.primary)
            .padding([.horizontal, .top], .Padding.content)
            .padding(.bottom, 8.0)
        }
        .background(Asset.primaryBackground.swiftUIColor)
        .fixDatePickerParentKeyboard()
        .task {
            send(.task)
        }
        .bind($store.focusedField, to: $focusedField)
    }

    private var profileImagePicker: some View {
        HStack {
            Spacer()
            PhotosPicker(
                selection: $store.profileImageItem,
                matching: .images,
                photoLibrary: .shared()
            ) {
                ZStack(alignment: .bottomTrailing) {
                    GeometryReader { geometry in
                        ZStack {
                            Image(
                                uiImage: store.profileImage ?? Asset.defaultProfileImage.image
                            )
                            .resizable()
                            .scaledToFill()
                            .clipShape(
                                Circle()
                            )
                            .frame(
                                width: 100.0,
                                height: 100.0
                            )
                            if store.isProfileImageLoading {
                                ActivityIndicator()
                                    .frame(
                                        width: geometry.size.width / 2,
                                        height: geometry.size.height / 2)
                            }
                        }
                    }
                    Image(systemSymbol: .pencil)
                        .smallStyle()
                        .fontWeight(.black)
                        .padding(3.0)
                        .tint(Asset.primaryBackground.swiftUIColor)
                        .background(Asset.accentColor.swiftUIColor)
                        .clipShape(
                            .rect(
                                cornerRadius: 5.0
                            )
                        )
                }
                .frame(
                    width: 100.0,
                    height: 100.0
                )
            }
            Spacer()
        }
        .padding(.bottom, .Padding.formElementBottom)
    }

    private var usernameField: some View {
        Group {
            Text(L10n.Onboarding.Extra.Username.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.username.removeDuplicates(),
                prompt: Text(L10n.Onboarding.Extra.Username.placeholder).placeholderStyle()
            )
            .customizeTextField(onSubmitNoHideKeyboard: {
                send(.textFieldSubmitted)
            })
            .textFieldStyle(BottomBorderTextFieldStyle())
            .textContentType(.username)
            .focused($focusedField, equals: .username)
            .submitLabel(.next)
            .id(Feature.State.Field.username)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }

    private var fullNameField: some View {
        Group {
            Text(L10n.Onboarding.Extra.FullName.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.fullName.removeDuplicates(),
                prompt: Text(L10n.Onboarding.Extra.FullName.placeholder)
                    .placeholderStyle()
            )
            .customizeTextField(onSubmitNoHideKeyboard: {
                send(.textFieldSubmitted)
            })
            .textFieldStyle(BottomBorderTextFieldStyle())
            .textContentType(.name)
            .focused($focusedField, equals: .fullName)
            .submitLabel(.next)
            .id(Feature.State.Field.fullName)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }

    private var phoneNumberField: some View {
        Group {
            Text(L10n.Onboarding.Extra.PhoneNumber.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.phoneNumber.removeDuplicates(),
                prompt: Text(L10n.Onboarding.Extra.PhoneNumber.placeholder)
                    .placeholderStyle()
            )
            .customizeTextField(
                onSubmitNoHideKeyboard: {
                    send(.textFieldSubmitted)
                },
                formatterContext: .init(
                    formatter: PhoneFieldFormatter(),
                    valueBinding: $store.phoneNumber
                )
            )
            .textFieldStyle(
                BottomBorderTextFieldStyle(leading: {
                    Text(store.phoneCode)
                        .mediumStyleNoLineHeight()
                        .fontWeight(.bold)
                })
            )
            .textContentType(.telephoneNumber)
            .keyboardType(.phonePad)
            .focused($focusedField, equals: .phoneNumber)
            .submitLabel(.next)
            .id(Feature.State.Field.phoneNumber)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }

    private var genderField: some View {
        Group {
            Text(L10n.Onboarding.Extra.Gender.label)
                .textFieldLabelStyle()

            BottomBorderPicker(
                store.genders,
                selection: $store.gender,
                placeholder: L10n.Onboarding.Extra.Gender.placeholder,
                row: { gender in
                    Text(gender.localized)
                }
            )
            .padding(.bottom, .Padding.formElementBottom)
        }
    }

    private var birthDateField: some View {
        Group {
            Text(L10n.Onboarding.Extra.BirthDate.label)
                .textFieldLabelStyle()
            TextField(
                "",
                text: $store.birthDateText.removeDuplicates(),
                prompt: Text(store.birthDateFormatter.dateFormat.uppercased())
                    .placeholderStyle()
            )
            .customizeTextField(
                formatterContext: .init(
                    formatter: DateFieldFormatter(
                        dateFormatter: store.birthDateFormatter
                    ),
                    valueBinding: $store.birthDateText)
            )
            .textFieldStyle(
                BottomBorderTextFieldStyle(
                    trailing: {
                        Image(systemSymbol: .calendar)
                            .largeStyle()
                            .foregroundStyle(Asset.accentColor.swiftUIColor)
                            .overlay {
                                DatePicker(
                                    "",
                                    selection: $store.datePickerSelection,
                                    in: store.birthDateRange,
                                    displayedComponents: [.date]
                                )
                                .labelsHidden()
                                .blendMode(.destinationOver)
                                .fixDatePicker()
                            }
                    })
            )
            .textContentType(.dateTime)
            .keyboardType(.numbersAndPunctuation)
            .focused($focusedField, equals: .birthDate)
            .submitLabel(.continue)
            .onSubmit {
                send(.textFieldSubmitted)
            }
            .id(Feature.State.Field.birthDate)
            .padding(.bottom, .Padding.formElementBottom)
        }
    }
}

#if DEBUG
    #Preview {
        OnboardingExtraInfoView(
            store: Store(initialState: OnboardingExtraInfoFeature.State()) {
                OnboardingExtraInfoFeature()
            })
    }
#endif
