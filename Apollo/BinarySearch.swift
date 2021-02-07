//
//  BinarySearch.swift
//  Apollo
//
//  Created by benwang on 2021/2/6.
//

import Foundation

public class BinarySearch {

    static func handler() {

//        test(binarySearch: baseBinarySearch)
//        print("***********检测左边界****************")
//        test(binarySearch: leftBinarySearch)
        print("***********检测右边界****************")
//        test(binarySearch: rightBinarySearch)
        test(binarySearch: right2BinarySearch)
    }

    /// 基础版的二分查找：作用于非重复有序数组
    static func baseBinarySearch(list: [Int], key: Int) -> Int {

        var low = 0;
        var high = list.count

        while low < high {

            let index = (low + high) / 2;
            let current = list[index]

            if current > key {
                high  = index - 1
            } else if current < key {
                low = index + 1
            } else {
                return current
            }
        }
        return -1
    }

    static func leftBinarySearch(nums:[Int], target: Int) -> Int {
        var left = 0
        var right = nums.count

        // [ 2,2,2,2]
        //   0 1 2 3
        while left < right {
            let mid = (left + right) / 2

            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid
            } else {
               right = mid
            }
        }

        if right >= nums.count {
            return -1
        }

        if nums[left] == target {
            return left
        }else {
            return -1
        }
    }

    static func rightBinarySearch(nums: [Int], target: Int) -> Int {
        var left = 0;
        var right = nums.count - 1

        // 左闭右闭区间
        while left <= right {
            let mid = (left + right ) / 2

            if nums[mid] < target {
                left = mid + 1
            } else if target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        // 因为要找最右边的，所以
        // 左边界只考虑找不到的情况
        // 右边考虑最后一个的情况
        if right < 0 || nums[right] != target {
            return -1
        }
        return right
    }

    static func right2BinarySearch(nums: [Int], target: Int) -> Int {
        // 用左闭右开区间查找
        var left = 0
        var right = nums.count

        // 左闭右开，终止条件是 left = right, 右侧越界
        while left < right {
            let mid = (right + left) / 2

            if nums[mid] < target {
                left = mid + 1
            } else if nums[mid] > target {
                right = mid
            } else {
                left = mid + 1
            }
        }

        if left == nums.count && nums[left - 1] != target {
            return -1
        }

        return left - 1
    }
}

extension BinarySearch {

    static func test(binarySearch: ([Int], Int) -> Int) {
        test_same_element(binarySearch)
        test_left_element(binarySearch)
        test_right_element(binarySearch)
        test_demo_element(binarySearch)
    }

    static func test_same_element(_ binarySearch: ([Int], Int) -> Int) {
        let list = [2, 2, 2, 2]
        let target = 2
        let index = binarySearch(list, target)
        handleResult(list: list, target: target, index: index)
    }

    static func test_left_element(_ binarySearch: ([Int], Int) -> Int) {
        let list = [2,3,5,7]
        let target = 1
        let index = binarySearch(list, target)
        handleResult(list: list, target: target, index: index)
    }

    static func test_right_element(_ binarySearch: ([Int], Int) -> Int) {
        let list = [2,3,5,7]
        let target = 8
        let index = binarySearch(list, target)
        handleResult(list: list, target: target, index: index)
    }

    static func test_demo_element(_ binarySearch: ([Int], Int) -> Int) {
        let list = [2,3]
        let target = 2
        let index = binarySearch(list, target)
        handleResult(list: list, target: target, index: index)
    }

    static func handleResult(list:[Int], target: Int, index: Int) {

        var result: Bool = true
        if list.contains(target) {
            result = index != -1 && list[index] == target
        } else {
            result = index == -1
        }

        let title = result ? "✅测试通过✅" : "❎测试失败❎"

        print("\n\(title)\n数组:\(list)\n查找:\(target)\n索引：\(index)\n")
    }
}
