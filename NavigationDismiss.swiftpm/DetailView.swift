//
//  DetailView.swift
//  NavigationDismiss
//
//  Created by Bosco Ho on 2023-09-19.
//

import SwiftUI

struct DetailView: View {
    
    @Namespace var detailId
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Detail View")
            NavigationLink(value: detailId.hashValue) {
                Text("Show more details...")
            }
        }
        .navigationTitle("\(detailId.hashValue)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailView()
}
