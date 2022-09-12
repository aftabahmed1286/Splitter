//
//  ContentView.swift
//  Split
//
//  Created by AftabAhmed on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var bill: String = ""
    @State var selectedTip: String = ""
    @State var numberOfPeople: String = ""
    
    @State var tipPerPerson: String = ""
    @State var totalPerPerson: String = ""
    
    @State var shouldReset = false
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Text("S  P  L  I")
                    Text("T  T  E  R")
                }.padding()
                VStack (alignment: .leading){
                    
                    Bill(txt: $bill)
                    
                    SelectTipPercentage(selectedTip: $selectedTip)
                    
                    NumberOfPeople(num: $numberOfPeople)
                    
                    TotalView(
                        tipPerPerson: $tipPerPerson,
                        totalPerPerson: $totalPerPerson,
                        shouldReset: $shouldReset
                    )
                    
                }.padding(30)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                    .onChange(of: shouldReset) {
                        _ in
                        resetTapped()
                    }
                    .onChange(of: bill){
                        _ in
                        calculate()
                    }
                    .onChange(of: numberOfPeople){
                        _ in
                        calculate()
                    }
                    .onChange(of: selectedTip) {
                        _ in
                        calculate()
                    }
            }
        }
        .background(Color(CustomColor.green0.rawValue))
        .onTapGesture {
            hideKeyboard()
        }
        
        //Splitter bg
        //ScrollView
        //Bill
        //TextField
        //Select Tip %
        //Stack View with 2 in a row
        //5 %, 10%
        //15%, 25%
        //50%, Custom
        //Number of people
        //TextField
        //VStackView
        //HSTack
        //Tip amount/person - Amount
        //Total/person  - Amount
        
        //RESET Btn
    }
}

extension ContentView {
    
    private func calculate() {
        guard let bill = Double(bill),
              let numOfPeople = Double(numberOfPeople),
              let tipPercentage = Double(selectedTip)
        else {
            tipPerPerson = ""
            totalPerPerson = ""
            return
        }
        let tipPerPer =  (bill * tipPercentage/100) / numOfPeople
        let totalPerPer = bill / numOfPeople + tipPerPer
        
        tipPerPerson = String(format: "$ %.2f", tipPerPer)//"\(tipPerPer)"
        totalPerPerson = String(format: "$ %.2f", totalPerPer)//"\(totalPerPer)"
    }
    
    private func resetTapped() {
        print("Reset")
        
        bill = ""
        selectedTip = ""
        numberOfPeople = ""
        
        tipPerPerson = ""
        totalPerPerson = ""
    }
}

extension ContentView {
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
