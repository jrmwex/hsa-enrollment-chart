//
//  MoneyCount.swift
//  HsaEnrollmentChart
//
//  Created by Jack Miller on 4/7/23.
//

import Foundation

struct MoneyCount : Identifiable {
        let id = UUID()
        let year: Date
        let money: Float
    
        init(year: String, money: Float) {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
             
           self.year = formatter.date(from: year) ?? Date.distantPast
           self.money = money
       }
    
    var weekdayString: String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy"
           dateFormatter.dateStyle = .long
           dateFormatter.timeStyle = .none
           dateFormatter.locale = Locale(identifier: "en_US")
           return  dateFormatter.string(from: year)
       }
   }
