//
//  FocusViewController.swift
//  HeadSpaceFocus
//
//  Created by 조윤호 on 3/17/24.
//

import UIKit

class FocusViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items : [Focus] = Focus.list
    
    @IBOutlet weak var refreshButton: UIButton!
    
    typealias Item = Focus // Item은 Focus라는 별칭으로 불린다.
    enum Section{
        case main
    }
    
    var datasource: UICollectionViewDiffableDataSource<Section, Item>!
    var curated :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 10  
        
        //Presentation, Data, Layout
        datasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, item in

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FocusCell", for: indexPath) as? FocusCell else  {
                return nil
            }
//            let data = self.items[indexPath.item]
//            cell.configure(item)을 1줄로 표현 가능
            cell.configure(item)
            return cell
        })
        
        //snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        collectionView.collectionViewLayout = layout()
    }
    private func layout() -> UICollectionViewCompositionalLayout{
        
        let itemsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50)) //기본적으로 estimated(50)정도 컨텐츠에 따라 늘어날 수 있음
        let item = NSCollectionLayoutItem(layoutSize: itemsize)
       
        let groupszie = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(50))
        let group =  NSCollectionLayoutGroup.vertical(layoutSize: groupszie, subitems: [item])
                
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20) //섹션의 스페이싱
        section.interGroupSpacing = 10 //그룹간의 스페이싱
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    @IBAction func refreshButtonTapped(_ sender: UIButton) {
        curated.toggle()
        self.items = curated ? Focus.recommendations : Focus.list
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items, toSection: .main)
        datasource.apply(snapshot)
        
        let title = curated ? "See All" : "See Recommendation"
        refreshButton.setTitle(title, for: .normal)
    }
}
