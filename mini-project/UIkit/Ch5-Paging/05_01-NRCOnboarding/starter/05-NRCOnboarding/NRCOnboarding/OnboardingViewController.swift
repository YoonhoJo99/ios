//
//  OnboardingViewController.swift
//  NRCOnboarding
//
//  Created by 조윤호 on 3/15/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!  //pageControl 연결
    
    let messages : [OnboardingMessage] = OnboardingMessage.messages
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
            layout.estimatedItemSize = .zero
        }
        
        pageControl.numberOfPages = messages.count  //pageControl에서 동그라미(.)을 몇 개 만들거냐?
//        pageControl.currentPage = //왔다갔다 할 때 바꿔 주는 것
    }
}

extension OnboardingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else{
            return UICollectionViewCell()
        }
        let message = messages[indexPath.item]
        cell.configure(message)
        return cell
    }
}

extension OnboardingViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    
    //Scroll Direction을 Horizontal로 변경하였다.
    //기본으로 Spacing이 있기 때문에 그 Spacing을 0으로 바꿔줘서 셀 간의 간격이 0이 되었음.
    //밑에 두 함수 있을 때 없을 때 비교하면 차이를 더 확실히 알 수 있음
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

//UIViewController는 ScrollView의 속성을 가지고 있다.
//UIScrollViewDelegate를 통해 현재 스크롤 되고 있는 상황을 파악할 수 있음
extension OnboardingViewController: UIScrollViewDelegate{
    
    //scrollView.contentOffset.x : 첫번째 화면부터 x축으로 얼만큼 멀어 졌는가
    //self.collectionView.bounds.width : collectionView의 넓이
    //이 둘을 나누면 현재 페이지 정보를 알 수 있다.
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(Int(scrollView.contentOffset.x / self.collectionView.bounds.width))
//    }
    
     //스크롤이 천천히 움직이면서 멈추는 경우가 있다. 그걸 감지하는 메소드이다.
     //이 시점에 페이지 컨트롤을 업데이트 할 거임
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//      print("멈췄다.")
        let index = Int(scrollView.contentOffset.x / self.collectionView.bounds.width)
        pageControl.currentPage = index
    }
}
