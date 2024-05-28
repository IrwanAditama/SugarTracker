//
//  HealthViewModel.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 22/05/24.
//

import Foundation
import HealthKit

class HealthViewModel: NSObject, ObservableObject{
    let healthStore = HKHealthStore()
    let sugarType = HKObjectType.quantityType(forIdentifier: .dietarySugar)!
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        
        let typesToShare: Set = [sugarType]
        let typesToRead: Set = [sugarType]
        
        HKHealthStore().requestAuthorization(toShare: typesToShare, read: typesToRead) { success, error in
            completion(success)
        }
    }
    
}
