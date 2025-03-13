//
//  CustomCommonView.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import SwiftUI

struct CustomLoadingView<Content: View>: View {
    var loadingState : LoadingState
    let content: () -> Content
    
    

    init(loadingState : LoadingState,@ViewBuilder content: @escaping () -> Content) {
        self.loadingState = loadingState
        self.content = content
    }

    var body: some View {
        switch loadingState {
        case .initState:
            EmptyView()
        case .loading(let ladingText):
            Text(ladingText)
                .font(.title)
                .foregroundStyle(.gray)
        case .loaded:
            content()
        case .failed(let error):
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
