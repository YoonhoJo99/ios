//
//  FrameworkListViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/04/24.
//

import UIKit

class FrameworkListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list: [AppleFramework] = AppleFramework.list
    
    //1. diffable datasource - presentaion
//    var datasource : UICollectionViewDiffableDataSource<Section, AppleFramework>!
    var datasource : UICollectionViewDiffableDataSource<Section, Item>! // [section[Item]]
    typealias Item = AppleFramework //Item의 타입 변경
    enum Section{
        case main
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = "☀️ Apple Frameworks"
        
        // Presentation, Data, Layout
        // 1. diffable datasource - presentaion
        datasource = UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FrameworkCell", for: indexPath) as? FrameworkCell else{
                return nil
            }
            cell.configure(item)
            return cell
        })
        
        // 2. snapshot - data (어떤 섹션에, 어떤 아이템을 넣을 거야?)
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list, toSection: .main)
        datasource.apply(snapshot)
        
        // 3. compositional Layout - layout
        collectionView.collectionViewLayout = layout()
    }
    
    //3.
    private func layout() -> UICollectionViewCompositionalLayout{
        
        //상위 개념에서의 사이즈를 생각해야함. 여기서 아이템 사이즈는 그룹의 width의 0.33, 그룹의 height의 1
        let itemsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemsize)
        
        //섹션의 width의 1, 섹션의 width의 3
        let groupszie = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group =  NSCollectionLayoutGroup.horizontal(layoutSize: groupszie, subitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}


