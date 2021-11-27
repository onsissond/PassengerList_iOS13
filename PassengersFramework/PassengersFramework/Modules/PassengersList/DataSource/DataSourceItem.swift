//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import Foundation

struct DataSourceItem {
    var sectionHeader: PassengerSectionHeaderView.ViewState
    var items: [PassengerCell.ViewState]
}

extension Array where Element == DataSourceItem {
    static let mock: [DataSourceItem] = [
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
        ]),
        .init(sectionHeader: .russianBirthCertificate, items: [
            PassengerCell.ViewState(
                icon: .child,
                fullName: "Артем Морозов",
                age: 12,
                number: "1234",
                series: "567890"
            )
        ]),
        .init(sectionHeader: .idSeamanPassport, items: [
            PassengerCell.ViewState(
                icon: .male,
                fullName: "Новиков Михаил",
                age: 24,
                number: "1234",
                series: "567890"
            )
        ])
    ]
}
