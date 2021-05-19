//
//  SelectionSort.swift
//  Apollo
//
//  Created by benwang on 2021/3/1.
//

import Foundation

class SelectionSort: Sort {
    override func sort() {

        guard array.count != 1 else {
            return
        }
        
        // 分成两部分：已排序和未排序，
        // 每次从排序中选择一个最大值或最小值插入到已排序中

        for i in 0..<array.count {

            var min = i
            for j in (i + 1)..<array.count {

                if array[min] > array[j] {
                    min = j
                }
            }
            swip(lhs: i, rhs: min)
        }

        // O(n)
    }
}
