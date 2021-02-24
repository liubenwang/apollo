//
//  BinaryTree.swift
//  Apollo
//
//  Created by benwang on 2021/2/23.
//

import Foundation

class BinaryTree {

    public static func handler() {

        let root = TreeBuilder.completeBinaryTree()
        print("前序遍历:")
        preOrder(tree: root)

        print("中序遍历:")
        inOrder(tree: root)

        print("后序遍历:")
        postOrder(tree: root)

        print("按层遍历")
        levelOrder(tree: root)
    }

    public static func preOrder<T>(tree: TreeNode<T>?) {
        guard let root = tree else { return }
        print(root.value)
        preOrder(tree: root.left)
        preOrder(tree: root.right)
    }

    public static func inOrder<T>(tree: TreeNode<T>?) {
        guard let root = tree else { return }
        inOrder(tree: root.left)
        print(root.value)
        inOrder(tree: root.right)
    }

    public static func postOrder<T>(tree: TreeNode<T>?) {
        guard let root = tree else { return }
        postOrder(tree: root.left)
        postOrder(tree: root.right)
        print(root.value)
    }

    public static func levelOrder<T>(tree: TreeNode<T>?) {
        guard let root = tree else { return }

        var queue = [root]
        var list: [TreeNode<T>] = []

        while !queue.isEmpty {
            let first = queue.remove(at: 0)
            list.append(first)

            if first.left != nil {
                queue.append(first.left!)
            }

            if first.right != nil {
                queue.append(first.right!)
            }
        }
        print(list.map({ $0.value }))
    }

}
