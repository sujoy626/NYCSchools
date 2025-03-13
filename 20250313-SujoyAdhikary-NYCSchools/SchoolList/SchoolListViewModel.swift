//
//  SchoolListViewModel.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Foundation
import Combine


class SchoolListViewModel : BaseViewModel {
    @Published var schools: [SchoolListModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    private let service : SchoolListServiceProtocol
    
    init(
        service: SchoolListServiceProtocol = SchoolListService()
    ) {
        self.service = service
    }
    
    
    func fetchData(){
        loadingState = .loading("Fetching Schools...")
        service.fetchSchoolList()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
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

