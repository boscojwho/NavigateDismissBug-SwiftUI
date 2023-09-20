//
//  CustomNavigationPathView.swift
//  NavigationDismiss
//
//  Created by Bosco Ho on 2023-09-19.
//

import SwiftUI

struct CustomNavigationPathView: View {
    
    @State private var navigationPath: [Int] = []
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            RootView()
                .navigationDestination(for: Int.self) { value in
                    DetailView()
                }
        }
        .overlay(alignment: .bottom) {
            GroupBox {
                Button("Navigate Back (\(navigationPath.count))") {
                    if navigationPath.isEmpty == false {
//                        withAnimation {
                            navigationPath.removeLast()
//                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomNavigationPathView()
}
