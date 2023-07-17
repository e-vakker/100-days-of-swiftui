//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Jevgeni Vakker on 17.07.2023.
//

import Foundation


struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
