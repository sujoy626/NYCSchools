//
//  SchoolListService.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Combine

protocol SchoolListServiceProtocol {
    func fetchSchoolList() -> AnyPublisher<[SchoolListModel],Error>
//    func fetchWithCombine()->Future<[SchoolListModel],Error>
}


class SchoolListService : SchoolListServiceProtocol{
    func fetchSchoolList() -> AnyPublisher<[SchoolListModel],Error> {
        return Future<[SchoolListModel], Error> { promise in
            Task{
                do{
                    let res =  try await APIManager.shared.fetchData(
                        urlString: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=100",
//                        urlString: "https://dummyjson.com/users",
                        type: [SchoolListModel].self
                    )
                    promise(.success(res))
                }catch {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    
//    func fetchWithCombine()->Future<[SchoolListModel],Error>{
//        return  APIManager.shared
//            .fetchDataWithCombine(
//                url: "https://jsonplaceholder.typicode.com/posts",
//                type: [SchoolListModel].self
//            )
//        
//        
//    }
}
