//
//  BeitiekuViewController.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

class BeitiekuViewController: UIViewController {

    
    var segmentView:UISegmentedControl?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setview()
        
        
    }

    func setview() {
        segmentView = UISegmentedControl(items: ["碑帖库","人物"])
        
        
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
