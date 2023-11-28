//
//  PopoverView1.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/28/23.
//

import Foundation
import SwiftUI

fileprivate struct PopoverView1: View {
    @State private var showPopover: Bool = false
    @State private var updateText: Bool = false
    
    var body: some View {
        Button("Show Popover") {
            showPopover.toggle()
        }
        .iOSPopover(isPresented: $showPopover,
                    arrowDirection: .down) {
            VStack {
                Text("Hello, its me, \(updateText ? "1":"222222222222").")
                Button {
                    updateText.toggle()
                } label: {
                    Text("Update Test")
                        .foregroundColor(.green)
                }
                
                Button {
                    showPopover.toggle()
                } label: {
                    Text("Close Popover")
                        .foregroundColor(.yellow)
                }
            }
            .foregroundColor(.white)
            .padding(15)
            .background {
                Rectangle()
                    .fill(.blue.gradient)
                    .padding(-20)
            }
        }
    }
}

fileprivate extension View {
    @ViewBuilder
    func iOSPopover<Content: View> (isPresented: Binding<Bool>,
                                    arrowDirection: UIPopoverArrowDirection,
                                    @ViewBuilder content: @escaping ()-> Content) -> some View {
        self.background {
            PopOverController(isPresented: isPresented,
                              arrowDirection: arrowDirection,
                              content: content())
        }
    }
}

fileprivate struct PopOverController<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content
    // View Properties
    @State private var alreadyPresented: Bool = false
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if alreadyPresented {
            // Updating SwiftUI View, when it's Changed
            if let hostingController = uiViewController.presentedViewController as? CustomHostingView<Content> {
                hostingController.rootView = content
                
                // Updating View Size when it's Update
                // Or define own size in SwiftUI View
                hostingController.preferredContentSize = hostingController.view.intrinsicContentSize
            }
            
            // Close View, if it's toggled Back
            if !isPresented {
                // Closing Popover
                uiViewController.dismiss(animated: true) {
                    // Resetting alreadyPresented State
                    alreadyPresented = false
                }
            }
        } else {
            if isPresented {
                let controller = CustomHostingView(rootView: content)
                controller.view.backgroundColor = .clear
                controller.modalPresentationStyle = .popover
                controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
                //connecting Delegate
                controller.presentationController?.delegate = context.coordinator
                controller.popoverPresentationController?.sourceView = uiViewController.view
                uiViewController.present(controller, animated: true)
            }
        }
    }
    
    // Forcing it to show Popover using PresentationDelegate
    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate {
        var parent: PopOverController
        init(parent: PopOverController) {
            self.parent = parent
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
        
        // Observing The statuc of the Popover
        // When it's dimissed updating the isPresented State
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
        
        // When the popover is presented, updating the alreadyPresented State
        func presentationController(_ presentationController: UIPresentationController, willPresentWithAdaptiveStyle style: UIModalPresentationStyle, transitionCoordinator: UIViewControllerTransitionCoordinator?) {
            DispatchQueue.main.async {
                self.parent.alreadyPresented = true
            }
        }
    }
}

// Custom Hosting Controller for Wrapping to it's SwiftUI View Size
fileprivate class CustomHostingView<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = view.intrinsicContentSize
    }
}

struct PopoverView1_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView1()
    }
}
