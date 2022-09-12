//
//  NumberOfPeople.swift
//  Split
//
//  Created by AftabAhmed on 06/09/22.
//

import SwiftUI

struct NumberOfPeople: View {
    
    @Binding var num: String
    
    var body: some View{
        VStack (alignment: .leading){
            Text("Number of People")
                .modifier(TitleTwo())
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                        .padding([.leading], 20)
                        .modifier(TitleOne())
                    CustomTF(placeholder: "", txt: $num)
                }
            }.background(Color(
                CustomColor.green6.rawValue)
            ).cornerRadius(5)
        }.padding([.bottom], 25)
    }
}
struct NumberOfPeople_Previews: PreviewProvider {
    
    @State static var num = "5"
    
    static var previews: some View {
        NumberOfPeople(num: $num).padding()
    }
}
