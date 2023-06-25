//
//  ViewModel.swift
//  Notification
//
//  Created by 강수희 on 2023/06/19.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var scheList: [DataModel1] = []
    
    @Published var showModal: Bool = false
    
    @Published var firstLoad = true
}
