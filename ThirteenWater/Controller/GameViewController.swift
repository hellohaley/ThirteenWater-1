//
//  GameViewController.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/11.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet weak var containerView:UIView!
    @IBOutlet weak var preContainerView:UIView!
    
    @IBOutlet weak var porker1:UIImageView!
    @IBOutlet weak var porker2:UIImageView!
    @IBOutlet weak var porker3:UIImageView!
    @IBOutlet weak var porker4:UIImageView!
    @IBOutlet weak var porker5:UIImageView!
    @IBOutlet weak var porker6:UIImageView!
    @IBOutlet weak var porker7:UIImageView!
    @IBOutlet weak var porker8:UIImageView!
    @IBOutlet weak var porker9:UIImageView!
    @IBOutlet weak var porker10:UIImageView!
    @IBOutlet weak var porker11:UIImageView!
    @IBOutlet weak var porker12:UIImageView!
    @IBOutlet weak var porker13:UIImageView!
    
    @IBOutlet weak var afPoker1:UIImageView!
    @IBOutlet weak var afPoker2:UIImageView!
    @IBOutlet weak var afPoker3:UIImageView!
    
    @IBOutlet weak var afPoker4:UIImageView!
    @IBOutlet weak var afPoker5:UIImageView!
    @IBOutlet weak var afPoker6:UIImageView!
    @IBOutlet weak var afPoker7:UIImageView!
    @IBOutlet weak var afPoker8:UIImageView!
    
    @IBOutlet weak var afPoker9:UIImageView!
    @IBOutlet weak var afPoker10:UIImageView!
    @IBOutlet weak var afPoker11:UIImageView!
    @IBOutlet weak var afPoker12:UIImageView!
    @IBOutlet weak var afPoker13:UIImageView!
    
    var hubData = HubDataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.isHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func exit(_ sender: Any) {
//        self.removeFromParent()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func play(_ sender: Any){
        AiPlayRequest.shared.getSortedCards(id: hubData.id, card: hubData.card) { (sortedCards) in
            let firstCards = sortedCards.first.split(separator: " ")
            self.afPoker1.image = UIImage(named: toImageName(str: String(firstCards[0])))
            self.afPoker2.image = UIImage(named: toImageName(str: String(firstCards[1])))
            self.afPoker3.image = UIImage(named: toImageName(str: String(firstCards[2])))
            let secondCards = sortedCards.second.split(separator: " ")
            self.afPoker4.image = UIImage(named: toImageName(str: String(secondCards[0])))
            self.afPoker5.image = UIImage(named: toImageName(str: String(secondCards[1])))
            self.afPoker6.image = UIImage(named: toImageName(str: String(secondCards[2])))
            self.afPoker7.image = UIImage(named: toImageName(str: String(secondCards[3])))
            self.afPoker8.image = UIImage(named: toImageName(str: String(secondCards[4])))
            let thirdCards = sortedCards.third.split(separator: " ")
            self.afPoker9.image = UIImage(named: toImageName(str: String(thirdCards[0])))
            self.afPoker10.image = UIImage(named: toImageName(str: String(thirdCards[1])))
            self.afPoker11.image = UIImage(named: toImageName(str: String(thirdCards[2])))
            self.afPoker12.image = UIImage(named: toImageName(str: String(thirdCards[3])))
            self.afPoker13.image = UIImage(named: toImageName(str: String(thirdCards[4])))
            AiPlayRequest.shared.submitRequest(id: self.hubData.id)
        }
        containerView.isHidden = false
        preContainerView.isHidden = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
