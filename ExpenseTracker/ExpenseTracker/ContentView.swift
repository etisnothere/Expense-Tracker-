//
//  ContentView.swift
//  ExpenseTracker
//
//  Created by Eric Tech on 11/10/24.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    //var demoData: [Double] = [ 8,2,4,6,12,9,2]
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing : 24) {
                    //Title
                    Text("Overview")
                        .font(.title2).bold()

                    // Chart
                    let data = transactionListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        
                        let totalExpenses = data.last?.1 ?? 0
                        CardView {
                            VStack {
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title)
                                
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground,
                                               foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                        
                    }
            
        
                    // Transaction List
                    RecentTransactionList()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Mark notification bar
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
