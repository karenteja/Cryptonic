//
//  PreferenceGoodFor.swift
//  Cryptic
//
//  Created by Karen Teja on 9/20/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct RadioButtonFieldGoodfor: View {
    let id: String
    let label: String
    let size: CGFloat
    let textSize: CGFloat
    let isMarked: Bool
    let callback: (String) -> ()
    
    init(
        id: String,
        label: String,
        size: CGFloat = 20,
        textSize: CGFloat = 16,
        isMarked: Bool = false,
        callback: @escaping (String) -> ()
    ){
        self.id = id
        self.label = label
        self.size = size
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    var body: some View {
        Button(action: {
            self.callback(self.id)}) {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color("primarytext"), lineWidth: 2.0)
                    .background(self.isMarked ? Color("primarytext") : Color(.clear))
                    .cornerRadius(25)
                HStack (alignment: .center, spacing: 10){
                    Spacer()
                    Text(label)
                        .foregroundColor(self.isMarked ? Color(.white): Color("primarytext"))
                        .font(Font.system(size: textSize))
                    Spacer()
                }
            })
            .frame(width:160, height: 40)
            }
        .foregroundColor(Color.black)
        }
}
// MARK:-Group of Radio Buttons

enum CompassPointGoodfor: String{
    case north = "A Date"
    case south = "Groups"
    case east = "Me Time"
    case west = "Happy Hour"
}

struct RadioButtonGroupsGoodfor: View {
    
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View{
        VStack {
            HStack{
                radioNorthMajorityGoodfor
                radioSouthMajorityGoodfor
            }
            HStack{
                radioEastMajorityGoodfor
                radioWestMajorityGoodfor
            }
        }
    }
    var radioNorthMajorityGoodfor: some View {
        RadioButtonFieldGoodfor(
            id: CompassPointGoodfor.north.rawValue, label: CompassPointGoodfor.north.rawValue, isMarked: selectedId == CompassPointGoodfor.north.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioSouthMajorityGoodfor: some View {
        RadioButtonFieldGoodfor(
            id: CompassPointGoodfor.south.rawValue, label: CompassPointGoodfor.south.rawValue, isMarked: selectedId == CompassPointGoodfor.south.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioEastMajorityGoodfor: some View {
        RadioButtonFieldGoodfor(
            id: CompassPointGoodfor.east.rawValue, label: CompassPointGoodfor.east.rawValue, isMarked: selectedId == CompassPointGoodfor.east.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioWestMajorityGoodfor: some View {
        RadioButtonFieldGoodfor(
            id: CompassPointGoodfor.west.rawValue, label: CompassPointGoodfor.west.rawValue, isMarked: selectedId == CompassPointGoodfor.west.rawValue ? true : false, callback: radioGroupcallback)
    }
    func radioGroupcallback(id: String){
        selectedId = id
        callback(id)
    }
}
struct PreferenceGoodFor: View {
    static internal func getGoodForTitle() -> some View {
        return Text("good for")
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("primarytext"))
            .offset(y:-410)
            .padding(.top)
    }
    
    static internal func getGoodForCard() -> some View {
        return VStack(alignment: .leading){
            VStack (alignment: .leading){
                Text("Now,")
                    .fontWeight(.black)
                    .padding(.vertical ,20)
                    .foregroundColor(Color("primarytext"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Text("Tell us, what is the \nspecial occation?")
                    .fontWeight(.semibold)
                    .font(.system(size:16))
                    .foregroundColor(Color("primarytext"))
                    .padding(.leading)
                    .padding(.bottom)
                
                
                VStack{
                    HStack{
                        Image("goodfor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 250, alignment: .leading)
                            .cornerRadius(2.0)
                    }
                    .padding(.vertical)
                    
                    HStack {
                        RadioButtonGroupsGoodfor{ selected in print("Selected Compasspoint Id: \(selected)")}
                    }
                }
                
            }
            .offset(y:-20)
        }
        .padding(.all)
        .frame(width:350, height:600)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 30)
        .offset(y:-40)
    }
    
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading){
        //------------------------here's the background and description -------------------
                                ZStack(alignment: .leading){
                                    Image("Blob2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width:200, height:100, alignment:.leading)
                                    .scaleEffect(1.75)
                                    .offset(x: 300, y:-300)
                                    .rotationEffect(.degrees(-18))
                                    
                                    Image("liquor")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:150)
                                    .offset(x: 360, y:-00)
                                    
                                    Image("ambience")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:150)
                                    .offset(x: -160, y:-00)
                                    
                                    
                                    PreferenceGoodFor.getGoodForTitle()

                                    PreferenceGoodFor.getGoodForCard()
                                    }
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(Color("primarytext"))
                                        .offset(x:315, y:-30)
                }
            }
        }
    }
}


struct PreferenceGoodFor_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceGoodFor()
    }
}
