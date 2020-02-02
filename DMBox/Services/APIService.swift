//
//  APIService.swift
//  DMBox
//
//  Created by Consultant on 1/29/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL(String)
    case badDataTask(String)
    case badDecoder(String)
}

typealias MonsterHandler = (Result<[Monster], APIError>) -> Void

let API = APIService.shared

final class APIService {
    
    static let shared = APIService()
    private init() {}
    
    // MARK: Get Monsters
    func getMonstersFromApi(for search: String, completion: @escaping MonsterHandler) {
        
        guard let url = DndAPI(search).monsterURL else {
            completion(.failure(.badURL("Couldn't create Monster Url")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (dat, _, err) in
            if let error = err {
                completion(.failure(.badDataTask("Bad Data Task: \(error.localizedDescription)")))
                return
            }
            
            if let data = dat {
                do {
                    let response = try JSONDecoder().decode(MonsterResults.self, from: data)
                    let monsters = response.results
                    completion(.success(monsters))
                } catch {
                    completion(.failure(.badDecoder(error.localizedDescription)))
                    return
                }
            }
        }.resume()
    } // END - getMonstersFromApi func
    
    
}
