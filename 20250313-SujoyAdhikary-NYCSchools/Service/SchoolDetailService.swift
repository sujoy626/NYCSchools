//
//  SchoolDetailService.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Combine

protocol SchoolDetailServiceProtocol {
    func fetchSchoolDetail() -> AnyPublisher<[SchoolDetailModel],Error>
}

class SchoolDetailService : SchoolDetailServiceProtocol{
    func fetchSchoolDetail() -> AnyPublisher<[SchoolDetailModel],Error> {
        return Future<[SchoolDetailModel], Error> { promise in
            Task{
                do{
                    let res = try await APIManager.shared.fetchData(
                        urlString: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json",
                        type: [SchoolDetailModel].self
                    )
                    promise(.success(res))
                }catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
}
