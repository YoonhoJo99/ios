//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/05/01.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var subscriptions = Set<AnyCancellable>()
    
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "Unknown", imageName: "", urlString: "", description: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    private func bind(){
        // input - Button 클릭
        // framework -> url -> safari -> present
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        // output - Data 세팅 될 때 UI업데이트
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                imageView.image = UIImage(named: framework.imageName)
                titleLabel.text = framework.name
                descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        buttonTapped.send(framework.value)
    }
}
