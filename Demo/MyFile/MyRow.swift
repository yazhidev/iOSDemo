//
//  MyRow.swift
//  Demo
//
//  Created by zengyazhi on 2020/1/2.
//  Copyright © 2020 zengyazhi. All rights reserved.
//

import SwiftUI

struct MyRow: View {
    
    @State var show = true
    
    var body: some View {
        NavigationView {
            VStack {
                if show {
                    Text("dynamic").frame(width: 50, height: 50)
                }
                Toggle(isOn: $show) {
                    Text("开关")
                }.frame(height: 30)
            }
            .navigationBarTitle("bnti")
        }
    }
}

struct MyRow_Previews: PreviewProvider {
    static var previews: some View {
        MyRow()
//        Group {
//            MyRow()
//            MyRow()
//        }.previewLayout(.fixed(width: 300, height: 50))
    }
}
