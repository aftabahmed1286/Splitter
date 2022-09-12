//
//  CustomTF.swift
//  Split
//
//  Created by AftabAhmed on 06/09/22.
//

import SwiftUI

struct CustomTF: View {
    
    //https://programmingwithswift.com/numbers-only-textfield-with-swiftui/
    
    var placeholder: String = ""
    
    @Binding var txt: String
    
    @State var trailPad = 20.0
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $txt)
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
                .padding([.trailing], trailPad)
        }.frame(height: 50)
            .onChange(of: txt) {
                t in
                txtFormatting(t)
            }
    }
    
    func txtFormatting(_ t: String) {
        //1     allowed - Done
        //1.    allowed - Done
        //0.    allowed - Done
        //1.0.  not allowed - Done
        //00    not allowed - more than one zero - Done
        //01    not allowed - Done
        
        ///Number of Dots
        let j = t.filter{$0 == "."}
        if j.count == 1 {
            //1. g
            //0. allowed
            txt = t
            return
        } else if j.count > 1 {
            var m = t
            //1.0. not allowed
            m.removeLast()
            txt = m
            return
        }
        
        //01    not allowed
        if t.count == 2 {
            if t.first == "0" {
                txt = "\(String(describing: t.last ?? "0"))"
            }
        }
        
        //00 not alllowed - more than one zero
        if t.count == 2, let d = Double(t), d == 0 {
            txt = "0"
            return
        }
        
        
    }
}
struct CustomTF_Previews: PreviewProvider {
    
    static var plaTxt = "Ahmed"
    
    @State static var txt = "Aftab"
    
    static var previews: some View {
        CustomTF(placeholder: plaTxt, txt: $txt)
    }
}
