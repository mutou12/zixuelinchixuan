//
//  ViewController.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/24.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableview:UITableView?
    
    var dataArr:Array<Dictionary<String, String>>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "临池轩"
        dataArr = [];
        self.view.backgroundColor = UIColor.gray
        self.setviews()
        self.setData()
 
        
    }
    
    func setviews() {
        tableview = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        tableview?.delegate = self
        tableview?.dataSource = self
        self.view.addSubview(tableview!)
    }
    
    
    
    //tableview的代理实现
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (dataArr?.count)!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIdentifier = "Cell"
    
        var cell = tableView.dequeueReusableCell(withIdentifier: initIdentifier)
        if (cell == nil){
             cell =  LinmoTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: initIdentifier)
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let mycell = cell as! LinmoTableViewCell
        mycell.setData(dic: (dataArr?[indexPath.row])!)
//        mycell.cellOffset()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let array:Array<LinmoTableViewCell> = tableview?.visibleCells as! Array<LinmoTableViewCell>
        for ( _, object ) in array.enumerated() {
           object.cellOffset()
        }
    }
    
    //数据添加
    func setData()
    {
        dataArr = [["title":"兰亭序","pic":"5858ce2db5b13c1a0c0330bb"],["title":"书法啊","pic":"584a7857d937260d6408ac05"],["title":"书法啊序","pic":"58857d58cfe5680d288e839d"],["title":"兰亭书法啊","pic":"5858d314b5b13c1a0c03311f"],["title":"我的序","pic":"5885d52dcfe5680d288e85ed"]];
        
        tableview?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

