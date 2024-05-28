//
//  ProgressBar.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 16/05/24.
//

import SwiftUI
import SwiftData

struct CircularProgress: View {
    @Binding var progress: Float
    var color: Color = Color.purple
    @EnvironmentObject var accumulatedNumbers: AccumulatedNumbers
    
    var body: some View {
        
        ZStack {
           
            Circle()
                .stroke(lineWidth: 16.0)
                .foregroundColor(.gray)
                .opacity(0.20)
            
            VStack{
                Text("Sugar Intake")
                    .font(.system(size: 14))
                    .bold()
                
                Text("\(accumulatedNumbers.total) Grams")
                    .font(.system(size: 12))
           
            }
            
            
            Circle()
                .trim(from: 0.0, to: CGFloat(accumulatedNumbers.total)/100)
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 2.0), value: progress)
        
        }
        
        
    }
    
}

struct ProgressBar: View {
    @State var progressValue: Float = 0.0
    @EnvironmentObject var accumulatedNumbers: AccumulatedNumbers
    @EnvironmentObject var healthManager: HealthViewModel
    var body: some View {
        ZStack{
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.18, green: 0.05, blue: 0.3), location: 0.00),
                    Gradient.Stop(color: .black, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: -0.24),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
            .edgesIgnoringSafeArea(.all)
            
            NavigationView{
                ScrollView{
                    VStack {
                        CircularProgress(progress: self.$progressValue)
                            .frame(width: 120.0, height: 120.0)
                            .padding()
                    }
                    
                    HStack(spacing: 80){
                        Button(action: {
                            if self.progressValue < 1.0 {
                                self.progressValue += 0.10
                            } else {
                                self.progressValue = 0.0
                            }
                        })
                        {
                            Image(systemName: "clock.fill")
                                .font(.headline)
                        }
                        .frame(width: 50)
                        
                        
                        NavigationLink(destination: ItemList()){
                            Image(systemName: "mug.fill")
                        }
                        .frame(width: 50)
                    }
                }
//                .navigationBarBackButtonHidden()
                
            }
            
        }
//        
//        .onAppear {
//                    healthManager.requestAuthorization { success in
//                        if success {
//                            print("Access granted")
//                        } else {
//                            print("Error Authorization")
//                        }
//                    }
//                }
        
    }
    
}
    


#Preview {
    ProgressBar()
        .environmentObject(AccumulatedNumbers())
        .modelContainer(for: Sugarmodel.self, inMemory: true)
}
