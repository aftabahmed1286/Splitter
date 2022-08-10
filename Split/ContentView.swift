//
//  ContentView.swift
//  Split
//
//  Created by AftabAhmed on 26/07/22.
//

import SwiftUI

enum CustomColor: String {
    case green0 = "Green0"
    case green1 = "Green1"
    case green2 = "Green2"
    case green3 = "Green3"
    case green4 = "Green4"
    case green5 = "Green5"
}



extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView: View {
    
    @State var bill: String = ""
    @State var numberOfPeople: String = ""
    @State var customPercentage = ""
    
    enum Constant: String {
        case custom = "Custom"
    }
    
    private var tipPerc = [5, 10, 15, 25, 50]
    
    
    private func tipPercentages() -> [String] {
        tipPerc.map{
            "\($0) %"
        } + [Constant.custom.rawValue]
    }
    
    private var columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    Text("S P L I")
                    Text("T T E R")
                    VStack {
                        Text("Bill")
                        TextField("$", text: $bill)
                        Text("Select Tip %")
                        VStack {
                            LazyVGrid(columns: columns, spacing: 10) {
                                ForEach(tipPercentages(), id: \.self) {
                                    tipPerc in
                                    if tipPerc == Constant.custom.rawValue {
                                         TextField(tipPerc, text: $customPercentage)
                                    } else {
                                        Button(action: {
                                            print(tipPerc)
                                        }, label: {
                                            HStack {
                                                Text("\(tipPerc)")
                                            }.frame(width: geo.size.width/2 - 20, height: 50)
                                                .background(Color(CustomColor.green4.rawValue))
                                        })
                                        
                                    }
                                }
                            }
                        }
                        Text("Number of People")
                        TextField("", text: $numberOfPeople)
                        
                        VStack {
                            
                            HStack {
                                Text("Tip Amount\n/person")
                                Spacer()
                                Text("Tip")
                            }
                            
                            HStack {
                                VStack(alignment: .leading){
                                    Text("Total")
                                        .foregroundColor(.white)
                                    Text("/person")
                                }
                                Spacer()
                                Text("$4")
                            }
                            
                            Button(action: {
                                print()
                            }, label: {
                                Text("RESET")
                            })
                        }.padding()
                            .background(Color(CustomColor.green4.rawValue))
                            .cornerRadius(20)
                        
                        
                    }
                    .padding()
                    .frame(width: geo.size.width, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
            }.background(Color(CustomColor.green0.rawValue))
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
    
    private func resetTapped() {
        print("Reset")
    }
    
    private func tipPercentageSelected(_ tipPercentage: Int) {
        print(tipPercentage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
