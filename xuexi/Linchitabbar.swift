//
//  LinchiViewController.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

class Linchitabbar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let v1 = UINavigationController.init(rootViewController: ViewController())
        v1.tabBarItem.title = "临摹"
        //        v1.tabBarItem.image = UIImage.init(named: <#T##String#>);
        let v2 = UINavigationController.init(rootViewController: BeitiekuViewController())
        v2.tabBarItem.title = "碑帖库"
        //        v1.tabBarItem.image = UIImage.init(named: <#T##String#>);
        let v3 =  UINavigationController.init(rootViewController: ShuyouquanViewController())
        v3.tabBarItem.title = "书友圈"
        //        v1.tabBarItem.image = UIImage.init(named: <#T##String#>);
        let v4 = UINavigationController.init(rootViewController: WoViewController())
        v4.tabBarItem.title = "我"
        //        v1.tabBarItem.image = UIImage.init(named: <#T##String#>);
        
        self.addChildViewController(v1)
        self.addChildViewController(v2)
        self.addChildViewController(v3)
        self.addChildViewController(v4)

//        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object:UIColor.white, forKey:NSForegroundColorAttributeName as NSCopying) as? [String : AnyObject], for:UIControlState.normal)
        
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
