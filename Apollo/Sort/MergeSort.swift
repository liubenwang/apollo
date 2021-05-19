//
//  MergeSort.swift
//  Apollo
//
//  Created by benwang on 2021/3/1.
//

import Foundation

class MergeSort: Sort {

    override func sort() {
        mergeSort(lhs: 0, rhs: array.count - 1)
    }

    func mergeSort(lhs: Int, rhs: Int) {

        guard lhs < rhs else {
            return
        }

        let mid = (lhs + rhs) / 2

        mergeSort(lhs: lhs, rhs: mid)
        mergeSort(lhs: mid + 1, rhs: rhs)
        merge(lhs: lhs, mid: mid, rhs: rhs)
    }

    // [2,4,1,7,3,7,1,9,0]
    func merge(lhs: Int, mid: Int, rhs: Int) {

        var temps = [Int]()

        var index = 0
        var index0 = lhs
        var index1 = mid + 1


        while index0 <= mid && index1 <= rhs {

            if array[index0] <= array[index1] {
                temps.append(array[index0])
                index0 += 1
            } else {
                temps.append(array[index1])
                index1 += 1
            }
            index += 1
        }

        while index0 <= mid {
            temps.append(array[index0])
            index0 += 1
            index += 1
        }

        while index1 <= rhs {
            temps.append(array[index1])
            index1 += 1
            index += 1
        }

        for i in lhs...rhs {
            set(value: temps[i - lhs], for: i)
        }
    }
}
