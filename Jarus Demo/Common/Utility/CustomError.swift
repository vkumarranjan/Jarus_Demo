//
//  CustomError.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 03/01/21.
//

import Foundation

enum CustomError: Error {
    case badUrlRequest
    case badParamRequest
    case badResponse
    case serverError
    case noInternet
    case unknown
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unknown, .serverError:
            return "Something went wrong. Please try again later."
        case .badResponse:
            return "Response is not in appropriate format."
        case .badParamRequest, .badUrlRequest:
            return "Unable to create url request."
        case .noInternet:
            return "Please check your internet connetion."
        }
    }
}
