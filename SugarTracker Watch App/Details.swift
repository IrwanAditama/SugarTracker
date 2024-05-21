//
//  Details.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 15/05/24.
//

import SwiftUI

struct Details: View {
    @State var sugarintake : Int = 0
    @EnvironmentObject var accumulatedNumbers: AccumulatedNumbers
    
    var drink: Drink
    @Binding var shouldDismiss: Bool
    
    @Environment(\.dismiss) var dismiss
    
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
                    VStack(spacing: 12){
                        Text(drink.name)
                            .font(.system(size: 18))
                            .frame(width: 173)
                        
                        Image(drink.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                    }
                    .padding()
                    
                    VStack(spacing: 4) {
                        HStack(spacing: 18) {
                            
                            Image(systemName: "minus")
                                .font(.system(size: 24))
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(16)
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    sugarintake -= 1
                                }.onAppear(){
                                    sugarintake = drink.sugar
                                }
                            
                            //                            Spacer()
                            
                            Text("\(sugarintake) gram")
                                .font(.system(size: 16))
                                .frame(width: 80)
                            
                            Image(systemName: "plus")
                                .font(.system(size: 24))
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(16)
                                .frame(width: 20, height: 20)
                                .onTapGesture {
                                    sugarintake += 1
                                }
                            
                            //                            Spacer()
                        }
                        .frame(width: 173, height: 30)
                        
                        
                        
                        Spacer()
                        
                        //                        NavigationLink(destination: ProgressBar()){
                        //                            Text("ADD")
                        //                                .font(.headline)
                        //                                .foregroundColor(.white)
                        //                                .onTapGesture {
                        //                                    accumulatedNumbers.addNumber(sugarintake)
                        ////                                    dismiss()
                        //                                }
                        //                        }
                        //                        .frame(width: 173, height: 36)
                        //                        .background(.purple)
                        //                        .cornerRadius(20)
                        
                        
                        
                        Button(action: {
                            shouldDismiss = true
                            accumulatedNumbers.addNumber(sugarintake)
                            dismiss()                            
                        }, label: {
                            Text("Add")
                                .font(.headline)
                                .foregroundColor(.white)
                            
                        })
                        
                        .frame(width: 173, height: 36)
                        .background(.purple)
                        .cornerRadius(20)
                    }
                }
                .padding()
                
                .frame(width: 173, height: 220)
                .navigationBarBackButtonHidden()
            }
        }
    }
}
//
//#Preview {
//    Details(drink: Drink(name: "Bubble Tea", bgcolor: .purple .opacity(0.3), image: "bubbletea", sugar: 40))
//        .environmentObject(AccumulatedNumbers())
//}
