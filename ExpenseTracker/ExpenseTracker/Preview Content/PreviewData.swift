//
//  PreviewData.swift
//  ExpenseTracker
//
//  Created by Eric Tech on 11/11/24.
//

import Foundation
import SwiftUI

var transactionPreviewData = Transaction(id: 1, date: "11/11/2024", institution: "Bank of America", account: "Visa BOFA", merchant: "Apple", amount: 11.49, type: "debit", categoryId: 801, category: "Software", isPending: false, isTransfer: false, isExpense: false, isEdited: false)

var transactionListPreviewData = [Transaction](repeating: transactionPreviewData, count: 10)
