//
//  BeitiekuViewController.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//
import UIKit
//import Alamofire
import SwiftyJSON


enum Leixing {
    case beitie
    case renwu
}

class BeitiekuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var Ku:Leixing?
    var tablewview:UITableView?
    
    var dataRenwu:JSON?
    var dataArr:JSON?
    
    
    var segmentView:UISegmentedControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataArr = []
        dataRenwu = []
        Ku = .beitie
        self.setview()
        self.getData()
    }
    
    func setview() {
        
        segmentView = UISegmentedControl(items: ["碑帖库","人物"])
        segmentView?.selectedSegmentIndex = 0
        segmentView?.addTarget(self, action: #selector(BeitiekuViewController.segmentDidchange(_:)), for: UIControlEvents.valueChanged)
        //中间视图
        self.navigationItem.titleView = segmentView
        
        //列表
        tablewview = UITableView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        tablewview?.delegate = self
        tablewview?.dataSource = self
        self.view.addSubview(tablewview!)
        
    }
    
    func segmentDidchange(_ segmented:UISegmentedControl)
    {
        switch segmented.selectedSegmentIndex {
        case 0:
            Ku = .beitie
            break
        default:
            Ku = .renwu
            break
        }
        tablewview?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        switch Ku {
        case .beitie?:
            return dataArr![section]["works_list"].count
        default:
            return dataRenwu![section]["author_list"].count
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        switch Ku! {
        case .beitie:
             return (dataArr!.count)
        default:
             return (dataRenwu!.count)
        }

       
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let head = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: 30))
        head.backgroundColor = UIColor.white
        head.textAlignment = NSTextAlignment.center
        switch Ku! {
        case .beitie:
             head.text = dataArr![section]["title"].stringValue
        default:
             head.text = dataRenwu![section]["title"].stringValue
        }
       
        return head
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100
//        return [tableView fd_heightForCellWithIdentifier:@"reuse identifer" configuration:^(id cell) {
//            // Configure this cell with data, same as what you've done in "-tableView:cellForRowAtIndexPath:"
//            // Like:
//            //    cell.entity = self.feedEntities[indexPath.row];
//   
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let identifier = "identtifier";
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if (cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        
        switch Ku! {
        case .beitie:
            cell?.textLabel?.text = dataArr![indexPath.section]["works_list"][indexPath.row]["title"].stringValue
            let url = serverUrl+"/api/file/get?fid="+dataArr![indexPath.section]["works_list"][indexPath.row]["cover_pic"].stringValue
            cell?.imageView?.sd_setImage(with: URL(string: url))

            break
        default:
            cell?.textLabel?.text = dataRenwu![indexPath.section]["author_list"][indexPath.row]["name"].stringValue
            let url = serverUrl+"/api/file/get?fid="+dataRenwu![indexPath.section]["author_list"][indexPath.row]["pic"].stringValue
            cell?.imageView?.sd_setImage(with: URL(string: url))
            break
            
        }
        
        
        return cell!
        
    }
    
    
    //数据提取
    func getData() {
        
        let httpbeitie = serverUrl + "/api/works/dy_list"
        let httpruwu = serverUrl + "/api/author/dy_list"
        
        hkhttps.share.getRequest(urlstr: httpbeitie, params: ["":""]) { (result, error) in
            if result != nil
            {
                print(result!)
                self.dataArr = JSON(result?["dat"]! as Any)
                self.tablewview?.reloadData()
            }
        }
        
        hkhttps.share.getRequest(urlstr: httpruwu, params:  ["":""]) { (result, error) in
            if result != nil
            {
                print(result!)
                self.dataRenwu = JSON(result?["dat"]! as Any)
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


