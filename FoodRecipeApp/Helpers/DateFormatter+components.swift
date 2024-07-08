//
//  DateFormatter+extension.swift
//  FoodRecipeApp
//

import Foundation

extension DateFormatter {

    // MARK: - Helper types
    enum DateFormatComponents: String {
        /// 1997
        case yearFull = "yyyy"
        /// 97 (1997)
        case yearShort = "yy"

        /// 7
        case monthDigit = "M"
        /// 07
        case monthDigitPadded = "MM"
        /// Jul
        case monthShort = "MMM"
        /// July
        case monthFull = "MMMM"
        /// J (July)
        case monthLetter = "MMMMM"

        /// 5
        case dayOfMonth = "d"
        /// 05
        case dayOfMonthPadded = "dd"

        /// Sat
        case weekdayShort = "EEE"
        /// Saturday
        case weekdayFull = "EEEE"
        /// S (Saturday)
        case weekdayLetter = "EEEEE"

        /// Localized **13** or **1 PM**, depending on the locale.
        case hour = "j"
        /// 20
        case minute = "m"
        /// 08
        case second = "ss"

        /// CST
        case timeZone = "zzz"
        /// **Central Standard Time** or **CST-06:00** or if full name is unavailable.
        case timeZoneFull = "zzzz"
    }

    // MARK: - Date Formatting

    static func dateFormat(
        from components: [DateFormatComponents],
        locale: Locale = Locale.current
    ) -> String? {
        return DateFormatter.dateFormat(
            fromTemplate: components.map(\.rawValue).joined(separator: " "),
            options: 0,
            locale: locale
        )
    }
}
