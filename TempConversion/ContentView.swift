//
//  ContentView.swift
//  TempConversion
//
//  Created by Shokri Alnajjar on 05/04/2022.
//

import SwiftUI


struct ContentView: View {
    
    @State private var amount = 0.0
    @State private var fromUnit = "Celsius"
    @State private var toUnit = "Fahrenheit"
    
    @FocusState private var amountIsFocused : Bool
    
    var result : Double {
        var original : Double = 0.0
        var final : Double = 0.0
        switch fromUnit {
        case "Celsius":
            original = amount * 1
        case "Fahrenheit":
            original = (amount - 32) / 1.8
        case "Kelvin":
            original = amount - 273.15
        default:
            original = amount
        }
        
        switch toUnit {
        case "Celsius":
            final = original
        case "Fahrenheit":
            final = original * 1.8 + 32
        case "Kelvin":
            final = original + 273.15
        default:
            final = original
        }
        
        return final
    }
    
    let units = ["Celsius","Fahrenheit","Kelvin"]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount to be Converted",value:$amount, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }header: {
                    Text("Convert")
                }
                
                Section {
                    Picker("Unit", selection: $fromUnit) {
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("From")
                }
                
                Section {
                    Picker("Unit", selection: $toUnit) {
                        ForEach(units, id:\.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("To")
                }
                
                Section {
                    Text(result, format: .number)
                }
            header: {
                    Text("Result")
                }
            }
            .navigationTitle("TempConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
