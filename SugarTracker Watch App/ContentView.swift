//
//  ContentView.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            NavigationLink(destination: ProgressBar()){
                Text("button")
            }
        }
       

        
    }
    
}
#Preview {
    ContentView()
}
