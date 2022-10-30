//
//  Error.swift
//  transition-v1
//
//  Created by Fernando Salom Carratala on 29/10/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidResponse
    case decoderError
    case badRequest
    case badResponse
}
