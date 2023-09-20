//
//  RootView.swift
//  NavigationDismiss
//
//  Created by Bosco Ho on 2023-09-19.
//

import SwiftUI

struct RootView: View {
    
    @Namespace var detailId
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Root View")
            NavigationLink(value: detailId.hashValue) {
                Text("Show details...")
            }
        }
        .navigationTitle("Root")
    }
}

#Preview {
    RootView()
}
