//
//  ShuyouTableViewCell.swift
//  xuexi
//
//  Created by 赫凯 on 2017/3/1.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit
import SDWebImage

class ShuyouTableViewCell: UITableViewCell {

    var nameL,textL,timeL,zanL,pinL:UILabel?
    var touimg,backgView:UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func setview() {
        
        backgView = UIImageView(frame: CGRect(x: 5, y: 5, width: width - 10, height: 290))
        backgView?.contentMode = UIViewContentMode.scaleAspectFill
        backgView?.layer.cornerRadius = 10
        backgView?.layer.masksToBounds = true
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.extraLight)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = (backgView?.frame)!
        blurEffectView.layer.cornerRadius = 10
        blurEffectView.layer.masksToBounds = true
        self.addSubview(backgView!)
        self.addSubview(blurEffectView)
        
        nameL = UILabel(frame: CGRect(x: 60, y: 10, width: 300, height: 12))
        nameL?.font = UIFont.systemFont(ofSize: 12)
        nameL?.textColor = UIColor.black
        
        textL = UILabel(frame: CGRect(x: 60, y: Int((nameL?.yh())!)+5, width:Int(width - 60), height: 100))
        textL?.font = UIFont.systemFont(ofSize: 12)
        textL?.textColor = UIColor.black
        textL?.numberOfLines = 0
        
        touimg = UIImageView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        touimg?.contentMode = UIViewContentMode.scaleAspectFill
        
        self.addSubview(nameL!)
        self.addSubview(textL!)
        self.addSubview(touimg!)
        
    }
    
    
    func setData(dat:[String:AnyObject]){
        nameL?.text = dat["nickname"] as! String?
        textL?.text = dat["text"] as! String?
        
        let touurl = URL(string: serverUrl+"/api/file/get?fid="+(dat["pic"]! as! String))
        
        touimg?.sd_setImage(with: touurl)
        
        let imgArr:Array<String> = dat["pic_list"] as! Array;
        if imgArr.count > 0{
           backgView?.sd_setImage(with: URL(string: serverUrl+"/api/file/get?fid="+imgArr[0]))
        }
    }
    
    func heightjisuan()->Float{
        return textL!.yh()+50
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
