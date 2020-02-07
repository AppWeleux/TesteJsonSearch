//
//  GamesTableViewCell.swift
//  TesteJsonSearch
//
//  Created by Mario Azevedo on 07/02/2020.
//  Copyright © 2020 AppWeleuc Inc. All rights reserved.
//


import UIKit


class GamesTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var nameApp: UILabel!
    @IBOutlet weak var section: UILabel!
    @IBOutlet weak var GetLabel: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var ImgSigned: UIImageView!
    @IBOutlet weak var screen1: UIImageView!
    @IBOutlet weak var screen2: UIImageView!
    @IBOutlet weak var screen3: UIImageView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   

    
}



