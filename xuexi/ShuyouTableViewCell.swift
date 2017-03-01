//
//  ShuyouTableViewCell.swift
//  xuexi
//
//  Created by 赫凯 on 2017/3/1.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit

class ShuyouTableViewCell: UITableViewCell {

    var nameL,textL,timeL,zanL,pinL:UILabel?
    var touimg:UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func setview() {
        nameL = UILabel(frame: CGRect(x: 60, y: 10, width: 300, height: 12))
        nameL?.font = UIFont.systemFont(ofSize: 10)
        nameL?.textColor = UIColor.white
        
        textL = UILabel(frame: CGRect(x: 60, y: Int((nameL?.yh())!)+5, width:Int(width - 60), height: 100))
        textL?.font = UIFont.systemFont(ofSize: 10)
        textL?.textColor = UIColor.white
        
        touimg = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        
        self.addSubview(nameL!)
        self.addSubview(textL!)
        self.addSubview(touimg!)
        
        self.backgroundColor = UIColor.black
    }
    
    
    func setData(dat:[String:AnyObject]){
        nameL?.text = dat["nickname"] as! String?
        textL?.text = dat["text"] as! String?
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
