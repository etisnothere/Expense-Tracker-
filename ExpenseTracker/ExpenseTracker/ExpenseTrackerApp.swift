//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Eric Tech on 11/10/24.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
