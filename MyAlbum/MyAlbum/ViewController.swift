//
//  ViewController.swift
//  MyAlbum
//
//  Created by 설희pc on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    // 가격 텍스트
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    // refresh 버튼 클릭 액션
    @IBAction func info(_ sender: Any) {
        let message = "가격은 ₩\(currentValue) 입니다."
        let alert = UIAlertController(title: "Info", message: message, preferredStyle: .alert)
        // 클로저 이용하여 handler 지정
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in self.refresh() })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // 가격 업데이트 함수
    func refresh() {
        // arc4random_uniform은 0부터 입력한 숫자까지 중 랜덤한 숫자를 출력
        // Int로 형변환해준 이유는, 앞서 선언한 currentValue는 Int이고
        // arc4random_uniform은 Int32를 반환하기 때문에!
        currentValue = Int(arc4random_uniform(10000) + 1)
        priceLabel.text = "₩\(currentValue)"
    }
}



