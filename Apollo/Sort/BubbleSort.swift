//
//  BubbleSort.swift
//  Apollo
//
//  Created by benwang on 2021/2/27.
//

import Foundation

class BubbleSort: Sort {

    override func sort() {

        guard datas.count != 1 else {
            return
        }

        for i in 0..<datas.count {

            var flag = true

            for j in 1..<datas.count - i {
                if datas[j - 1] > datas[j] {
                    swip(lhs: j - 1, rhs: j)
                    flag = false
                }
            }

            if flag { break; }
        }
    }
}
