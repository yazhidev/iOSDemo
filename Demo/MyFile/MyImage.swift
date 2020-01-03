//
//  MyImage.swift
//  Demo
//
//  Created by zengyazhi on 2019/12/31.
//  Copyright © 2019 zengyazhi. All rights reserved.
//

import SwiftUI

struct MyImage: View {
    var body: some View {
        Image("img")
            .frame(width: 200.0, height: 200.0)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.green, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage()
    }
}
