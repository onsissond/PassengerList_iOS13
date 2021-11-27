// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum PassengerCell {
    /// Plural format key: "%#@years@ • %@ %@"
    internal static func details(_ p1: Int, _ p2: Any, _ p3: Any) -> String {
      return L10n.tr("Strings", "PassengerCell.details", p1, String(describing: p2), String(describing: p3))
    }
  }

  internal enum TitleForHeaderInSection {
    /// Паспорт моряка
    internal static let idSeamanPassport = L10n.tr("Strings", "TitleForHeaderInSection.IDSeamanPassport")
    /// Неросссийский документ
    internal static let nonRussianDocument = L10n.tr("Strings", "TitleForHeaderInSection.NonRussianDocument")
    /// Свидетельство о рождении
    internal static let russianBirthCertificate = L10n.tr("Strings", "TitleForHeaderInSection.RussianBirthCertificate")
    /// Военный билет
    internal static let russianMilitary = L10n.tr("Strings", "TitleForHeaderInSection.RussianMilitary")
    /// Паспорт РФ
    internal static let russianPassport = L10n.tr("Strings", "TitleForHeaderInSection.RussianPassport")
    /// Загранпаспорт РФ
    internal static let russianTravelPassport = L10n.tr("Strings", "TitleForHeaderInSection.RussianTravelPassport")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
