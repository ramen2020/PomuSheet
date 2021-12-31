//
//  Extension+View.swift
//  PomuSheet
//
//  Created by 宮本光直 on 2021/12/28.
//

import SwiftUI

extension View {
    func pomuSheet<Content: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping() -> Content, dissmiss: @escaping ()->())-> some View {

        return self
            .background(
                PomuSheetManager(isPresented: isPresented, content: content(), dissmiss: dissmiss)
            )
    }
}
