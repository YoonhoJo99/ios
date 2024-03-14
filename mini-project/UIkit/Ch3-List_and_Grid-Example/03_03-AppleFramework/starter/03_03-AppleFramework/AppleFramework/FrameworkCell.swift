//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by 조윤호 on 3/14/24.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!

    //FrameWorkData를 받아서 셀을 업데이트해줄 수 있는 메소드
    func configure(_ framework: AppleFramework){
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
}
