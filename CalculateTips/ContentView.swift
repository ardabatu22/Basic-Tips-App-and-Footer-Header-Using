//
//  ContentView.swift
//  CalculateTips
//
//  Created by Batuhan Arda on 8.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State var amount = 0.0
    @State var numberOfPeople = 2
    @State var tipPercentage = 10
    @FocusState var focuskeyboard : Bool
    let tipPercanteges = [10,15,20,0,25]
    
    var totalPerPerson : Double { // Computed Property
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationStack{
            
                Form{
                    
                    Section{
                        TextField("Amount",value:$amount,format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                            .keyboardType(.decimalPad)
                            .focused($focuskeyboard)
                        // locale current identifier your country currency
                        
                        Picker("Number of people ",selection:$numberOfPeople){
                            ForEach(2..<100){
                                Text("\($0) people")
                            }
                        }
                    }header: {
                        Text("Welcome")
                            .bold()
                            .foregroundStyle(.purple)
                    }
                    
                    Section{
                        Picker("Tip Percantege",selection:$tipPercentage){
                            ForEach(tipPercanteges, id: \.self){
                                Text($0 , format: .percent)
                            }
                        }.pickerStyle(.segmented)
                        
                    }
                    
                    Section{
                        Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                    
                    Section{
                        HStack{
                            Spacer()
                            Button("Thank You"){
                                print("For Tips")
                            }
                                .foregroundColor(.red)
                                .padding(30)
                                .background(.ultraThinMaterial)
                                .cornerRadius(30)
                            
                            Spacer()
                        }
                        
                        
                    }footer: {
                        HStack{
                            Spacer()
                            Text("See you")
                                .bold()
                                .foregroundStyle(.orange)
                            Spacer()
                        }
                    }
                    
                }.foregroundColor(.blue)
                .navigationTitle("Calculate Tips")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard){
                        if focuskeyboard{
                            Button("Done") {
                                focuskeyboard = false
                            }
                        }
                    }
                }
            }
        }
    }


#Preview {
    ContentView()
}
