//
//  AiPlayRequest.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/13.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AiPlayRequest: NSObject{
    static let shared = AiPlayRequest()
    var sortedCard = SortedCardModel()
    func getSortedCards(id: Int, card: String, _ completion: @escaping (SortedCardModel) -> ()){
        let parms = [
            "status":0,
            "id":id,
            "card":card
            ] as [String : Any]
        Alamofire.request("http://49.235.150.59:8080/thirteenWaterByCzh/getCards", method: .post, parameters: parms).responseJSON { (response) in
            if response.result.isSuccess{
                print(response)
                if let jsons = response.result.value{
                    let jsonDict = JSON(jsons)
                    let cards = jsonDict["card"]
                    self.sortedCard.id = id
                    self.sortedCard.first = cards[0].stringValue
                    self.sortedCard.second = cards[1].stringValue
                    self.sortedCard.third = cards[2].stringValue
                }
                completion(self.sortedCard)
            }else{
                print("sorting cards error:\(response)")
            }
        }
    }
    func submitRequest(id:Int){
        let header = [
            "Content-Type":"application/json",
            "X-Auth-Token":HubRequest.shared.HubData.token
        ]
        let parms = [
            "id":id,
            "card":[
                sortedCard.first,
                sortedCard.second,
                sortedCard.third
            ]
            ] as [String : Any]
        Alamofire.request("https://api.shisanshui.rtxux.xyz/game/submit", method: .post, parameters: parms, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            if response.result.isSuccess{
                print("出牌成功 \(response)")
            }else{
                print("出牌失败 \(response)")
            }
        }
    }
}
