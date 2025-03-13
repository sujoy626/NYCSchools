//
//  SchoolDetailsViewModel.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Combine
import Foundation

class SchoolDetailsViewModel : BaseViewModel {
    private var cancellables = Set<AnyCancellable>()
    let school: SchoolListModel
    
    @Published private(set) var schoolDetails: SchoolDetailModel?
    
    private let service : SchoolDetailServiceProtocol
    
    init(school: SchoolListModel,
        service: SchoolDetailServiceProtocol = SchoolDetailService()) {
        self.school = school
        self.service = service
    }
    
    
    func fetchDetails() {
        self.loadingState = .loading("Fetching school details")
        service.fetchSchoolDetail()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.loadingState = .failed(error.localizedDescription)
                }
            } receiveValue: { [weak self] schools in
                self?.schoolDetails = schools.filter{ $0.dbn == self?.school.dbn }.first
                self?.loadingState = .loaded
            }
            .store(in: &cancellables)
    }
    
}
