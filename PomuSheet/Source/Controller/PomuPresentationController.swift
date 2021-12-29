//
//  PomuPresentationController.swift
//  PomuSheet
//
//  Created by 宮本光直 on 2021/12/28.
//

import SwiftUI

class PomuPresentationController<Content: View>: UIHostingController<Content> {
    
    override func viewDidLoad() {
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [
                .medium()
            ]
            presentationController.prefersGrabberVisible = true
        }
    }
}
