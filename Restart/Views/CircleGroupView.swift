//
//  CircleGroupView.swift
//  Restart
//
//  Created by Jose Carlos Rodriguez on 23/2/23.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacit: Double
    @State private var isAnimation: Bool = false

    
    // MARK: - BODY.
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacit), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacit), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimation ? 0 : 10)
        .opacity(isAnimation ? 1 : 0)
        .scaleEffect(isAnimation ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimation)
        .onAppear {
            isAnimation = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(ShapeColor: .white, ShapeOpacit: 0.2)
        }
    }
}
