//
//  SymboleRollerViewController.swift
//  SymbolRoller
//
//  Created by 조윤호 on 3/6/24.
//

/*
 viewController를 스토리보드를 이용해 구성하는 경우에는 스토리보드의 viewController와 Code의 viewController를 연결해보아야한다.
 스토리보드 노란색 동그라미 안에 사각형이 있는 버튼을 누르고 identity inspector를 들어가서 CustomClass에 코드에 있는 viewController클래스 이름을 적어준다.
 그리고 스토리보드에 있는 컴포넌트를 코드와 연결하고싶으면 컨트롤 누르고 뷰컨트롤러에 연결한다.
 */

import UIKit

//페이지를 나타내는 하나의 단위
class SymboleRollerViewController: UIViewController {
    
    //SF심볼스에서 사용할 심볼들의 이름을 담은 배열
    let symbols : [String]  = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    
    
        
    //인터페이스에있는 뷰들을 코드랑 연결하겠다. : 이미지뷰, 라벨을 뷰컨트롤러에 연결 (컨트롤 누르고 드래그)
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    //페이지가 실제로 스크린에 보일 때 보이는 뷰 컴포넌트들이 메모리에 로드가 되었다라는 시점, 앱이 뜰 때 viewDidLoad()를 거쳐서 뜬다.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TO - DO
        //symbols에서 하나를 임의로 추출하여 이미지와 텍스트를 설정한다.
        //DRY : Do not Reapeat Yourself : 중복된 코드를 보면 참지 말아라.
        reload()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
//
    }
    
    override func viewDidAppear(_ animated: Bool) {
//
    }
    
    //버튼을 클릭했을 때 어떤 걸 수행할 거야
    @IBAction func buttonTapped(_ sender: Any) {
        reload()
    }
    
    func reload(){ 
        let symbol = symbols.randomElement()! //반드시 symbols가 정의되어 있으니 강제로 언래핑해줌
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
    /*
     화면이 뜰 때 ViewController가 뜬다. 그때, 앱의 라이프사이클 처럼 ViewController도 라이프사이클이 있다.

     viewDidLoad() : 뷰의 컨트롤러가 메모리에 로드되고 난 후에 호출됩니다.
     viewDidLoad 메소드는 뷰의 로딩이 완료 되었을 때 시스템에 의해 자동으로 호출되기 때문에 일반적으로 리소스를 초기화하거나 초기 화면을 구성하는 용도로 주로 사용합니다.화면이 처음 만들어질 때 한 번만 실행되므로, 처음 한 번만 실행해야 하는 초기화 코드가 있을 경우 이 메소드 내부에 작성하면 됩니다.
     
     
     viewWillAppear() : 뷰가 이제 나타날 거라는 신호를 컨트롤러에게 알리는 역할을 합니다.
     그럼 이러한 궁금증이 드실 수 있어요. "viewDidLoad도 뷰가 나타나기 전에호출되는데..viewDidLoad랑 똑같은거 아니야?"
     정답은 아니다! (네비게이션 예제를 통해 알 수 있음)
     앱의 초기화 작업은 viewDidLoad에서 해도 되겠지만,다른뷰에서 갔다가 다시 돌아오는 상황에해주고 싶은 처리가 있겠죠? 이때는 viewWillAppear에서 해주면 된답니다.
     
     
     viewDidAppear() : viewDidAppear는 뷰가 나타났다는 것을 컨트롤러에게 알리는 역할을 합니다. 또한 화면에 적용될 애니메이션을 그려줘요.이 viewDidAppear는 뷰가 화면에 나타난 직후에 실행됩니다. 이 것을 제외하고 viewDidAppear와 viewWillAppear는 거의 같아요.
    
     viewWillDisAppear() : 뷰가 사라지기 직전에 호출되는 함수인데요,뷰가 삭제 되려고하고있는 것을 뷰 콘트롤러에 통지합니다.
     마지막인 viewDidDisAppear까지 왔네요!(생명주기는 순환되기 때문에 마지막?은 아닐 수도 있겠지만..)역시 위와 같아요viewDidDisAppear가 호출되면,뷰 컨트롤러가 뷰가 제거되었음을 알려준답니다.
     
     
     
     화면이 뜨기 전에 준비하는 시간을 viewDidLoad()에서 잡자
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
