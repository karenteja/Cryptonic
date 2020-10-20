//
//  PreferenceAmbience.swift
//  Cryptic
//
//  Created by Karen Teja on 3/29/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI
struct RadioButtonFieldAmbience: View {
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

enum CompassPointAmbience: String{
    case north = "Unique"
    case south = "Cultured"
    case east = "Trendy"
    case west = "Casual"
}

struct RadioButtonGroupsAmbience: View {
    
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View{
        VStack {
            HStack{
                radioNorthMajorityAmbience
                radioSouthMajorityAmbience
            }
            HStack{
                radioEastMajorityAmbience
                radioWestMajorityAmbience
            }
        }
    }
    var radioNorthMajorityAmbience: some View {
        RadioButtonFieldAmbience(
            id: CompassPointAmbience.north.rawValue, label: CompassPointAmbience.north.rawValue, isMarked: selectedId == CompassPointAmbience.north.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioSouthMajorityAmbience: some View {
        RadioButtonFieldAmbience(
            id: CompassPointAmbience.south.rawValue, label: CompassPointAmbience.south.rawValue, isMarked: selectedId == CompassPointAmbience.south.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioEastMajorityAmbience: some View {
        RadioButtonFieldAmbience(
            id: CompassPointAmbience.east.rawValue, label: CompassPointAmbience.east.rawValue, isMarked: selectedId == CompassPointAmbience.east.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioWestMajorityAmbience: some View {
        RadioButtonFieldAmbience(
            id: CompassPointAmbience.west.rawValue, label: CompassPointAmbience.west.rawValue, isMarked: selectedId == CompassPointAmbience.west.rawValue ? true : false, callback: radioGroupcallback)
    }
    func radioGroupcallback(id: String){
        selectedId = id
        callback(id)
    }
}


struct PreferenceAmbience:  View {
    static internal func getAmbienceTitle() -> some View {
        return Text("ambience")
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("primarytext"))
            .offset(y:-410)
            .padding(.top)
    }
    
    static internal func getAmbienceCard() -> some View {
        return VStack(alignment: .leading){
            VStack (alignment: .leading){
                Text("Great!")
                    .fontWeight(.black)
                    .padding(.vertical ,20)
                    .foregroundColor(Color("primarytext"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Text("Now which ambience \nare you looking for today?")
                    .fontWeight(.semibold)
                    .font(.system(size:16))
                    .foregroundColor(Color("primarytext"))
                    .padding(.leading)
                    .padding(.bottom)
                
                VStack{
                    HStack{
                        Image("ambience")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 250, alignment: .leading)
                            .cornerRadius(2.0)
                    }
                    .padding(.vertical)
                    HStack {
                        RadioButtonGroupsAmbience{ selected in print("Selected Compasspoint Id: \(selected)")}
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
                                    
                                    Image("goodfor")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:150)
                                    .offset(x: 360, y:-00)
                                    
                                    Image("location")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:150)
                                    .offset(x: -160, y:-00)
                                    
                                    
                                    PreferenceAmbience.getAmbienceTitle()

                                    PreferenceAmbience.getAmbienceCard()
                                    }
                                    Image(systemName: "arrow.right")
                                        .foregroundColor(Color("primarytext"))
                                        .offset(x:315, y:-30)
                }
            }
        }
    }
}




struct PreferenceAmbience_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceAmbience()
    }
}

