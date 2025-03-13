//
//  BaseViewModel.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Foundation

enum LoadingState {
    case initState
    case loading(String)
    case loaded
    case failed(String)
}



class BaseViewModel : ObservableObject {
    
    @Published var loadingState : LoadingState = .initState
    
    
   
    
    
}
