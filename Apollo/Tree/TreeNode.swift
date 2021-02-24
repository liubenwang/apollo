//
//  TreeNode.swift
//  Apollo
//
//  Created by benwang on 2021/2/23.
//

import Foundation

// 定义树结构

class TreeNode<T>: NSObject {
    var left: TreeNode<T>?
    var right: TreeNode<T>?
    var value: T

    init(value: T) {
        self.value = value
    }
}

