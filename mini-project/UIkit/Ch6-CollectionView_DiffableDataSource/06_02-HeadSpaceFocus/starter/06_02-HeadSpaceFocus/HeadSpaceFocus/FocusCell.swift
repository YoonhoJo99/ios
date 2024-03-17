//
//  FocusCell.swift
//  HeadSpaceFocus
//
//  Created by 조윤호 on 3/17/24.
//

import UIKit

class FocusCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptonLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    //셀의 파일이 스토리보드에서 깨어 났을 때 호출
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.systemIndigo
        contentView.layer.cornerRadius = 10
    }
    
    func configure(_ item: Focus){
        titleLabel.text = item.title
        descriptonLabel.text = item.description
        thumbnailImageView.image = UIImage(systemName: item.imageName)?.withRenderingMode(.alwaysOriginal) //렌더링을 오리지널로 한다(multi color)
    }
}
