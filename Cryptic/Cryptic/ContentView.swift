//
//  ContentView.swift
//  Cryptic
//
//  Created by Karen Teja on 3/13/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    var body: some View
    {
        VStack
            {
                ZStack(alignment: .leading)
                {
                    Image("Blob1")
                        .resizable()
                        .shadow(radius: 10)
                        .aspectRatio(contentMode: .fill)
                        .frame(width:320, alignment:.leading)
                        .scaleEffect(1.3)
                        .offset(x: 90, y:-1)
                        .rotationEffect(.degrees(-13))
                    

                    VStack(alignment: .leading)
                        {
                           Text("Find The Perfect Hang Out Spot!")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, 45.0)
                            .foregroundColor(.white)
                            
                           Text("That matches your personality")
                            .padding(.top, 10)
                            .padding(.leading, 65)
                            .foregroundColor(.white)
                            
                            HStack {
                                Text("Register")
                                .fontWeight(.bold)
                                .frame(width:150, height: 35)
                                .background(Color("mint"))
                                .foregroundColor(Color("primarytext"))
                                .cornerRadius(10)
                                .shadow(radius: 20)

                                
                                Text("Login")
                                .fontWeight(.bold)
                                .frame(width:150, height: 35)
                                .background(Color.white)
                                .foregroundColor(Color("primarytext"))
                                .cornerRadius(10)
                                .shadow(radius: 20)
                            }
                            .padding(.top, 80)
                            .padding(.leading)
                        }
                    .padding(.leading)
                    Spacer()
                }
                Image("background")
                .resizable()
                    .aspectRatio(contentMode: .fill)
                
      
            }
    }

}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View {
        ContentView()
        
    }
}
