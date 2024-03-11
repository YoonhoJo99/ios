  //
//  ChatListCollectionViewCell.swift
//  ChatList
//
//  Created by 조윤호 on 3/11/24.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell {
    


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    /**
     ChatListCollectionViewCell이 스토리보드에서 정해놓고 뷰 컨트롤러에서 디큐해서 뽑아 쓰잖아. 디큐할 때 "ChatListCollectionViewCell" 이런 아이디 가지고 있는 놈을 스토리보드에서 꺼내와 하잖아.
     그때, 꺼내와질 때 처음 호출되는 함수가 이 함수야 이때 좀 설정할 수 있어 바로 밑에 주석 봐
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        //이렇게 미리 바꿔준 거
        //아무리 찾아도 모르겠다.. final에 있는 프로젝트는 그냥 옵셔널 안붙여도 되던데. 버전차이일 수도 있을 듯..
        thumbnail?.layer.cornerRadius = 40
    }
    
    func configure(_ chat: Chat){
        thumbnail.image = UIImage(named: chat.name)
        nameLabel.text = chat.name
        chatLabel.text = chat.chat
        dateLabel.text = formattedDateString(dateStrig: chat.date)
    }
    
    func formattedDateString(dateStrig: String) -> String {
        
        //2022-04-01 -> 4/1
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        //문자열 -> date
        if let date = formatter.date(from: dateStrig){
            formatter.dateFormat = "M/d"
            return formatter.string(from: date)
        } else{
            return ""
        }
        
    }
}
