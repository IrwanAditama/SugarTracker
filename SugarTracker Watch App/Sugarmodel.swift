//
//  Sugarmodel.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 21/05/24.
//

import Foundation
import SwiftData

@Model
class Sugarmodel: Identifiable{
    @Attribute(.unique)  let id: String
    let sugar: Int
    
    init(id: String, sugar: Int) {
        self.id = id
        self.sugar = sugar
    }
}
