//
//  CustomButtonStyle.swift
//  FoodRecipeApp
//

import SwiftUI

extension ButtonStyle where Self == CustomButtonStyle {
    static var primary: Self {
        return .init(.primary)
    }
    static var secondary: Self {
        return .init(.secondary)
    }
    static var normal: Self {
        return .init(.normal)
    }

    static var primaryIcon: Self {
        return .init(.primary)
    }

    static var primaryIconCircle: Self {
        return .init(.primaryIconCircle)
    }

    static var normalIcon: Self {
        return .init(.normalIcon)
    }
}

struct CustomButtonStyle: ButtonStyle {
    enum ButtonType {
        case primary
        case secondary
        case normal

        case primaryIcon
        case primaryIconCircle
        case normalIcon

        var background: Color {
            switch self {
            case .normal:
                Asset.Button.Normal.background.swiftUIColor
            case .primary:
                Asset.Button.Primary.background.swiftUIColor
            case .secondary:
                Asset.Button.Secondary.background.swiftUIColor
            case .primaryIcon:
                Asset.Button.PrimaryIcon.background.swiftUIColor
            case .primaryIconCircle:
                Asset.Button.PrimaryIconCircle.background.swiftUIColor
            case .normalIcon:
                Asset.Button.NormalIcon.background.swiftUIColor
            }
        }

        var color: Color {
            switch self {
            case .normal:
                Asset.Button.Normal.color.swiftUIColor
            case .primary:
                Asset.Button.Primary.color.swiftUIColor
            case .secondary:
                Asset.Button.Secondary.color.swiftUIColor
            case .primaryIcon:
                Asset.Button.PrimaryIcon.color.swiftUIColor
            case .primaryIconCircle:
                Asset.Button.PrimaryIconCircle.color.swiftUIColor
            case .normalIcon:
                Asset.Button.NormalIcon.color.swiftUIColor
            }
        }

        var border: Color {
            switch self {
            case .normal:
                Asset.Button.Normal.border.swiftUIColor
            case .primary:
                Asset.Button.Primary.border.swiftUIColor
            case .secondary:
                Asset.Button.Secondary.border.swiftUIColor
            case .primaryIcon:
                Asset.Button.PrimaryIcon.border.swiftUIColor
            case .primaryIconCircle:
                Asset.Button.PrimaryIconCircle.border.swiftUIColor
            case .normalIcon:
                Asset.Button.NormalIcon.border.swiftUIColor
            }
        }

        var isIcon: Bool {
            switch self {
            case .primary: false
            case .secondary: false
            case .normal: false
            case .primaryIcon: true
            case .primaryIconCircle: true
            case .normalIcon: true
            }
        }
    }

    let type: ButtonType

    init(_ type: ButtonType) {
        self.type = type
    }

    func makeBody(configuration: Configuration) -> some View {
        CustomButton(configuration: configuration, type: type)
    }

    struct CustomButton: View {
        let configuration: ButtonStyle.Configuration

        private let background: Color
        private let color: Color
        private let border: Color

        let isIcon: Bool

        @Environment(\.isEnabled)
        private var isEnabled: Bool

        init(configuration: Configuration, type: ButtonType) {
            self.configuration = configuration
            self.background = type.background
            self.color = type.color
            self.border = type.border
            self.isIcon = type.isIcon
        }

        var body: some View {
            configuration.label
                .normalStyle()
                .fontWeight(isIcon ? .regular : .bold)
                .frame(maxWidth: isIcon ? nil : .infinity)
                .padding(isIcon ? 8.0 : 16.0)
                .foregroundColor(color)
                .background(background)
                .clipShape(.rect(cornerRadius: .CustomButton.cornerRadius))
                .contentShape(.rect(cornerRadius: .CustomButton.cornerRadius))
                .shadow(
                    color: background.opacity(0.25),
                    radius: 12.0,
                    x: 4.0,
                    y: 8.0
                )
                .overlay {
                    RoundedRectangle(cornerRadius: .CustomButton.cornerRadius)
                        .strokeBorder(border, lineWidth: 1.0)
                    RoundedRectangle(cornerRadius: .CustomButton.cornerRadius)
                        .fill(Asset.Button.disabledOverlayColor.swiftUIColor)
                        .opacity(isEnabled ? 0.0 : 1.0)
                }
                .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
                .opacity(configuration.isPressed ? 0.8 : 1.0)
                .animation(.easeInOut, value: configuration.isPressed)
        }
    }
}

extension CGFloat {
    fileprivate enum CustomButton {
        static let cornerRadius: CGFloat = 100.0
    }
}

// MARK: - Preview
#if DEBUG
    #Preview {
        ForEach(ColorScheme.allCases, id: \.self) { scheme in
            VStack(spacing: 80) {
                Button("primary") {}
                    .buttonStyle(.primary)
                Button("secondary") {}
                    .buttonStyle(.secondary)
                Button("normal") {}
                    .buttonStyle(.normal)
            }
            .padding()
            .preferredColorScheme(scheme)
        }
    }
#endif
