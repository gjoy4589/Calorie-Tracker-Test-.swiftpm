//
//  Homescreen.swift
//  Calorie Tracker (Test)
//
//  Created by Andres E. Lopez on 5/4/23.
//

import SwiftUI

struct Homescreen: View {
    var body: some View {
        Text("Hi, ")
            .offset(x:-150, y:-200)
            .font(.system(size: 25))
        
        RoundedRectangle(cornerRadius: 25, style: .continuous)
            .fill(.gray)
            .frame(width: 350, height: 250)
            .offset(x:0,y:-200)
        
        Text("Actvity")
            .offset(x:-100, y:-440)
            .font(.system(size: 25))
            
        Text("Do something today that your future self will thank you for")
            .offset(x:50, y:-450)
            .font(.system(size: 17))
            .frame(width: 120, height:100, alignment: .center)
        
    }
}

struct Homescreen_Previews: PreviewProvider {
    static var previews: some View {
        Homescreen()
    }
}
