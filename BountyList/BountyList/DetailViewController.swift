//
//  DetailViewController.swift
//  BountyList
//
//  Created by 설희pc on 2021/11/23.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        // animated는 동작 여부, completion은 동작 후 있을 또다른 동작을 표현
        dismiss(animated: true, completion: nil)
    }
}
