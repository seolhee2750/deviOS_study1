//
//  ViewController.swift
//  MyAlbum
//
//  Created by 설희pc on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func info(_ sender: Any) {
        let message = "가격은 ₩\(currentValue) 입니다."
        let alert = UIAlertController(title: "가격", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        // arc4random_uniform은 0부터 입력한 숫자까지 중 랜덤한 숫자를 출력
        // Int로 형변환해준 이유는, 앞서 선언한 currentValue는 Int이고
        // arc4random_uniform은 Int32를 반환하기 때문에!
        currentValue = Int(arc4random_uniform(10000) + 1)
    }
}



