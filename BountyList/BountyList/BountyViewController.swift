//
//  BountyViewController.swift
//  BountyList
//
//  Created by 설희pc on 2021/10/26.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // [ MVVM ]
    
    // Model (데이터 - Struct)
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View (UI 요소 - UIView, UIViewController)
    // - ListCell
    // > ListCell에 필요한 정보를 ViewModel한테서 받자
    // > ListCell은 ViewModel로 부터 받은 정보로 뷰를 업데이트 하자
    
    // ViewModel (중계자 - ViewModel)
    // - BountyViewModel
    // > BountyViewModel을 만들고, 뷰레이어에서 필요한 메서드 만들자
    // > 모델을 가지고 있어야 함(BountyInfo 들을 가지고 있어야 함)
    
    // 데이터
    let viewModel = BountyViewModel()
    
    // ViewController에 있는 함수인데, 상속 받은 클래스에서 다시 쓰는 것이므로 override 했음
    // => 세그웨이를 준비하면서 실행되는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController에 데이터 넘겨주기
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                // 데이터(Model)에 직접 접근하지 않고 중계자(viewModel)를 통해 접근하게 함
                let bountyInfo = viewModel.bountyInfo(at: index)
                
                vc?.viewModel.update(model: bountyInfo)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // [1] UITableViewDataSource에 대해 답하는 함수들!
    // (위에 상속 선언해줬더니 생긴 오류 fix 했더니 만들어줌)
    // => 셀을 어떻게 표현할건지, 몇 개 표현할건지 나타냄
    
    // [1-1] 셀을 몇 개 보여줄건지 지정해주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 데이터(Model)에 직접 접근하지 않고 중계자(viewModel)를 통해 접근하게 함
        return viewModel.numOfBountyInfoList
    }
    
    // [1-2] 재생할 셀을 지정해주는 함수
    // (셀은 하나만 만들고 재생해서 사용하는고임)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // UITableView 타입인데, 리스트 셀을 쓰고 싶으므로 캐스팅함
        // 하지만 리스트 셀이 없을 경우를 대비해서 옵셔널로 대비 (guard let 구문 이용)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else { return UITableViewCell() }
        
        // 데이터(Model)에 직접 접근하지 않고 중계자(viewModel)를 통해 접근하게 함
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        
        cell.update(info: bountyInfo)
        
        return cell
    }
    
    // [2] UITableViewDelegate에 대해 답하는 함수!
    // => 셀을 클릭하면 어떻게 반응할건지 나타냄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        // withIdentifier은 여러 segue 중 어떤 것을 의미하는지 표현, sender는 segue가 실행될 때 같이 보내줄 것을 의미
        // => 여기서는 세그웨이를 실행할 때, 몇 번째 셀이 클릭되었는지 알아야하므로 indexPath의 row값을 보내줌
        performSegue(withIdentifier: "showDetail", sender: indexPath.row) // 세그웨이 실행 함수
    }
}

// 커스텀 셀
class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}

// viewModel (중계자)
class BountyViewModel {
    // 데이터 (MVVM 패턴을 위해서 BountyInfo 구조체를 만들었음)
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 33000000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 4400000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "nami", bounty: 160000000),
        BountyInfo(name: "robin", bounty: 8000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 12000000),
    ]
    
    var sortedList: [BountyInfo] {
        let sortedList = bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
        
        return sortedList
    }
    
    var numOfBountyInfoList: Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index: Int) -> BountyInfo {
        return sortedList[index]
    }
}
