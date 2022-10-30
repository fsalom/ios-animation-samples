//
//  ListViewModel.swift
//  transition-v1
//
//  Created by Fernando Salom Carratala on 29/10/22.
//

import Foundation

struct InfoDTO: Codable {
    var count: Int
    var pages: Int
    var next: String?
}

struct CharacterDTO: Codable {
    var image: String
    var name: String
}

struct ListDTO: Codable {
    var info: InfoDTO
    var results: [CharacterDTO]
}

class ListViewModel {
    var characters: [CharacterDTO] = []
    var hasNextPage: Bool = true
    
    func getCharactersList() async throws {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            throw NetworkError.badURL
        }
        let request = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }
            let decoder = JSONDecoder()
            do {
                if (200..<300).contains(response.statusCode) {
                    let list = try decoder.decode(ListDTO.self, from: data)
                    self.characters = list.results
                    guard let nextPage = list.info.next else {
                        self.hasNextPage = false
                        return
                    }
                    self.hasNextPage = !nextPage.isEmpty ? true : false
                } else {
                    throw NetworkError.badResponse
                }
            } catch {
                throw NetworkError.decoderError
            }
        } catch {
            throw NetworkError.badRequest
        }
    }
}
