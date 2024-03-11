//
//  ChatListViewController.swift
//  ChatList
//
//  Created by 조윤호 on 3/11/24.
//

import UIKit

class ChatListViewController: UIViewController {
    
    //01. CollectionView를 뷰 컨트롤러에 연결
    @IBOutlet weak var collectionView: UICollectionView!
    
    var chatList :[Chat] = Chat.list
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //02. 컬렉션에 필요한 정보 : Data, Prejentation, Layout
        
        //02. 컬렉션에 필요한 정보는 누군가 전달해줘야한다.
        
        //03. Data, Prejentation를 다루는 것을 뷰 컨트롤러에 위임
        //03. 각각이 프로토콜이기 떄문에 준수를 해줘야함
        collectionView.dataSource = self //Data, Prejentation에 대한 것은 ChatListViewController가 줄 거야.
        collectionView.delegate = self
       
        
        //위치가 여기가 맞는듯 딱히 데이터를 로드할 때 옮기는 게 맞으니..
        chatList = Chat.list.sorted { chat1, chat2 in
            return chat1.date > chat2.date
        }
        
        //      chatList = Chat.list.sorted{$0.date > $1.date}
        /**
           $0와 $1은 클로저 내에서 사용되는 특별한 변수입니다. 이 변수들은 클로저가 적용되는 두 개의 값을 나타냅니다.
           보통 sorted(by:) 메서드 내에서 클로저를 사용할 때, $0은 배열의 첫 번째 요소를 나타내고, $1은 두 번째 요소를 나타냅니다. 클로저는 이러한 변수들을 사용하여 두 요소를 비교하고 정렬 순서를 결정합니다.
           따라서 $0.date와 $1.date는 각 요소의 date 속성을 나타내며, sorted(by:) 메서드는 이들을 비교하여 배열을 정렬합니다. 이 경우 $0.date > $1.date는 두 요소의 date 속성을 비교하여 내림차순으로 정렬하라는 의미입니다.
        */
    }

}

//04. 프로토콜(어떤 해야하는 일의 약속에 대한 정의)를 실제 구현하는 것을 Confirming(준수하다)해줘야한다.
//04. 이 extension이 준수하는 과정이다. 이것들을 알려줘야함
extension ChatListViewController: UICollectionViewDataSource {
    //05-1. 컬렉션 뷰에 포함되는 아이템의 개수는 몇개야?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatList.count  //05-2. 만약 DB가 연동되거나 한다면 당연히 다른 변수겠지. 이 값은 이 프로젝트에서만 유효
    }
    
    //06-1. 셀을 어떻게 표현할꺼야?
    /**
        ChatListCollectionViewCell이 여러 개가 있다고 가정해보자. 4개정도. 그러면 컬렉션 뷰는 이 중 어떤 걸 가져와서 그릴지 고민을 하게 되지
        이럴 때 필요한게 구분자야. 아까 셀 만들고 설정한 identfier 말하는 거.
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //06-2. 이제 셀을 넘겨줄건데 이 cell이 지금 타입이 UICollectionViewCell이라 우리는 ChatListCollectionViewCell로 캐스팅해서 데이터를 받아 업데이트를 할거야
        //06-3. 캐스팅 할 때는 안 될 상황이 있을 수 있으니 guard를 이용해 unwrapping을 도와준다.
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatListCollectionViewCell", for: indexPath) as? ChatListCollectionViewCell else{
            //06-4. 캐스팅 실패 했을 때
            return UICollectionViewCell()
        }
        //06-5. 캐스팅 성공 했을 때
        let chat = chatList[indexPath.item]
        cell.configure(chat)
        return cell
    }
}

//07-1. ChatListViewController가 FlowLayout에 대한 위임을 받을 것이다.
extension ChatListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //07-2. 싱글컬럼이니까 너비는 컬렉션뷰 자체의 너비와 같게, 높이는 100으로 설정
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
    
}
