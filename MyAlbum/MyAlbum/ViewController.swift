//
//  ViewController.swift
//  MyAlbum
//
//  Created by 설희pc on 2021/08/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func hello(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "It's my first App.", preferredStyle: .alert) // 알람 설정
        let action = UIAlertAction(title: "OK", style: .default, handler: nil) // 알람에서 수행할 액션
        alert.addAction(action) // 알람에 액션 추가
        present(alert, animated: true, completion: nil) // 알람 띄우기
    }
    
    
    @IBAction func info(_ sender: Any) {
        let alert = UIAlertController(title: "Info", message: "This is my practice button.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}



