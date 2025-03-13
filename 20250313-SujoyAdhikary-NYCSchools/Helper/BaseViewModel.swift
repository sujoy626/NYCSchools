//
//  BaseViewModel.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Foundation
import Combine

enum LoadingState {
    case initState
    case loading(String)
    case loaded
    case failed(String)
}



class BaseViewModel : ObservableObject {
     var cancellables = Set<AnyCancellable>()
    
    @Published var loadingState : LoadingState = .initState
   
}
