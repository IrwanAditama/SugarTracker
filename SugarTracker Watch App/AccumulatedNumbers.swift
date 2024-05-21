//
//  AccumulatedNumbers.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 20/05/24.
//

import Foundation

class AccumulatedNumbers: ObservableObject {
    @Published var total: Int = 0
    
    
    func addNumber(_ number: Int) {
        total += number
    }
}
