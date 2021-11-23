//
//  DetailViewController.swift
//  BountyList
//
//  Created by 설희pc on 2021/11/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // 아웃렛 스토리보드랑 연결
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!

    // 데이터에 필요한 프로퍼티 추가
    var name: String?
    var bounty: Int?
    
    // 자동 생성된 함수로, 디테일뷰가 생성되기 바로 직전에 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() // 업데이트 UI
    }
    
    func updateUI() {
        // name, bounty에 값이 있을 경우 실행
        if let name = self.name, let bounty = self.bounty {
            imgView.image = UIImage(named: "\(name).jpg")
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        // animated는 동작 여부, completion은 동작 후 있을 또다른 동작을 표현
        dismiss(animated: true, completion: nil)
    }
}
