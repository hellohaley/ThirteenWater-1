//
//  HubRequest.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/10.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HubRequest:NSObject{
    static let shared = HubRequest()
    open var HubData = HubDataModel()
    func loginRequest(userName:String,passWord:String, _ completion: @escaping (HubDataModel) -> ()){
        let parms = [
        "username": userName,
        "password": passWord
        ]
        let header:HTTPHeaders = ["Content-Type":"application/json"]
        Alamofire.request("https://api.shisanshui.rtxux.xyz/auth/login", method: .post, parameters: parms, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess {
//                            print(response)
                if let jsons = response.result.value{
                let jsonDict = JSON(jsons)
                let jsonData = jsonDict["data"]
                guard jsonData.count > 0 else{
                        return
                    }
                    self.HubData.token = jsonData["token"].stringValue
                    self.HubData.userId = jsonData["user_id"].intValue
                }
                completion(self.HubData)
                        } else {
                            print("登录失败：\(response)")
                        }
        }
        
    }
    
    func beginRequest(_ completion: @escaping (HubDataModel) -> ()){
        let header: HTTPHeaders = [
            "X-Auth-Token":HubData.token
        ]
        Alamofire.request("https://api.shisanshui.rtxux.xyz/game/open", method: .post, headers: header).responseJSON { (response) in
            if response.result.isSuccess{
                 if let jsons = response.result.value{
                               let jsonDict = JSON(jsons)
                               let jsonData = jsonDict["data"]
                               guard jsonData.count > 0 else{
                                       return
                                   }
                    self.HubData.id = jsonData["id"].intValue
                    self.HubData.card = jsonData["card"].stringValue
                               }
                completion(self.HubData)
            }else{
                print("开启战局失败:\(response)")
            }
        }
    }
    
 
    func rankRequest(_ completion: @escaping([RankModel]) -> ()){
        var rankDataArr = [RankModel]()
        
        Alamofire.request("https://api.shisanshui.rtxux.xyz/rank", method: .get).responseJSON { (response) in
            if response.result.isSuccess{
                if let jsons = response.result.value{
                    let jsonDict = JSON(jsons)
                    guard jsonDict.count > 10 else{
                        return
                    }
                    for i in 0...jsonDict.count-1{
                        let rankData = RankModel()
                        rankData.name = jsonDict[i]["name"].stringValue
                        rankData.score = jsonDict[i]["score"].intValue
                        rankDataArr.append(rankData)
                    }
                    completion(rankDataArr)
                }
            }else{
                print("请求rank失败：\(response)")
            }
            
        }
    }
    
    func hisRequest(page:Int,_ completion: @escaping([HisDataModel]) -> ()){
        var hisDataArr = [HisDataModel]()
        let header = [
            "X-Auth-Token":HubData.token
        ]
        let parms = [
            "player_id":HubData.userId,
            "limit":5,
            "page":page
        ]
        Alamofire.request("https://api.shisanshui.rtxux.xyz/history", method: .get, parameters: parms, headers: header).responseJSON { (response) in
            if response.result.isSuccess{
                print(response)
               if let jsons = response.result.value{
                    let jsonDict = JSON(jsons)
                    let jsonData = jsonDict["data"]
                guard jsonData.count > 0 else {
                    return 
                }
                    for i in 0...jsonData.count-1{
                        let hisData = HisDataModel()
                        hisData.id = jsonData[i]["id"].intValue
                        hisData.score = jsonData[i]["score"].intValue
                        hisData.card.first = jsonData[i]["card"][0].stringValue
                        hisData.card.second = jsonData[i]["card"][1].stringValue
                        hisData.card.third = jsonData[i]["card"][2].stringValue
//                        guard jsonData[i]["card"].count == 3  else {
//                            return
//                        }

                        hisDataArr.append(hisData)
                    }
                    completion(hisDataArr)
                }
            }else{
                print("战绩列表请求失败：\(response)")
            }
        }
    }
}

