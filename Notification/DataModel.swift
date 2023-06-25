//
//  DataModel.swift
//  Notification
//
//  Created by 강수희 on 2023/06/19.
//

import Foundation

struct DataModel1: Codable, Identifiable {
    var id: Int
    var name: String
    var time: Date
}
