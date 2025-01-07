//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Muzzammil Adamjee on 12/6/24.
//

import UIKit

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let url = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
        
    func getAppetizers(completed: @escaping (Result<[Appetizer], Error>) -> Void) {
        guard let url = URL(string: url) else {
            completed(.failure(NetworkError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(NetworkError.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(NetworkError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(NetworkError.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(NetworkError.invalidData))
            }
            
        }
        
        task.resume()
            
    }
    
    func getAppetizersAsync() async throws -> [Appetizer] {
        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
    
        do {
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponse.request
        } catch {
            throw NetworkError.invalidResponse
        }
            
    }
    
    func downloadImage(urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        
        task.resume()
    }
}



