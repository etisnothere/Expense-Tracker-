//
//  TransactionRow.swift
//  ExpenseTracker
//
//  Created by Eric Tech on 11/12/24.
//

import SwiftUI
import SwiftUIFontIcon


struct TransactionRow: View {
    var transaction : Transaction
    
    var body: some View {
        HStack(spacing: 20) {
            //Transaction Category Icon
            RoundedRectangle (cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay{
                    FontIcon.text(.awesome5Solid(code: transaction.icon), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading , spacing: 6){
                Text(transaction.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                
                //Transaction Category
                Text(transaction.category)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                //Transaction Data
                Text(transaction.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
            }
            Spacer()
            
                //Trasaction Amount
            Text(transaction.signedAmount, format: .currency(code: "USA"))
                .bold()
                .foregroundColor(transaction.type == TransactionType.credit.rawValue ? Color.text: .primary)
            
        }
        .padding([.top, .bottom], 8 )
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: transactionPreviewData)
            //.preferredColorScheme(.dark)
    }
}
