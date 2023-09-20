//
//  SystemNavigationPathView.swift
//  NavigationDismiss
//
//  Created by Bosco Ho on 2023-09-19.
//

import SwiftUI

struct SystemNavigationPathView: View {
    
    @State private var navigationPath: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            RootView()
                .navigationDestination(for: Int.self) { value in
                    DetailView()
                }
        }
        /*
         Use case:
         - Imagine a custom tab bar that lets users tap on a tab to go back to previous page, page by page.
         */
        .overlay(alignment: .bottom) {
            GroupBox {
                Button("Navigate Back (\(navigationPath.count))") {
                    if navigationPath.isEmpty == false {
                        /*
                         Wrapping call in withAnimation doesn't help.
                         */
                        if #available(iOS 17.0, *) {
//                            withAnimation(.default, completionCriteria: .removed) {
                                navigationPath.removeLast()
//                            } completion: {
//                                print("navigated back")
//                            }
                        } else {
//                            withAnimation {
                                navigationPath.removeLast()
//                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SystemNavigationPathView()
}
