//
//  HomeCell.swift
//  InstaSearchView
//
//  Created by 조윤호 on 3/15/24.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //셀 자체가 재사용되기 때문에 재사용을 준비하는 함수가 있다. UICollectionViewCell 내장함수다.
    override func prepareForReuse() {
        super.prepareForReuse()
        thumbnailImageView.image = nil
    }
    
    
    func configure(_ imageName: String){
        thumbnailImageView.image = UIImage(named: imageName)
    }
}
