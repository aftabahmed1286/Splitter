//
//  Bill.swift
//  Split
//
//  Created by AftabAhmed on 06/09/22.
//

import SwiftUI

struct Bill: View {
    
    @Binding var txt: String
    
    var body: some View{
        VStack (alignment: .leading){
            Text("Bill")
                .modifier(TitleTwo())
            VStack {
                HStack {
                    Text("$")
                        .padding([.leading], 20)
                        .modifier(TitleOne())
                    CustomTF(placeholder: "", txt: $txt)
                        
                }
            }.background(Color(
                CustomColor.green6.rawValue)
            ).cornerRadius(5)
        }.padding([.bottom], 25)
    }
}

struct Bill_Previews: PreviewProvider {
    
    @State static var bill = "46.8"
    
    static var previews: some View {
        Bill(txt: $bill)
            .padding()
    }
}
