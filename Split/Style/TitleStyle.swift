//
//  TitleStyle.swift
//  Split
//
//  Created by AftabAhmed on 07/09/22.
//

import SwiftUI

struct TitleOne: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .foregroundColor(Color(CustomColor.green7.rawValue))
        
    }
}

struct TitleTwo: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(Color(CustomColor.green8.rawValue))
        
    }
}

struct TitleThree: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(Color(CustomColor.green8.rawValue))
        
    }
}

struct TitleFour: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(Color.white)
        
    }
}

struct TitleFive: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(Color(CustomColor.green7.rawValue))
        
    }
}

struct TitleSix: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(Color(CustomColor.green5.rawValue))
        
    }
}

struct TitleSeven: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundColor(Color(CustomColor.green4.rawValue))
        
    }
}
