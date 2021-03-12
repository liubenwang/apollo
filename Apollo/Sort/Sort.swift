//
//  Sort.swift
//  Apollo
//
//  Created by benwang on 2021/3/1.
//

import Foundation

class Sort {
    private(set) var datas: [Int] = []

    init(datas: [Int]) {
        self.datas = datas
        
        self.sort()
    }

    func swip(lhs: Int, rhs: Int) {
        guard lhs < datas.count else { return }
        guard rhs < datas.count else { return }

        let temp = datas[lhs]
        datas[lhs] = datas[rhs]
        datas[rhs] = temp
    }

    func set(value: Int, for index: Int) {
        guard index < datas.count else { return }
       datas[index] = value
    }

    func sort() {

    }
}

