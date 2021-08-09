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
        let alert = UIAlertController(title: "Hello", message: "It's my first App.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

