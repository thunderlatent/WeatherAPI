//
//  WebServices.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/23.
//

import Foundation

class WebServices {
    
    // MARK: - Call This Function To Call API And Convert ResponseDatas To UsableDatas
    static func loadData<T:Decodable>(parameters: [String : Any]? = nil, type: T.Type,completion:@escaping (T?) -> Void)
    {
        DispatchQueue.main.async
        {
            Network.getAPI(baseURL: .openWeatherURL, endPoint: nil, parameters: nil, type: type) { (decodable, networkError) in
               
                completion(decodable)
            }
        }
    }
}
