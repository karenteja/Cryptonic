//
//  ProfileScreen.swift
//  Cryptic
//
//  Created by Karen Teja on 4/4/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct ProfileScreen: View {
    @State var riddleSelectionEnabled = false
    
    var body: some View {
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("primarytext"), .white]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        HStack {
                        Image(systemName: "line.horizontal.3")
                        .scaleEffect(1.5)
                        .foregroundColor(.white)
                            .offset(y:-62)
                        Spacer()
        
                   }.padding(.horizontal,45)
                    .padding(.top, 10)
            
               }
               ZStack(alignment:.top) {
                   VStack {
                       Text("Joe Harvey")
                           .font(.title)
                           .fontWeight(.semibold)
                           
                       Text("SoulCycle Instructor")
                           .font(.headline)
                           .foregroundColor(.gray)
                           .fontWeight(.semibold)
                       HStack(spacing: 28) {
                           Image("bookmark")
                           Image("points")
                           Image("drinks")
                           }
                           .scaleEffect(0.7)
                       
                       HStack(spacing: 20){
                           Text("Answered Riddles(1)")
                               .foregroundColor(Color("primarytext"))
                               .fontWeight(.semibold)

                           Text("Favorites(0)")
                               .foregroundColor(.gray)
                               .fontWeight(.semibold)
                           
                       }
                       .font(.system(size:14))
                       .padding(.all)
                       HStack {
                           Image("zombieVillage")
                               .resizable()
                               .frame(width: 100, height: 100)
                               .cornerRadius(20)
                               .scaleEffect(0.7)
                           VStack(alignment:.leading) {
                               Text("Zombie Village")
                                   .foregroundColor(Color("primarytext"))
                                   .fontWeight(.semibold)
                               Text("$$")
                                   .fontWeight(.semibold)
                               Text("441 Jones St. Tenderloin")
                                   .fontWeight(.semibold)
                           }
                           .font(.system(size:14))
                           .foregroundColor(.gray)
                       }
                       .offset( y: -20)
                    NavigationLink(destination: RiddleSelection(), isActive: $riddleSelectionEnabled) {
                        Button(action: {
                            self.riddleSelectionEnabled = true}) {
                        Text("Where should I go next?")
                            .font(.system(size:14))
                            .fontWeight(.semibold)
                            .frame(width: 250, height: 50)
                            .background(Color("primarytext"))
                            .foregroundColor(Color.white)
                            .cornerRadius(30)
                            .overlay(RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("primarytext"), lineWidth: 1.5))
                         }
                         
                    }
                    
                    .offset(y:50)
                   }
//--------------the offset below is to adjust the width on different phone screens
                   .offset(x: 70, y: 100)
                   .frame(
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight:.infinity,
                       alignment:Alignment.topLeading
                   )
                   .background(Color.white)
                   .cornerRadius(25)
                   .offset(x: 0, y: 35)
                   .overlay(
                       Image("avatar")
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: 50, height: 250)
                           .offset(x: 0, y: -450)
                           .scaleEffect(0.7)
                       )
                   ZStack {
                       Color.gray
                           .frame(width: 300, height: 2)
                           .opacity(0.3)
                           .cornerRadius(3)
                           .offset(y: 310)
                       
                       Color("primarytext")
                       .frame(width: 150, height: 2)
                       .cornerRadius(3)
                       .offset(x: -74, y: 310)
                       }
                    }
               }
           }
            
        }
    }
    
}



struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

