//
//  MockService.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 14/03/25.
//

import Combine
import Foundation
@testable import _0250313_SujoyAdhikary_NYCSchools

enum ApiError: Error {
    case fileNotFound
}


class SchoolListMockService: SchoolListServiceProtocol {
    var mockPostListData: [SchoolListModel] = []
    var mockError: Error?
    
    func fetchSchoolList() -> AnyPublisher<[SchoolListModel], any Error> {
        return Future<[SchoolListModel], Error> { promise in
            guard let mockFile = Bundle.main.url(forResource: "Schools", withExtension: "json") else {
                return promise(.failure(ApiError.fileNotFound))
            }
            do {
                let data = try Data(contentsOf: mockFile)
                let res = try JSONDecoder().decode([SchoolListModel].self, from: data)
                promise(.success(res))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
}

class SchoolScoreMockService: SchoolDetailServiceProtocol {
    

    var mockPostListData: [SchoolDetailModel] = []
    var mockError: Error?
    
    func fetchSchoolDetail() -> AnyPublisher<[SchoolDetailModel], any Error> {
        return Future<[SchoolDetailModel], Error> { promise in
            guard let mockFile = Bundle.main.url(forResource: "SchoolScore", withExtension: "json") else {
                return promise(.failure(ApiError.fileNotFound))
            }
            do {
                let data = try Data(contentsOf: mockFile)
                let res = try JSONDecoder().decode([SchoolDetailModel].self, from: data)
                promise(.success(res))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
