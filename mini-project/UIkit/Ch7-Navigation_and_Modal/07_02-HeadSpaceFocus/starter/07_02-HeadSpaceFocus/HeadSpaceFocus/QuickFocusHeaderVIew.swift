//
//  QuickFocusHeaderVIew.swift
//  HeadSpaceFocus
//
//  Created by 조윤호 on 3/23/24.
//

import UIKit

class QuickFocusHeaderVIew: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(_ title: String){
        titleLabel.text = title
    }
}
