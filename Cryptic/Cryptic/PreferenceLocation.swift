//
//  PreferenceLocation.swift
//  Cryptic
//
//  Created by Karen Teja on 9/15/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct RadioButtonField: View {
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

enum CompassPoint: String{
    case north = "Haight"
    case south = "The Mission"
    case east = "The Castro"
    case west = "Lower Nob-Hill"
}

struct RadioButtonGroups: View {
    
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var body: some View{
        VStack {
            HStack{
                radioNorthMajority
                radioSouthMajority
            }
            HStack{
                radioEastMajority
                radioWestMajority
            }
        }
    }
    var radioNorthMajority: some View {
        RadioButtonField(
            id: CompassPoint.north.rawValue, label: CompassPoint.north.rawValue, isMarked: selectedId == CompassPoint.north.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioSouthMajority: some View {
        RadioButtonField(
            id: CompassPoint.south.rawValue, label: CompassPoint.south.rawValue, isMarked: selectedId == CompassPoint.south.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioEastMajority: some View {
        RadioButtonField(
            id: CompassPoint.east.rawValue, label: CompassPoint.east.rawValue, isMarked: selectedId == CompassPoint.east.rawValue ? true : false, callback: radioGroupcallback)
    }
    
    var radioWestMajority: some View {
        RadioButtonField(
            id: CompassPoint.west.rawValue, label: CompassPoint.west.rawValue, isMarked: selectedId == CompassPoint.west.rawValue ? true : false, callback: radioGroupcallback)
    }
    func radioGroupcallback(id: String){
        selectedId = id
        callback(id)
    }
}

struct PreferenceLocation: View {
    static internal func getLocationTitle() -> some View {
        return Text("location")
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("primarytext"))
            .offset(y:-410)
            .padding(.top)
    }
    
    static internal func getLocationCard() -> some View {
        return VStack(alignment: .leading){
            VStack (alignment: .leading){
                Text("Hi Joe!")
                    .fontWeight(.black)
                    .padding(.vertical ,20)
                    .foregroundColor(Color("primarytext"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Text("First, tell us which neighborhood \nyou'd like to explore today.")
                    .fontWeight(.semibold)
                    .font(.system(size:16))
                    .foregroundColor(Color("primarytext"))
                    .padding(.leading)
                    .padding(.bottom)
                
                
                VStack{
                    HStack{
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 250, alignment: .leading)
                            .cornerRadius(2.0)
                    }
                    .padding(.vertical)
                    HStack {
                        RadioButtonGroups{ selected in print("Selected Compasspoint Id: \(selected)")}
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
    
    
    internal func getArrow() -> some View {
        return Image(systemName: "arrow.right")
            .foregroundColor(Color("primarytext"))
            .offset(x:315, y:-30)
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
                                    
                                    Image("ambience")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:150)
                                    .offset(x: 360, y:-00)
                                    
                                    
                                    PreferenceLocation.getLocationTitle()
         
                                    PreferenceLocation.getLocationCard()
                                    
                                            }
                    getArrow()
                }
            }
        }
    }
}

struct PreferenceLocation_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceLocation()
    }
}

