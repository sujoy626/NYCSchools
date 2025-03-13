//
//  CustomCommonView.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import SwiftUI


//A custom SwiftUI view to display different loading states (loading, loaded, failed) and show content conditionally.
struct CustomLoadingView<Content: View>: View {
    // The current loading state, which determines which view to display
    var loadingState : LoadingState
    // A closure that returns the content to be displayed when data is loaded which pushing dynamic view from outside
    let content: () -> Content
    
    init(loadingState : LoadingState,@ViewBuilder content: @escaping () -> Content) {
        self.loadingState = loadingState
        self.content = content
    }

    var body: some View {
        switch loadingState {
        case .initState:
            EmptyView()
        case .loading(let ladingText): //loading with string
            Text(ladingText)
                .font(.title)
                .foregroundStyle(.gray)
        case .loaded:
            content()
        case .failed(let error)://error with error text
            Text(error)
                .font(.title)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    CustomLoadingView(loadingState: .failed("Failed to load data")) {
        Text("Hello World")
    }
}
