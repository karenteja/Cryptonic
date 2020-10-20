//
//  PreferenceLiquor.swift
//  Cryptic
//
//  Created by Karen Teja on 9/20/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct PreferenceLiquor: View {

    @State private var isExpanded = false
    let alchoholList = ["Baiju", "Beer", "Brandy","Cider","Gin","Huangjiu","Rum","Sake","Tequila","Vodka","Whisky"]
    @State private var selectedDrink = "Select Liquor"
    @State private var drinkSelected = false
    
    
    
    static internal func getLiquorTitle() -> some View {
        return Text("liquor")
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("primarytext"))
            .offset(y:-410)
            .padding(.top)
    }

    
    var body: some View {
        VStack {
            VStack {
                VStack(alignment: .leading){
        //------------------------here's the background and description -------------------
                                ZStack(alignment: .leading){
                                    
                                    PreferenceLiquor.getLiquorTitle()
         
                                    LiquorCard()
                            }
                }

            }
        }
    }
}


struct PreferenceLiquor_Previews: PreviewProvider {
    static var previews: some View {
        PreferenceLiquor()
    }
}

struct SaveButton2: View {
    @Binding var drinkSelected: Bool
    
    var body: some View {
        NavigationLink(destination: Riddle1(), isActive: $drinkSelected) {
            Button(action: { self.drinkSelected.toggle()} ) {
                Text("Save")
                    .font(.system(size:14))
                    .fontWeight(.semibold)
                    .frame(width: 320, height: 60)
                    .background(Color("primarytext"))
                    .foregroundColor(Color.white)
                    .cornerRadius(30)
                    .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color("primarytext"), lineWidth: 1.5))
                 }
            .padding(.all)
        }
    }
}

struct LiquorCard: View {
    @State private var isExpanded = false
    let alchoholList = ["Baiju", "Beer", "Brandy","Cider","Gin","Huangjiu","Rum","Sake","Tequila","Vodka","Whisky"]
    @State private var selectedDrink = "Select Liquor"
    @State private var drinkSelected = false
    
    var saveButton: some View {
        return Button(action: {}) {
            Text("Save")
                .font(.system(size:14))
                .fontWeight(.semibold)
                .frame(width: 320, height: 60)
                .background(Color("primarytext"))
                .foregroundColor(Color.white)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                .stroke(Color("primarytext"), lineWidth: 1.5))
                }.padding(.all)
    }
    
    var body: some View {
        let saveButton = SaveButton2(drinkSelected: $drinkSelected)
        VStack(alignment: .leading) {
            VStack (alignment: .leading){
                Text("Last but not least")
                    .fontWeight(.black)
                    .padding(.vertical ,20)
                    .foregroundColor(Color("primarytext"))
                    .multilineTextAlignment(.leading)
                    .padding(.leading)
                Text("Pick your potion")
                    .fontWeight(.semibold)
                    .font(.system(size:16))
                    .foregroundColor(Color("primarytext"))
                    .padding(.leading)

                
                
                VStack{
                    HStack{
                        Image("liquor")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 250, alignment: .leading)
                            .cornerRadius(2.0)
                        
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 15){
                        DisclosureGroup("\(selectedDrink)", isExpanded: $isExpanded) {
                            ScrollView{
                                VStack {
                                    ForEach(alchoholList, id: \.self) {drink in Text("\(drink)")
                                        .foregroundColor(Color("primarytext"))
                                        .frame(maxWidth: .infinity)
                                        .padding(2)
                                        .onTapGesture {
                                            self.selectedDrink = drink
                                            withAnimation{
                                                self.isExpanded.toggle()
                                            }
                                            
                                        }
                                        
                                    }
                                }
                            }
                            .frame(height: 100)
                            
                        }.animation(.easeInOut(duration:0.4))
                        .accentColor(Color("primarytext"))
                        .foregroundColor(Color("primarytext"))
                        .padding(.all)
                        .background(Color.white)
                        .cornerRadius(20)
                        .overlay(RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color("primarytext"), lineWidth: 1.5))
                        .padding(.top)
                        .padding(.horizontal)
                        
                        
                    }
                    if !self.isExpanded && self.selectedDrink != "Select Liquor"   {
                        saveButton.onAppear().animation(.easeInOut(duration: 0.1))
                        
                    }
                    else {
                        saveButton.hidden().animation(.easeInOut(duration: 0.1))
                        
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
}
