//
//  FormatStyle-LocalCurrency.swift
//  iExpense
//
//  Created by Kyle Warren on 8/22/22.
//

import Foundation
import SwiftUI

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currencyCode ?? "USD")
    }
}
