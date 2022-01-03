//
//  ExampleView.swift
//  PomuSheet
//
//  Created by 宮本光直 on 2021/12/28.
//

import SwiftUI

struct ExampleView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isPresented.toggle()
                } label: {
                    Text("open PomuSheet")
                }
                .pomuSheet(isPresented: $isPresented, backgroundColor: UIColor.lightGray) {
                    VStack(spacing: 20) {
                        Text("Welcome PomuSheet")
                            .font(.title.bold())
                        Button {
                            isPresented.toggle()
                        } label: {
                            Text("dissmiss")
                        }
                    }
                } dissmiss: {
                    print("Dismissed")
                }
            }
            .navigationBarTitle(Text("PomuSheet"), displayMode: .large)
        }
    }
}
