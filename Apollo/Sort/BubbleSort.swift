//
//  BubbleSort.swift
//  Apollo
//
//  Created by benwang on 2021/2/27.
//

import Foundation

class BubbleSort: Sort {

    override func sort() {

        guard array.count != 1 else {
            return
        }

        for i in 0..<array.count {

            var flag = true

            for j in 1..<array.count - i {
                if array[j - 1] > array[j] {
                    swip(lhs: j - 1, rhs: j)
                    flag = false
                }
            }

            if flag { break; }
        }
    }
}
