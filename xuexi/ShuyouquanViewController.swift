//
//  ShuyouquanViewController.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit
import SwiftyJSON

class ShuyouquanViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableview:UITableView?
    
    var NetData:JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "书友圈"
        // Do any additional setup after loading the view.
        NetData = []
        self.setviews()
        self.getData()
        
    }
    
    func setviews()
    {
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        tableview?.dataSource = self
        tableview?.delegate = self
        self.view.addSubview(tableview!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (NetData?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "identtifier";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil)
        {
            cell = ShuyouTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
    
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let mycell = cell as! ShuyouTableViewCell
        let dic = NetData?[indexPath.row].dictionaryObject
        mycell.setData(dat:dic as! [String : AnyObject])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func getData(){
        
        let qingqiu = serverUrl + "/api/circle/list"
        
        hkhttps.share.getRequest(urlstr: qingqiu, params: ["":""]) { (result, error) in
            if result != nil
            {
                print(result!)
                self.NetData = JSON(result?["dat"]! as Any)
                self.tableview?.reloadData()
            }

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
