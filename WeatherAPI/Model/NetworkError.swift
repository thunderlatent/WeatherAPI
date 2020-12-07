//
//  NetworkError.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/23.
//

import Foundation
enum NetworkError: Error
{
    case urlToDataError
    case invalidURL
    case parseError
    case requestError
    case unknowError
}
