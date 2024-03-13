//
//  FrameworkViewController.swift
//  AppleFramework
//
//  Created by 조윤호 on 3/14/24.
//

import UIKit

class FrameworkViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list : [AppleFramework] = AppleFramework.list
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self //여러가지 컬렉션 뷰가 위임하려는 내용(레이아웃 등등..)
    }
        
}

extension FrameworkViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else {
            return UICollectionViewCell()
        }
        let framework = list[indexPath.item]
        cell.configure(framework)
        return cell
    }
    
    
}

extension FrameworkViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        //셀 간의 간격을 10으로 설정
        let interItemSpacing: CGFloat = 10
        let width = (collectionView.bounds.width - interItemSpacing * 2) / 3
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }

    //아이템 간의 거리
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //줄 간의 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


