//
//  BountyViewController.swift
//  BountyList
//
//  Created by 설희pc on 2021/10/26.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 데이터
    let nameList = ["brook", "chopper", "franky", "luffy", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 4400000, 300000000, 160000000, 8000000, 77000000, 12000000]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // [1] UITableViewDataSource에 대해 답하는 함수들!
    // (내가 만든건 아니구,, 위에 상속 선언해줬더니 생긴 오류 fix 했더니 만들어줌)
    // => 샐을 어떻게 표현할건지, 몇 개 표현할건지 나타냄
    
    // [1-1] 셀을 몇 개 보여줄건지 지정해주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    // [1-2] 재생할 셀을 지정해주는 함수
    // (셀은 하나만 만들고 재생해서 사용하는고임)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableView 타입인데, 리스트 셀을 쓰고 싶으므로 캐스팅함
        // 하지만 리스트 셀이 없을 경우를 대비해서 옵셔널로 대비 (guard let 구문 이용)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else { return UITableViewCell() }
        
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }
    
    // [2] UITableViewDelegate에 대해 답하는 함수!
    // => 셀을 클릭하면 어떻게 반응할건지 나타냄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        // withIdentifier은 여러 segue 중 어떤 것을 의미하는지 표현, sender는 segue가 실행될 때 같이 보내줄 것을 의미
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

// 커스텀 셀
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
