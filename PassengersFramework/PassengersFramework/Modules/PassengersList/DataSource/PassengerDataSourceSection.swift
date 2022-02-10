//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import Foundation

struct PassengerDataSourceSection {
    var sectionHeader: PassengerSectionHeaderView.ViewState
    var items: [PassengerDataSourceItem]
}

#if DEBUG
extension Array where Element == PassengerDataSourceSection {
    static let mock: [PassengerDataSourceSection] = [
        .init(sectionHeader: .russianPassport, items: [
            PassengerCell.ViewState(
                icon: .male,
                fullName: "Артем Смирнов",
                age: 32,
                number: "1234",
                series: "567890"
            ),
            PassengerCell.ViewState(
                icon: .female,
                fullName: "Марина Смирнова",
                age: 30,
                number: "1234",
                series: "567890"
            ),
            PassengerCell.ViewState(
                icon: .child,
                fullName: "Роман Смирнов",
                age: 14,
                number: "1234",
                series: "567890"
            )
        ].map(PassengerDataSourceItem.passenger)),
        .init(sectionHeader: .russianBirthCertificate, items: [
            PassengerCell.ViewState(
                icon: .child,
                fullName: "Артем Морозов",
                age: 12,
                number: "1234",
                series: "567890"
            )
        ].map(PassengerDataSourceItem.passenger)),
        .init(sectionHeader: .idSeamanPassport, items: [
            PassengerCell.ViewState(
                icon: .male,
                fullName: "Новиков Михаил",
                age: 24,
                number: "1234",
                series: "567890"
            )
        ].map(PassengerDataSourceItem.passenger))
    ]
}
#endif
