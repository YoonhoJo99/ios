//
//  SearchViewController.swift
//  InstaSearchView
//
//  Created by 조윤호 on 3/15/24.
//

import UIKit

class SearchViewController: UIViewController {
    
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
        
        //navigiation 설정
        self.navigationItem.title = "Search"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchResultsUpdater = self
        self.navigationItem.searchController = searchController
    }
}


extension SearchViewController: UICollectionViewDataSource {
    
    //컬렉션 뷰 구성에 있어서 아이템이 몇개 필요한거야
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 24
    }
    
    //셀을 어떻게 표현할거야?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ResultCell", for: indexPath) as? ResultCell else {
            return UICollectionViewCell()
        }
        let imageName = "animal\(indexPath.item + 1)"
        cell.configure(imageName)
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 1
        let width = (collectionView.bounds.width - interItemSpacing * 2)/3
        let height = width
        return CGSize(width: width, height: height)
    }
    
    //위 함수만으로는 계산이 잘 안된다.
    //스토리보드에서 CollectionView의 minSpacing을 보면 10 10으로 설정되어 있음
    //우리는 1씩만 필요했는데 10으로 설정되어 있어서 잘못 보이는 것이다.
    
    //아이템 간의 좌우 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    //아이템 간의 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

//31번 라인 프로토콜 준수
extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar.text
        print("Search \(search)")
    }
}

