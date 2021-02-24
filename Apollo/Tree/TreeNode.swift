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

class TreeBuilder {

    //   A
    //  B C
    // DE FG

    /// 完全二叉树: ABCDEFG
    static func completeBinaryTree() -> TreeNode<String>? {
        let vs = ["A", "B", "C", "D", "E", "F", "G"]
        return buildCompleteBinaryTree(list: vs)
    }

    /// 二叉搜索树 33, 16, 50, 13, 18, 34, 58, 11, 15, 17, 25, 51, 66, 55
    static func binarySearchTree() -> TreeNode<Int>? {
        let vs = [33, 16, 50, 13, 18, 34, 58, nil, 15, 17, 25, nil, nil, 51, 66, nil, nil, nil, nil, nil, nil, 19, 27, nil, 55]

        return buildCompleteBinaryTree(list: vs)
    }

    static func buildCompleteBinaryTree<T>(list:[T?]) -> TreeNode<T>? {

        var nodes: [TreeNode<T>?] = []

        for (i, val) in list.enumerated() {

            if val == nil {
                nodes.append(nil)
            } else {
                nodes.append(TreeNode<T>(value: val!))
            }

            if i == 0   {
                continue // 根节点
            }

            guard let p = nodes[(i - 1) / 2] else {
                continue
            }

            if (i - 1) % 2 == 0 {
                p.left = nodes[i]
            } else {
                p.right = nodes[i]
            }
        }

        return nodes.first ?? nil
    }
}
