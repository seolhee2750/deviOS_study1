//
//  DetailViewController.swift
//  BountyList
//
//  Created by 설희pc on 2021/11/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // [ MVVM ]
    
    // Model (데이터 - Struct or Class)
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View (UI 요소 - UIView, UIViewController)
    // - ImgView, nameLabel, bountyLabel
    // > 위의 view들은 필요한 정보를 ViewModel한테서 받자
    
    // ViewModel (중계자 - ViewModel)
    // - DetailViewModel
    // > DetailViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들자
    // > 모델을 가지고 있어야 함(BountyInfo를 가지고 있어야 함)
    
    // 아웃렛 스토리보드랑 연결
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    let viewModel = DetailViewModel()
    
    // 자동 생성된 함수로, 디테일뷰가 생성되기 바로 직전에 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // 업데이트 UI
    }
    
    func updateUI() {
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        // animated는 동작 여부, completion은 동작 후 있을 또다른 동작을 표현
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
