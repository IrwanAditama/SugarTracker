//
//  ItemList.swift
//  SugarTracker Watch App
//
//  Created by aditamairwan on 15/05/24.
//

import SwiftUI

struct ItemList: View {
    @State var shouldDismiss = false
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
            
            VStack {
                NavigationStack{
                    Text("All drink")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                        .padding(.leading)
                    
                    List {
                        ForEach(drinklist) { drink in
                            NavigationLink(destination: Details(drink: drink, shouldDismiss: $shouldDismiss)) {
                                HStack {
                                    Image(drink.image)
                                        .resizable()
                                        .frame(width: 36, height: 30)
                                    Text(drink.name)
                                    Spacer()
                                }
                                .padding()
                                .background(drink.bgcolor)
                                .cornerRadius(10)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                            
                        }
                        
                        .cornerRadius(10)
                        .listStyle(.plain)
                        
                    }
                    .onAppear {
                        print("Should Dismiss: \(shouldDismiss)")
                        if shouldDismiss {
                            dismiss()
                            shouldDismiss = false
                        }
                    }
                }
//                .navigationBarBackButtonHidden()
            }
        }

    }
}





struct Drink: Identifiable {
    var id = UUID()
    var name: String
    var bgcolor: Color
    var image: String
    var sugar: Int
    
}

var drinklist = [
    Drink(name: "Bubble Tea", bgcolor: .purple .opacity(0.3), image: "bubbletea", sugar: 25),
    Drink(name: "Iced Matcha", bgcolor: .blue .opacity(0.3), image: "matcha",sugar: 20),
    Drink(name: "Iced Tea", bgcolor: .brown .opacity(0.3), image: "esteh", sugar: 10),
    Drink(name: "Iced Cendol", bgcolor: .yellow .opacity(0.3), image: "cendol", sugar: 50),
    Drink(name: "Gelato", bgcolor: .green .opacity(0.3), image: "gelato",sugar: 45),
    
    
]


#Preview {
    ItemList()
}
