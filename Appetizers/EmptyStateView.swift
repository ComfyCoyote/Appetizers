//
//  EmptyStateView.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/29/24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Nothing to Display")
                    
            }
        }
    }
}

#Preview {
    EmptyStateView()
}
