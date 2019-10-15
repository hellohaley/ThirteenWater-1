//
//  RankViewController.swift
//  ThirteenWater
//
//  Created by Zhouxinhuang on 2019/10/14.
//  Copyright © 2019 Zhouxinhuang. All rights reserved.
//

import UIKit

class RankViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankDataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: RankTableViewCell.identifier, for: indexPath) as! RankTableViewCell
        guard rankDataArr.count > indexPath.row else{
            return cell
        }
        cell.nameLabel.text = "第 \(indexPath.row) 名  " + rankDataArr[indexPath.row].name
        cell.rankLabel.text = "积分：" + String(rankDataArr[indexPath.row].score)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    @IBOutlet weak var rankTableView: UITableView!
    var rankDataArr = [RankModel]()
    @IBAction func exit(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
//        let rankTableView = UITableView(frame: .zero)
//        self.view.addSubview(rankTableView)
//        rankTableView.snp.makeConstraints {
//            $0.width.equalTo(300)
//            $0.height.equalTo(200)
//            $0.center.equalToSuperview()
//        }
        HubRequest.shared.rankRequest { (rankDataArr) in
             self.rankDataArr = rankDataArr

            self.rankTableView.reloadData()
        }
        
        rankTableView.delegate = self
        rankTableView.dataSource = self
        rankTableView.register(UINib(nibName: RankTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RankTableViewCell.identifier)
        
//
        // Do any additional setup after loading the view.
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
