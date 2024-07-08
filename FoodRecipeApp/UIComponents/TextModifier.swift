//
//  TextModifier.swift
//  FoodRecipeApp
//

import SwiftUI

struct FontWithLineHeight: ViewModifier {
    let font: UIFont
    let lineHeight: CGFloat

    func body(content: Content) -> some View {
        content
            .font(Font(font))
            .lineSpacing(lineHeight - font.lineHeight)
    }
}

extension SwiftUI.Font {
    static func urbanist(size: CGFloat) -> SwiftUI.Font {
        FontFamily.Urbanist.regular.swiftUIFont(size: size)
    }
}

extension UIFont {
    static func urbanist(size: CGFloat) -> UIFont {
        FontFamily.Urbanist.regular.font(size: size)
    }
}

// MARK: - View extension

extension View {
    func fontWithLineHeight(font: UIFont, lineHeight: CGFloat) -> some View {
        modifier(FontWithLineHeight(font: font, lineHeight: lineHeight))
    }

    // MARK: Foreground color modifiers

    func primaryColor() -> some View {
        foregroundColor(Asset.primaryColor.swiftUIColor)
    }

    func secondaryColor() -> some View {
        foregroundColor(Asset.secondaryColor.swiftUIColor)
    }

    func tertiaryColor() -> some View {
        foregroundColor(Asset.tertiaryColor.swiftUIColor)
    }

    // MARK: Urbanist font modifiers

    func titleStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.title),
            lineHeight: .LineHeight.title)
    }

    func headerStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.header),
            lineHeight: .LineHeight.header)
    }

    func subheaderStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.subheader),
            lineHeight: .LineHeight.subheader)
    }

    func largeStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.large),
            lineHeight: .LineHeight.large)
    }

    func mediumStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.medium),
            lineHeight: .LineHeight.medium)
    }

    func normalStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.normal),
            lineHeight: .LineHeight.normal)
    }

    func smallStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.small),
            lineHeight: .LineHeight.small)
    }

    func extraSmallStyle() -> some View {
        fontWithLineHeight(
            font: .urbanist(size: .FontSize.extraSmall),
            lineHeight: .LineHeight.extraSmall)
    }

    func titleStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.title))
    }

    func headerStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.header))
    }

    func subheaderStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.subheader))
    }

    func largeStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.large))
    }

    func mediumStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.medium))
    }

    func normalStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.normal))
    }

    func smallStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.small))
    }

    func extraSmallStyleNoLineHeight() -> some View {
        font(.urbanist(size: .FontSize.extraSmall))
    }

    // MARK: Text Field Label Style

    func textFieldLabelStyle() -> some View {
        smallStyle()
            .fontWeight(.bold)
            .padding(.bottom, .Padding.textFieldLabelBottom)
    }
}

// MARK: - Text extension
extension Text {
    // MARK: Foreground color modifiers

    func primaryColor() -> some View {
        foregroundColor(Asset.primaryColor.swiftUIColor)
    }

    func secondaryColor() -> some View {
        foregroundColor(Asset.secondaryColor.swiftUIColor)
    }

    func tertiaryColor() -> some View {
        foregroundColor(Asset.tertiaryColor.swiftUIColor)
    }

    // MARK: Urbanist font modifiers

    func titleStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.title))
    }

    func headerStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.header))
    }

    func subheaderStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.header))
    }

    func largeStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.large))
    }

    func mediumStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.medium))
    }

    func normalStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.normal))
    }

    func smallStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.small))
    }

    func extraSmallStyleNoLineHeight() -> Text {
        font(.urbanist(size: .FontSize.extraSmall))
    }

    // MARK: Text Field Label Style

    func placeholderStyle() -> Text {
        mediumStyleNoLineHeight()
            .fontWeight(.bold)
            .foregroundColor(Asset.secondaryColor.swiftUIColor)
    }
}

// MARK: - Constants

extension CGFloat {
    enum FontSize {
        static let title: CGFloat = 50.0
        static let header: CGFloat = 32.0
        static let subheader: CGFloat = 24.0
        static let large: CGFloat = 20.0
        static let medium: CGFloat = 18.0
        static let normal: CGFloat = 16.0
        static let small: CGFloat = 14.0
        static let extraSmall: CGFloat = 8.0
    }
    enum LineHeight {
        static let title: CGFloat = 75.0
        static let header: CGFloat = 48.0
        static let subheader: CGFloat = 36.0
        static let large: CGFloat = 30.0
        static let medium: CGFloat = 27.0
        static let normal: CGFloat = 24.0
        static let small: CGFloat = 21.0
        static let extraSmall: CGFloat = 12.0
    }
}

// MARK: - Preview
#if DEBUG
    #Preview {
        ScrollView {
            VStack {
                Group {
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .titleStyle()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .headerStyle()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .subheaderStyle()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .largeStyle()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .mediumStyle()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .normalStyle()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .smallStyle()
                }
                .border(.red)
                Group {
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .titleStyleNoLineHeight()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .headerStyleNoLineHeight()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .subheaderStyleNoLineHeight()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .largeStyleNoLineHeight()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .mediumStyleNoLineHeight()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .normalStyleNoLineHeight()
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    )
                    .smallStyleNoLineHeight()
                }
                .border(.yellow)
            }
        }
    }
#endif
