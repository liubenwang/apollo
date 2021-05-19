//
//  InsertSort.swift
//  Apollo
//
//  Created by benwang on 2021/3/1.
//

import Foundation


class InsertionSort: Sort {
    override func sort() {

        guard array.count != 1 else {
            return
        }
        
        // 将数组分成两份，一份已排序，一份未排序，
        // 每次从未排序取出一个值，将其插入已排序中
        for i in 1..<array.count {

            let value = array[i]
            var cur: Int?;

            for j in (0...(i - 1)).reversed() {
                if array[j] > value {
                    set(value: array[j], for: j + 1)
                    cur = j
                } else {
                    break // 比最大的都大，不需要交换
                }
            }

            if let index = cur {
                set(value: value, for: index)
            }
        }

        // O(n * n) 原地排序 稳定排序
    }
}
