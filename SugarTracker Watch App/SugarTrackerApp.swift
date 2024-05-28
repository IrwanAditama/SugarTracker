//
//  SugarTrackerApp.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 15/05/24.
//

import SwiftUI
import SwiftData

@main
struct SugarTracker_Watch_AppApp: App {
    @StateObject var healthManager = HealthViewModel()
    @StateObject private var accumulatedNumbers = AccumulatedNumbers()
    
    var body: some Scene {
        WindowGroup {
            ProgressBar()
//            Details(drink: Drink(name: "Bubble Tea", bgcolor: .purple .opacity(0.3), image: "bubbletea"))
                .environmentObject(accumulatedNumbers)
        }
        
        .modelContainer(for: Sugarmodel.self)
        .environmentObject(healthManager)
        
    }
        
}
