//
//  Network.swift
//  RedSoRefactor
//
//  Created by Jimmy on 2020/11/23.
//

import UIKit
// MARK: - Network
//
class Network {
    
    // MARK: - Call API Data
    static func getAPI<T:Decodable>(baseURL: BaseURL,
                                    endPoint:EndPoint? = nil,
                                    method: String? = "GET",
                                    parameters: [String: Any]? = nil,
                                    type: T.Type, completionHandler: @escaping (T?, NetworkError?) -> Void){
        
        var urlComponent = URLComponents()
                urlComponent.scheme = "http"
                urlComponent.host = "api.openweathermap.org"
                urlComponent.path = "/data/2.5/weather"
        
        let urlString = "\(baseURL.rawValue)\(endPoint?.rawValue ?? "" )"
        
        var urlComponents = URLComponents(string: urlString)!
//        urlComponents.queryItems = []
        if let parameters = parameters
        {
            for (key, value) in parameters{
                guard let value = value as? String else{return}
                urlComponents.queryItems?.append(URLQueryItem(name: key, value: value))
            }
        }
        
        guard let queryedURL = urlComponents.url else{return}
        let request = URLRequest(url: queryedURL)
        DispatchQueue.main.async {
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                let status = response as? HTTPURLResponse
                
                if let _ = error
                {
                    print(error)
                    completionHandler(nil,.unknowError)
                }
                if let jsonData = data
                {
                    print(jsonData.description)
                    do
                    {
                        let typeObject: T? = try JSONDecoder().decode(T.self, from: jsonData)
                        if let typeObject = typeObject
                        {
                            completionHandler(typeObject,nil)
                        }else
                        {
                            throw NetworkError.parseError
                        }
                    }catch
                    {
                        print("錯誤 ＝ ",error)
                        
                        completionHandler(nil,.parseError)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    //MARK: - Download Image with API Data's url
//    static func getImageData(string: String?, completion: @escaping (Data) -> Void)
//    {
//        if let string = string
//        {
//            if let url = URL(string: string)
//            {
//
//                let dataTask =  URLSession.shared.dataTask(with: url) { (data, response, error) in
//                    DispatchQueue.main.async {
//
//
//                        if let data = data
//                        {
//                            completion(data)
//                        }else if let error = error
//                        {
//                            print("URL轉換成Data錯誤 ＝ ",error)
//                        }
//                    }
//                }
//                dataTask.resume()
//
//            }
//        }
//    }
    
}
