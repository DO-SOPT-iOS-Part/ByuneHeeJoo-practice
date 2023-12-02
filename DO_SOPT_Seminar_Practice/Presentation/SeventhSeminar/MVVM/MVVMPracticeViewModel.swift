//
//  MVCPracticeViewModel.swift
//  DO_SOPT_Seminar_Practice
//
//  Created by 변희주 on 2023/12/02.
//

import UIKit

final class MVVMPracticeViewModel: NSObject {
    var soptModel: Observable<[SoptMember]> = Observable([
                                   SoptMember(name: "류희재", winning: false, age: 24),
                                   SoptMember(name: "강민수", winning: false, age: 24),
                                   SoptMember(name: "고아라", winning: false, age: 23),
                                   SoptMember(name: "곽성준", winning: false, age: 24),
                                   SoptMember(name: "💜신 이나💜", winning: false, age: 24),
                                   SoptMember(name: "💚신 난다💚", winning: false, age: 23),
                                   SoptMember(name: "💗신 기해💗", winning: false, age: 23),
                                   SoptMember(name: "💙신 짱구💙", winning: false, age: 22),
                                   SoptMember(name: "👶🏻신 생아💛", winning: false, age: 24),
                                   SoptMember(name: "김민주", winning: false, age: 23),
                                   SoptMember(name: "김보연", winning: false, age: 23),
                                   SoptMember(name: "김선우", winning: false, age: 23),
                                   SoptMember(name: "김연수", winning: false, age: 25),
                                   SoptMember(name: "김태경", winning: false, age: 25),
                                   SoptMember(name: "박준혁", winning: false, age: 27),
                                   SoptMember(name: "방민지", winning: false, age: 26),
                                   SoptMember(name: "변상우", winning: false, age: 25),
                                   SoptMember(name: "윤영서", winning: false, age: 22),
                                   SoptMember(name: "윤희슬", winning: false, age: 24),
                                   SoptMember(name: "이민재", winning: false, age: 24),
                                   SoptMember(name: "이우제", winning: false, age: 24),
                                   SoptMember(name: "이윤학", winning: false, age: 25),
                                   SoptMember(name: "이자민", winning: false, age: 24),
                                   SoptMember(name: "이조은", winning: false, age: 23),
                                   SoptMember(name: "이지희", winning: false, age: 24),
                                   SoptMember(name: "전효원", winning: false, age: 23),
                                   SoptMember(name: "정채은", winning: false, age: 23),
                                   SoptMember(name: "최서연", winning: false, age: 23),
                                   SoptMember(name: "최효리", winning: false, age: 23)])
    
    func randomButtonTap() {
        let randomIndex = Int.random(in: 0 ... self.soptModel.value.count - 1)
        self.soptModel.value[randomIndex].winning = true
    }
    
}

extension MVVMPracticeViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return soptModel.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTVC.identifier, for: indexPath) as? CustomTVC else {return UITableViewCell()}
        cell.setData(name: soptModel.value[indexPath.row].name,
                     isWinning: soptModel.value[indexPath.row].winning,
                     age: soptModel.value[indexPath.row].age)
        return cell
    }
}
