//
//  PomuSheetManager.swift
//  PomuSheet
//
//  Created by 宮本光直 on 2021/12/28.
//

import SwiftUI

struct PomuSheetManager<Content: View> : UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    var backgroundColor: UIColor
    var content: Content
    var dissmiss: () -> Void
    let controller = UIViewController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        return controller;
    }
    
    func updateUIViewController(_ vc: UIViewController, context: Context) {
        if isPresented {
            let pomuSheetVC = PomuPresentationController(rootView: content)
            pomuSheetVC.presentationController?.delegate = context.coordinator
            pomuSheetVC.view.backgroundColor = self.backgroundColor
            vc.present(pomuSheetVC, animated: true)
        } else {
            closeAction()
            vc.dismiss(animated: true)
        }
    }
    
    func closeAction() {
        isPresented = false
        dissmiss()
    }
}

// MARK: Coordinator
extension PomuSheetManager {
    class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        
        var parent: PomuSheetManager
        
        init(parent: PomuSheetManager) {
            self.parent = parent
        }
        
        func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
            return false
        }
    }
}
