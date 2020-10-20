//
//  ScrollViewExperiment.swift
//  Cryptic
//
//  Created by Pavel Zaytsev on 9/20/20.
//  Copyright © 2020 Karen Teja. All rights reserved.
//

import SwiftUI


struct View1: View {
    var body: some View {
        Text("A")
            .frame(width: 300, height: 300)
            .background(Color.red)
            .id(0)
    }
}

struct View2: View {
    var body: some View {
        Text("B")
            .frame(width: 300, height: 300)
            .background(Color.green)
            .id(1)
    }
}

struct View3: View {
    var body: some View {
        Text("C")
            .frame(width: 300, height: 300)
            .background(Color.blue)
            .id(1)
    }
}

struct ScrollViewExperiment2: View {
    let views: [Any] = [View1(), View2(), View3()]
    let offsets: [CGFloat] = [300, 0, -300]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged{_ in self.currentViewIndex = self.currentViewIndex}
            .onEnded {
                value in
                if (value.translation.width < 0 && value.translation.height > -30 && value.translation.height < 30) {
                    // swipe left
                    self.currentViewIndex = (self.currentViewIndex + 1) % offsets.count
                }
                else if (value.translation.width > 0 && value.translation.height > -30 && value.translation.height < 30) {
                    // swipe right
                    self.currentViewIndex = (self.currentViewIndex - 1) % offsets.count
                }
            }
    }
    @State private var currentViewIndex = 0
        var body: some View {
            
            HStack {
                ForEach(0..<views.count) { index in
                    AnyView(_fromValue: views[index])
                        .gesture(drag)
                }
                .offset(x: offsets[self.currentViewIndex], y: 0)
                .animation(.easeInOut(duration: 0.3))
            }
        }
}


struct ScrollViewExperiment_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewExperiment2()
    }
}
