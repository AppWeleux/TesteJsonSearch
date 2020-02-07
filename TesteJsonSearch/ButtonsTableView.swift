//
//  ButtonsTableView.swift
//  TesteJsonSearch
//
//  Created by Mario Azevedo on 07/02/2020.
//  Copyright © 2020 AppWeleuc Inc. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    required init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
        layer.masksToBounds = true
        backgroundColor = .green
        setTitleColor(UIColor.blue, for: .normal)
        setTitle(NSLocalizedString("Obter", comment: ""), for: .init())
        titleLabel?.font = UIFont.systemFont(ofSize: 15.6, weight: .semibold)
    }
    
    func setupButton() {
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
        layer.masksToBounds = true
        backgroundColor = .green
        setTitleColor(UIColor.white, for: .normal)
        setTitle(NSLocalizedString("Obter", comment: ""), for: .init())
        titleLabel?.font = UIFont.systemFont(ofSize: 15.6, weight: .semibold)
    }
}

