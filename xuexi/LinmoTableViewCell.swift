//
//  LinmoTableViewCell.swift
//  xuexi
//
//  Created by 赫凯 on 2017/2/28.
//  Copyright © 2017年 赫凯. All rights reserved.
//

import UIKit
import SDWebImage

class LinmoTableViewCell: UITableViewCell {
    
    var img:UIImageView!
    var title:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil){
           
            
            img = UIImageView(frame: CGRect(x: 0, y: -100, width: width, height: 500))
            img.contentMode = UIViewContentMode.scaleAspectFill;
            self.addSubview(img)
            title = UILabel(frame: CGRect(x: 0, y: 122.5, width: width, height: 50))
            title.font = UIFont.systemFont(ofSize: 50)
            title.textAlignment = NSTextAlignment.center
            title.textColor = UIColor.white
            self.addSubview(title)
            self.layer.masksToBounds = true
        }
    }
    
    func setData(dic:Dictionary<String, String>){
        title.text = dic["title"]
        let urll = serverUrl+"/api/file/get?fid="+dic["pic"]!
        img.sd_setImage(with: URL(string: urll))
    }
    
  
    
    func cellOffset() {
        let toWindow = self.convert(self.bounds, to: self.window)
        
        let windoewCenter = self.superview?.center
        
        let cellOffsetY = toWindow.midY - (windoewCenter?.y)!
        
        let offsetDig = 4.8 * cellOffsetY / (self.superview?.frame.size.height)!
        
        let offset = -offsetDig * 250/2;
        
        let tran = CGAffineTransform.init(translationX: 0, y: offset)
        img.transform = tran
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
