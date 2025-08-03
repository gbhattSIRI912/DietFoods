//
//  DietAPIService.swift
//  DietFoods
//
//  Created by Gaurav on 02/08/25.
//

import Foundation

class DietAPIService {
    func fetchAllDiets(completion: @escaping (Result<DietResponse, Error>) -> Void) {
        guard let url = URL(string: "https://uptodd.com/fetch-all-diets") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let error = NSError(domain: "NoDataError", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data returned from server."])
                completion(.failure(error))
                return
            }

            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DietResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }
}
