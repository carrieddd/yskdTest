//
//  HomeTableViewCell.swift
//  youshikoudaiTest
//
//  Created by iOS110 on 2018/6/19.
//  Copyright © 2018年 dongliang. All rights reserved.
//

import UIKit
import YYKit
class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var contentImage: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(model:HomeModel){
        contentImage.setImageWith(URL.init(string: model.image ?? ""), placeholder: UIImage.init(named: "placeholder"))
        textLbl.text = model.text
    }
}
