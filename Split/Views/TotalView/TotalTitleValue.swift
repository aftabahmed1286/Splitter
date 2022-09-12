//
//  TotalTitleValue.swift
//  Split
//
//  Created by AftabAhmed on 07/09/22.
//

import SwiftUI

struct TotalTitleValue: View {
    
    var titleLine1: String = "Tip Amount"
    var titleLine2: String = "/ person"
    
    @Binding var value: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(titleLine1)
                    .modifier(TitleFour())
                Text(titleLine2)
                    .modifier(TitleFive())
            }
            Spacer()
            Text(value)
                .modifier(TitleSix())
        }.padding([.top], 20)
    }
}

struct TotalTitleValue_Previews: PreviewProvider {
    
    @State static var val = "$ 4.45"
    
    static var previews: some View {
        TotalTitleValue(value: $val)
            .background(Color(CustomColor.green4.rawValue))
            .padding()
    }
}
