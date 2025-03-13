//
//  APIManager.swift
//  20250313-SujoyAdhikary-NYCSchools
//
//  Created by Sujoy Adhikary on 13/03/25.
//

import Foundation
import Combine

enum APIError:Error{
    case decodingFailed
    case networkError(Error)
}
enum CustomError : Error {
    case somethingWentWrong
}


final class APIManager {
    private init(){}
    static let shared = APIManager()
    
    private var cancellable = Set<AnyCancellable>()
    
    func fetchDataWithCombine<T:Codable>(url: String,type : T.Type) -> Future<T,Error>{
        return Future<T,Error> { [weak self] promise in
            guard let self = self else {
                return promise(.failure(CustomError.somethingWentWrong))
            }
            guard let url = URL(string: url) else {
                return promise(.failure(URLError.init(.badURL)))
            }
            
            URLSession.shared.dataTaskPublisher(for: url)
                .tryMap { (data: Data, response: URLResponse) in
                    guard let httpResponse = response as? HTTPURLResponse, 200..<299 ~= httpResponse.statusCode else {
                        throw URLError.init(.badServerResponse)
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Data Fetch completed")
                    case .failure(let failure):
                        promise(.failure(failure))
                    }
                }, receiveValue: { data in
                    promise(.success(data))
                })
                .store(in: &self.cancellable)
            
        }
        
    }
    
    func fetchData<T:Codable>(urlString : String,type: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw URLError.init(.badURL)
        }
//        guard
            let (data,_) = try await URLSession.shared.data(for: URLRequest(url: url))
        
//        let dataString = String(data: data, encoding: .utf8)
//        print(dataString)
//        else {
//            throw APIError.invalidRequest
//        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
}
