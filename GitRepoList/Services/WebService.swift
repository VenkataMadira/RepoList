//
//  WebService.swift
//  GitRepoList
//
//  Created by Venkat Madira on 12/11/2019.
//  Copyright © 2019 Venkat Madira. All rights reserved.
//

import Foundation
typealias JSONDictionary = [String:Any]
var model = [Repository]()
class WebService{
    
    func getRepoList(url:URL, completion:@escaping([Repository])->()) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                //print(jsonResponse) //Response result
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
              //  print(jsonArray)
                for dic in jsonArray{
                    model.append(Repository(dic)) // adding now value in Model array
                }
                completion(model)
                /*for dic in jsonArray{
                    guard let title = dic["name"] as? String else { return }
                    print(title) //Output
                }*/
                
                
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    
    }
}
