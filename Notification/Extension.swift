//
//  Extension.swift
//  Notification
//
//  Created by 강수희 on 2023/06/19.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a hh시 mm분"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        return dateFormatter.string(from: self)
    }
}

extension String {
    func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd a hh시 mm분"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd"
        let todayStr = dateFormatter2.string(from: Date())
        
        return dateFormatter.date(from: "\(todayStr) \(self)") ?? Date()
    }
}
