//
//  APIRouter.swift
//  GCDExample
//
//  Created by Can Khac Nguyen on 7/16/18.
//  Copyright © 2018 Can Khac Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper
protocol APIRouterDelegate : class{
    func completionWithData(data: [GitInfo])
}
class APIRouter{
    weak var delegate : APIRouterDelegate?
    func getInfoFromGitAPI(){
        let urlPath = "https://api.github.com/users/google/repos"
        let url : URL = URL(string: urlPath)!
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, urlResponse, error) in
            print("Task Complete")
            if error != nil{
                print("Have Error while request \(String(describing: error))")
                return
            }
            var arrayDataa : Array<Any>?
            guard let jData = data else{
                print("Data is founded nil")
                return
            }
            do {
                arrayDataa = try JSONSerialization.jsonObject(with: jData) as? Array
            } catch {
                print("Have Error while parsing data \(error)")
            }
            
            //parse array
            guard let datas = arrayDataa else{
                return
            }
            var results  = [GitInfo]()
            for item in datas{
                if let res = Mapper<GitInfo>().map(JSONObject: item){
                    results.append(res)
                }
                
            }
            if let delegate = self.delegate{
                delegate.completionWithData(data: results)
            }
        }
        task.resume()
    }
}
