//
//  Sort.swift
//  Apollo
//
//  Created by benwang on 2021/3/1.
//

import Foundation

class Sort {
    fileprivate(set) var array: [Int] = []

    init(datas: [Int]) {
        self.array = datas
        
        self.sort()
    }

    func swip(lhs: Int, rhs: Int) {
        guard lhs < array.count else { return }
        guard rhs < array.count else { return }

        let temp = array[lhs]
        array[lhs] = array[rhs]
        array[rhs] = temp
    }

    func set(value: Int, for index: Int) {
        guard index < array.count else { return }
       array[index] = value
    }

    func sort() {

    }
}

