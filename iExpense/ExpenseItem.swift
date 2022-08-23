//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Kyle Warren on 8/21/22.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
