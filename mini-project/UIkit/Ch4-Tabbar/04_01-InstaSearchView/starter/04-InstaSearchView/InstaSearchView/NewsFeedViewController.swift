//
//  NewsFeedViewController.swift
//  InstaSearchView
//
//  Created by 조윤호 on 3/15/24.
//

import UIKit
 
class NewsFeedViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            //우리가 직접 사이즈를 정해줄 것이기 때문에 시스템이 알아서 추정하지 말라고 알려줌
            //스토리보드에서 설정도 가능하다. 변경사항을 확인할 때 코드가 더 유리하기 때문에 코드로 하는 것이 좋다.
            flowlayout.estimatedItemSize = .zero
        }
    }
}

extension NewsFeedViewController: UICollectionViewDataSource {
    //컬렉션 뷰 구성에 있어서 아이템이 몇개 필요한거야
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    //셀을 어떻게 표현할거야?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as? FeedCell else {
            return UICollectionViewCell()
        }
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 너비:높이 = 4:3
            let width = collectionView.bounds.width
            let height = width * 3 / 4 + 60
            return CGSize(width: width, height: height)
        }
}



