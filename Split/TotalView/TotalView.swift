//
//  TotalView.swift
//  Split
//
//  Created by AftabAhmed on 06/09/22.
//

import SwiftUI

struct TotalView: View {
    
    @Binding var tipPerPerson: String
    @Binding var totalPerPerson: String
    
    @Binding var shouldReset: Bool
    
    var body: some View {
        
        VStack{
            
            TotalTitleValue(
                titleLine1: "Tip Amount",
                titleLine2: "/ person",
                value: $tipPerPerson)
            
            TotalTitleValue(
                titleLine1: "Total",
                titleLine2: "/ person",
                value: $totalPerPerson)
            
            Text("RESET")
                .modifier(TitleSeven())
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 50,
                    maxHeight: 50,
                    alignment: .center
                )
                .background(Color(CustomColor.green5.rawValue))
                .cornerRadius(5)
                .padding([.top], 20)
                .onTapGesture {
                    shouldReset.toggle()// = true
                }
        }
        .padding(20)
        .background(Color(CustomColor.green4.rawValue))
        .cornerRadius(15)
        
    }
}


struct TotalView_Previews: PreviewProvider {
    
    @State static var shouldReset: Bool = false
    @State static var tipPerPerson: String = ""
    @State static var totalPerPerson: String = ""
    
    static var previews: some View {
        TotalView(tipPerPerson: $tipPerPerson,
                  totalPerPerson: $totalPerPerson,
                  shouldReset: $shouldReset)
            .padding()
    }
}
