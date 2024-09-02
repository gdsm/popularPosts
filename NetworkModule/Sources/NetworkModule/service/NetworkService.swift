//
//  File.swift
//  
//
//  Created by Gagandeep on 28/08/24.
//

import Foundation

final class NetworkService: INetworkService {
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func getResponse<T: Codable>(request: String) async -> Result<T, NetworkError> {
        guard let url = URL(string: request) else {
            return .failure(.invalidUrl)
        }
        let urlRequest = URLRequest(url: url)
        return await getResponse(request: urlRequest)
    }

    func getResponse<T: Codable>(request: URLRequest) async -> Result<T, NetworkError> {
        do {
            let result = try await session.data(for: request)
            return parse(data: result.0, response: result.1)
        } catch {
            return .failure(.application)
        }
    }
    
    private func parse<T: Codable>(data: Data, response: URLResponse) -> Result<T, NetworkError> {
        guard let resp = response as? HTTPURLResponse else {
            return .failure(.invlidResponse)
        }
        switch resp.statusCode {
        case 200..<300:
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                return .success(result)
            } catch {
                return .failure(.invalidJson)
            }
        default:
            return .failure(.http(status: resp.statusCode))
        }
    }
}
