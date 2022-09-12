//
//  SelectTipPercentage.swift
//  Split
//
//  Created by AftabAhmed on 06/09/22.
//

import SwiftUI

struct SelectTipPercentage: View {
    
    //@Binding var tipCent: String
//    @State var customPercentage = ""
    
    enum Constant: String {
        case custom = "Custom"
    }
    
    var tipPerc = [5, 10, 15, 25, 50]
    
    var itemHeight = 50.0
    var gridPadding = 25.0
    
    var rowColSpacing = 15.0
    
    var columns = [
        GridItem(spacing: 15),// keep same as rowColSpacing
        GridItem()
    ]
    
    @Binding var selectedTip: String// = ""
    @State var customTip: String = ""
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Select Tip %")
                .modifier(TitleTwo())
            GeometryReader {
                geo in
                LazyVGrid(columns: columns, spacing: rowColSpacing) {
                    ForEach(tipPercentages(), id: \.self) {
                        tipPerc in
                        if tipPerc == Constant.custom.rawValue {
                            HStack{
                                if !customTip.isEmpty {
                                    CustomTF(placeholder: tipPerc , txt: $customTip, trailPad: 0)
                                    Text("%").padding([.trailing], 10)
                                } else {
                                    CustomTF(placeholder: tipPerc , txt: $customTip, trailPad: 20)
                                }
                            }.background(Color(
                                CustomColor.green6.rawValue)
                            ).cornerRadius(5)
                        } else {
                            Text("\(tipPerc) %")
                                .foregroundColor(.white)
                                .frame(width: gridItemWidth(geo.size.width),
                                       height: itemHeight)
                                .background(
                                    (selectedTip == tipPerc && customTip.isEmpty) ?
                                    Color(CustomColor.green5.rawValue):
                                    Color(CustomColor.green4.rawValue)
                                )
                                .cornerRadius(5)
                                .onTapGesture {
                                    print(tipPerc)
                                    customTip = ""
                                    selectedTip = tipPerc
                                }
                        }
                    }
                }.padding([.bottom], 25)
                    .onChange(of: customTip) {
                        tip in
                        guard !tip.isEmpty else {
                            return
                        }
                        selectedTip = customTip
                    }
            }
            .frame(height: self.gridHeight())
            Spacer()
        }
    }
}

extension SelectTipPercentage {
    private func tipPercentages() -> [String] {
        tipPerc.map{
            "\($0)"
        } + [Constant.custom.rawValue]
    }
    
    private func gridHeight() -> CGFloat {
        //70 * ceil(5/2) = 210 + 25(padding)
        let numberOfRows = ceil(Double(tipPerc.count)/Double(columns.count))
        let totalRowSpacing = rowColSpacing * (numberOfRows - 1)
        let totalItemHeight = itemHeight * numberOfRows
        let totalPadding = gridPadding //* 2 // Top and bottom
        return totalItemHeight
        + totalRowSpacing
        + totalPadding
    }
    
    private func gridItemWidth(_ geoWidth: CGFloat) -> CGFloat {
        geoWidth * 0.5
        - rowColSpacing * 0.5
    }
}

struct SelectTipPercentage_Previews: PreviewProvider {
    @State static var tip = "0"
    
    static var previews: some View {
        SelectTipPercentage(selectedTip: $tip)
            .padding(20)
    }
}
