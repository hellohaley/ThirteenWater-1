//
//  HistoryViewController.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/13.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
    

    
    var page = 0
    var hisDataArr = [HisDataModel]()
    
    @IBOutlet weak var hisPorker1: UIImageView!
    @IBOutlet weak var hisPorker2: UIImageView!
    @IBOutlet weak var hisPorker3: UIImageView!
    @IBOutlet weak var hisPorker4: UIImageView!
    @IBOutlet weak var hisPorker5: UIImageView!
    @IBOutlet weak var hisPorker6: UIImageView!
    @IBOutlet weak var hisPorker7: UIImageView!
    @IBOutlet weak var hisPorker8: UIImageView!
    @IBOutlet weak var hisPorker9: UIImageView!
    @IBOutlet weak var hisPorker10: UIImageView!
    @IBOutlet weak var hisPorker11: UIImageView!
    @IBOutlet weak var hisPorker12: UIImageView!
    @IBOutlet weak var hisPorker13: UIImageView!
    
    @IBOutlet weak var hisTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hisTableView.delegate = self
        hisTableView.dataSource = self
        hisTableView.register(UINib(nibName: HistoryTableViewCell.identifer, bundle: nil), forCellReuseIdentifier: HistoryTableViewCell.identifer)
        
        HubRequest.shared.hisRequest(page: page) { (hisDataarr) in
            self.hisDataArr = hisDataarr
            self.hisTableView.reloadData()
            
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func lastPage(_ sender: Any) {
        page -= 1
        guard page >= 0 else {
            page = 0
            return
        }
        HubRequest.shared.hisRequest(page: page) { (hisDataarr) in
            self.hisDataArr = hisDataarr
            self.hisTableView.reloadData()
            
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        
        page += 1
        HubRequest.shared.hisRequest(page: page) { (hisDataarr) in
            self.hisDataArr = hisDataarr
            self.hisTableView.reloadData()
            
        }
    }

    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
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
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifer, for: indexPath) as! HistoryTableViewCell
        guard hisDataArr.count > indexPath.row else {
            return cell
        }
        cell.gameID.text = "战局号：" + String(hisDataArr[indexPath.row].id)
        cell.scoreLabel.text = "得分：" + String(hisDataArr[indexPath.row].score)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(hisDataArr[indexPath.row].card.first)
        print(hisDataArr[indexPath.row].card.second)
        print(hisDataArr[indexPath.row].card.third)
        
        let firstCards = hisDataArr[indexPath.row].card.first.split(separator: " ")
        self.hisPorker1.image = UIImage(named: toImageName(str: String(firstCards[0])))
        self.hisPorker2.image = UIImage(named: toImageName(str: String(firstCards[1])))
        self.hisPorker3.image = UIImage(named: toImageName(str: String(firstCards[2])))
        let secondCards = hisDataArr[indexPath.row].card.second.split(separator: " ")
        self.hisPorker4.image = UIImage(named: toImageName(str: String(secondCards[0])))
        self.hisPorker5.image = UIImage(named: toImageName(str: String(secondCards[1])))
        self.hisPorker6.image = UIImage(named: toImageName(str: String(secondCards[2])))
        self.hisPorker7.image = UIImage(named: toImageName(str: String(secondCards[3])))
        self.hisPorker8.image = UIImage(named: toImageName(str: String(secondCards[4])))
        let thirdCards = hisDataArr[indexPath.row].card.third.split(separator: " ")
        self.hisPorker9.image = UIImage(named: toImageName(str: String(thirdCards[0])))
        self.hisPorker10.image = UIImage(named: toImageName(str: String(thirdCards[1])))
        self.hisPorker11.image = UIImage(named: toImageName(str: String(thirdCards[2])))
        self.hisPorker12.image = UIImage(named: toImageName(str: String(thirdCards[3])))
        self.hisPorker13.image = UIImage(named: toImageName(str: String(thirdCards[4])))
    }
}
