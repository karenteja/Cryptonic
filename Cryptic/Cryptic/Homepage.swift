//
//  Homepage.swift
//  Cryptic
//
//  Created by Karen Teja on 10/4/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct Homepage: View {
    
    var body: some View {
        ZStack(alignment: .leading){
            LinearGradient(gradient: Gradient(colors: [Color("primarytext"),Color("primarytext"), .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Image(systemName: "line.horizontal.3")
                        .scaleEffect(1.5)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image("avatar")
                            .resizable()
                            .frame(width: 36, height: 36)
                    }
                }
                .padding(.horizontal,45)
                .padding(.top, 30)
            
                Spacer()
            }
            VStack(alignment: .leading){
            Text("Let's Explore \nPlaces!")
                .font(.title)
                .fontWeight(.bold)
                .offset(y:-20)
                .foregroundColor(.white)
          
            Text("Discount on drinks")
                .fontWeight(.semibold)
                .offset(y:30)
                .foregroundColor(.white)
                
            Text("Answer these riddles for a discount on your drinks")
                .foregroundColor(.white)
                .font(.system(size:14))
                .offset(y:30)

            
            }
            .offset(y:-230)
            .padding(.horizontal,45)
            
            ScrollView(.horizontal){
                HStack(spacing:15) {
                    BarView()
                }
                .padding(.horizontal,45)
            }
            .offset(y:20)
            
            VStack(alignment: .leading){
                Text("Discount on appetizers")
                    .fontWeight(.semibold)
                    .offset(y:30)
                    
                Text("Answer these riddles for a discount on \nyour appetizers")
                    .font(.system(size:14))
                    .offset(y:30)
            }
            .offset(y:200)
            .padding(.horizontal,45)
            
            ScrollView(.horizontal){
                HStack(spacing:15) {
                    ForEach(0 ..< 1) { item in
                    BarView2()
                    }
                }
                .padding(.horizontal,45)
            }
            .offset(y:320)
        
        }

    }
}
struct Homepage_Previews: PreviewProvider {
    static var previews: some View {
        Homepage()
    }
}

struct BarView: View {
    var body: some View {
        HStack {
            Image("peacekeeper")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .cornerRadius(30)
            Image("trickdog")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .cornerRadius(30)
            Image("leooysterbar")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .cornerRadius(30)
            Image("lazlo")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .cornerRadius(30)
            Image("charmaines")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .cornerRadius(30)
            Image("thesnug")
                .resizable()
                .frame(width: 200, height: 300)
                .scaledToFit()
                .cornerRadius(30)
            
            
        }
    }
}
struct BarView2: View {
    var body: some View {
        HStack {
            Image("eltecho")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(20)
            Image("ABV")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(20)
            Image("horsefeather")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(20)
            Image("lazlo")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(20)
            Image("lolo")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(20)
            Image("leooysterbar")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .cornerRadius(20)
            
            
        }
    }
}
