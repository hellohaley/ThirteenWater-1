//
//  ViewController.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/8.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {

    @IBOutlet weak var userText:UITextField!
    @IBOutlet weak var passWord:UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var mainImageView:UIImageView!
    @IBOutlet weak var rightImageView:UIImageView!
    
    @IBOutlet weak var toRankIcon: UIButton!
    
    @IBOutlet weak var exitButton: UIButton!
    let NetWorkActivityIndicatorView = UIActivityIndicatorView.init(style:.whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.toRankIcon.isHidden = true
        self.exitButton.isHidden = true
        // Do any additional setup after loading the view.
    }

    /*
     #方块
     &红心
     *梅花
     $黑桃
     */
    var hubData = HubDataModel()

    @IBAction func exit(_ sender: Any) {
        self.userText.isHidden = false
        self.passWord.isHidden = false
        self.loginButton.isHidden = false
        self.mainImageView.isHidden = false
        self.rightImageView.isHidden = false
        self.toRankIcon.isHidden = true
        self.exitButton.isHidden = true
        self.view.clear(tag: 001)
        self.view.clear(tag: 002)
    }
    @IBAction func login(_ sender: Any) {
//        KVNProgress.showSuccess(withStatus: "login succeed")
        configreJuhuaView()
        
        NetWorkActivityIndicatorView.startAnimating()
        
        HubRequest.shared.loginRequest(userName: userText.text ?? "", passWord: passWord.text ?? "") { (HubData) in
            self.hubData = HubData
            self.userText.isHidden = true
            self.passWord.isHidden = true
            self.loginButton.isHidden = true
            self.mainImageView.isHidden = true
            self.rightImageView.isHidden = true
            self.toRankIcon.isHidden = false
            self.exitButton.isHidden = false
            self.configureMenuView()
            self.NetWorkActivityIndicatorView.stopAnimating()
        }
    }
    
    
    @IBAction func toRankView(_ sender: Any) {
        let rankVC = RankViewController()
        self.present(rankVC, animated: false, completion: nil)
       
        
//        rankVC.view.tag = 101
//        self.view.addSubview(rankVC.view)
//        let button = UIButton(frame: .zero)
//        button.setImage(UIImage(named: "main_fanhui"), for: .normal)
//        button.tag = 102
//        button.addTarget(self, action: #selector(disRankView), for: .touchUpInside)
//        self.view.addSubview(button)
//        button.snp.makeConstraints{
//            $0.width.equalTo(80)
//            $0.height.equalTo(80)
//            $0.left.equalTo(60)
//            $0.top.equalTo(0)
//        }
        
    }
   
    func configreJuhuaView(){
        NetWorkActivityIndicatorView.frame = CGRect.init(x: 40, y: 100, width: 60, height: 60)
        NetWorkActivityIndicatorView.hidesWhenStopped = true
        NetWorkActivityIndicatorView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0.7175995291)
        NetWorkActivityIndicatorView.layer.masksToBounds = true
        NetWorkActivityIndicatorView.layer.cornerRadius = 6.0
        self.view.addSubview(NetWorkActivityIndicatorView)
        NetWorkActivityIndicatorView.snp.makeConstraints{
            $0.width.equalTo(60)
            $0.height.equalTo(60)
            $0.center.equalToSuperview()
        }
    }
    func configureMenuView(){
        let kUIScreen = UIScreen.main.bounds
        let creatRoomButton = UIButton(frame: .zero)
        creatRoomButton.tag = 001
        creatRoomButton.setImage(UIImage(named: "creatRoom"), for: .normal)
        self.view.addSubview(creatRoomButton)
        creatRoomButton.snp.makeConstraints {
            $0.centerX.equalTo(kUIScreen.width*(0.6))
            $0.centerY.equalTo(kUIScreen.height*(0.4))
            $0.height.equalTo(70)
            $0.width.equalTo(200)
            creatRoomButton.addTarget(self, action: #selector(creatRoom), for: .touchUpInside)
        }
        
        let joinRoomButton = UIButton(frame: .zero)
        joinRoomButton.tag = 002
        joinRoomButton.setImage(UIImage(named: "joinRoom"), for: .normal)
        self.view.addSubview(joinRoomButton)
        joinRoomButton.snp.makeConstraints{
            $0.centerX.equalTo(kUIScreen.width*(0.6))
            $0.centerY.equalTo(kUIScreen.height*(0.6))
            $0.height.equalTo(70)
            $0.width.equalTo(200)
        }
        joinRoomButton.addTarget(self, action: #selector(joinRoom), for: .touchUpInside)
        
    }
    @objc func creatRoom(){
        
        let hvc = HistoryViewController()
        self.present(hvc, animated: false, completion: nil)
        
        
        
    }
    @objc func joinRoom(){
        let gvc = GameViewController()

        configreJuhuaView()
        
        NetWorkActivityIndicatorView.startAnimating()
        
        HubRequest.shared.beginRequest { (HubData) in
//            self.hubData.id = hubData
            let array = HubData.card.split(separator: " ")
            
//            print(array)
//            print(array[0][array[0].startIndex])
//            print(array[0][array[0].index(before: array[0].endIndex)])
            
            self.present(gvc, animated: true) {
                gvc.porker1.image = UIImage(named: toImageName(str: String(array[0])))
                gvc.porker2.image = UIImage(named: toImageName(str: String(array[1])))
                gvc.porker3.image = UIImage(named: toImageName(str: String(array[2])))
                gvc.porker4.image = UIImage(named: toImageName(str: String(array[3])))
                gvc.porker5.image = UIImage(named: toImageName(str: String(array[4])))
                gvc.porker6.image = UIImage(named: toImageName(str: String(array[5])))
                gvc.porker7.image = UIImage(named: toImageName(str: String(array[6])))
                gvc.porker8.image = UIImage(named: toImageName(str: String(array[7])))
                gvc.porker9.image = UIImage(named: toImageName(str: String(array[8])))
                gvc.porker10.image = UIImage(named: toImageName(str: String(array[9])))
                gvc.porker11.image = UIImage(named: toImageName(str: String(array[10])))
                gvc.porker12.image = UIImage(named: toImageName(str: String(array[11])))
                gvc.porker13.image = UIImage(named: toImageName(str: String(array[12])))
                
                gvc.hubData = HubData
                self.NetWorkActivityIndicatorView.stopAnimating()
            }
        }
    }
    
}
func toImageName(str: String) -> String {
    var newStr = ""
    switch str[str.startIndex] {
    case "#":
        if (str.count == 3){
            return "fk" + "10"
        }
        newStr = "fk" + String(str[str.index(before: str.endIndex)])
        return newStr
    case "$":
        if (str.count == 3){
            return "ht" + "10"
        }
        newStr = "ht" + String(str[str.index(before: str.endIndex)])
        return newStr
    case "&":
        if (str.count == 3){
            return "hx" + "10"
        }
        newStr = "hx" + String(str[str.index(before: str.endIndex)])
        return newStr
    case "*":
        if (str.count == 3){
            return "mh" + "10"
        }
        newStr = "mh" + String(str[str.index(before: str.endIndex)])
        return newStr
    default:
        return ""
    }
}

extension UIView {
    
    func clear(tag: Int){
        //通过自己定义的tag 从window里面移除想移除的view
        if let window = UIApplication.shared.keyWindow{
            
            window.viewWithTag(tag)?.removeFromSuperview()
            
        }
    }
    
}
