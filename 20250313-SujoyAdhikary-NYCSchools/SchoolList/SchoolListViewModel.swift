//
//  SchoolListViewModel.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Foundation
import Combine


class SchoolListViewModel : BaseViewModel {
    // MARK: - Properties
    //stores the list of schools from the API
    @Published var schools: [SchoolListModel] = []
    //service for fetching school list
    private let service : SchoolListServiceProtocol
    
    init(
        service: SchoolListServiceProtocol = SchoolListService()
    ) {
        self.service = service
    }
    
    
    
    
}

// MARK: - API implementation or fetching data
extension SchoolListViewModel{
    func fetchData(){
        loadingState = .loading("Fetching Schools...")
        service.fetchSchoolList()
            .receive(on: DispatchQueue.main)// receive on main thread for UI updates
            .sink { [weak self] completion in //subscriber implementation
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.loadingState = .failed(error.localizedDescription)
                }
            } receiveValue: { [weak self] value in
                self?.schools = value
                self?.loadingState = .loaded
            }
            .store(in: &cancellables)
    }
}
