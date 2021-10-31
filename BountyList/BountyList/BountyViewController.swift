//
//  BountyViewController.swift
//  BountyList
//
//  Created by 설희pc on 2021/10/26.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // [1] UITableViewDataSource에 대해 답하는 함수들!
    // (내가 만든건 아니구,, 위에 상속 선언해줬더니 생긴 오류 fix 했더니 만들어줌)
    // => 샐을 어떻게 표현할건지, 몇 개 표현할건지 나타냄
    
    // [1-1] 셀을 몇 개 보여줄건지 지정해주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // [1-2] 재생할 셀을 지정해주는 함수
    // (셀은 하나만 만들고 재생해서 사용하는고임)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    // [2] UITableViewDelegate에 대해 답하는 함수!
    // => 셀을 클릭하면 어떻게 반응할건지 나타냄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
    }
}

// 커스텀 셀
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
