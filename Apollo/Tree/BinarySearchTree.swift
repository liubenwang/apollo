//
//  BinarySearchTree.swift
//  Apollo
//
//  Created by benwang on 2021/2/23.
//

import Foundation

class BinarySearchTree {

    static func find(target: Int, tree: TreeNode<Int>?) -> TreeNode<Int>? {
        var p = tree

        while p != nil {
            if  target < p!.value {
                p = p!.left
            } else if target > p!.value {
                p = p!.right
            } else {
                return p
            }
        }
        return nil
    }

    static func insert(target: Int, tree: TreeNode<Int>?) -> TreeNode<Int> {
        if tree == nil {
            return TreeNode(value: target)
        }

        var p = tree

        while p != nil  {
            if target < p!.value {
                if p!.left == nil {
                    p!.left = TreeNode(value: target)
                    break
                } else {
                    p = p!.left
                }
            } else {
                if p?.right == nil  {
                    p?.right = TreeNode(value: target)
                    break
                } else {
                    p = p?.right
                }
            }
        }
        return tree!
    }

    static func delete(target: Int, tree: TreeNode<Int>?) -> TreeNode<Int>? {
        // 查找目标值
        if tree == nil {
            return nil
        }

        var p = tree
        var pp: TreeNode<Int>?
        while p != nil && p?.value != target {
            pp = p
            if p!.value > target  {
                p = p?.left
            } else if p!.value < target {
                p = p?.right
            }
        }

        // 未找到目标值
        if p == nil { return nil }

        // 左右子节点都存在, 将处理两个子节点转化为处理一个子节点
        if p?.left != nil && p?.right != nil {

            var minP = p?.right
            var minPP = p
            // 找到右节点的最小子节点
            while minP?.left != nil {
                minPP = minP
                minP = minP?.left
            }

            // 将最小节点赋值给
            p!.value = minP!.value
            p = minP
            pp = minPP
        }

        // 处理只有一个节点的情况，左节点或右节点

        // 找到ta的子节点
        var child: TreeNode<Int>?
        if p?.left != nil {
            child = p?.left
        } else if p?.right != nil {
            child = p?.right
        }

        // 对父节点的子节点再赋子子节点的值等于删除子节点

        if pp == nil {
            // 没有父节点，说明删除的是根节点
            return child
        } else if pp?.left == p {
            pp?.left = child
        } else if pp?.right != nil {
            pp?.right = child
        }

        return tree
    }

    static func maxDepth(tree: TreeNode<Int>?) -> Int {
        guard tree != nil else {
            return 0
        }

        var queue = [tree!]
        var front = 0
        var rear = queue.count
        var level = 1

        while !queue.isEmpty {
            let first = queue.remove(at: 0)
            front += 1

            if first.left != nil {
                queue.append(first.left!)
            }

            if first.right != nil {
                queue.append(first.right!)
            }

            if front == rear {
                front = 0
                rear = queue.count

                level += queue.isEmpty ? 0 : 1
            }
        }
        return level
    }
}

// MARK: - 测试用例

extension BinarySearchTree {

    static func handler() {
//        testFind()
//        testInsert()
        testDelete()
    }

    static func testFind() {
        let root = TreeBuilder.binarySearchTree()

        let head = find(target: 16, tree: root)
        print(head ?? "nil")
    }

    static func testInsert() {
        let root = TreeBuilder.binarySearchTree()

        let head = insert(target: 20, tree: root)
        print(head)
    }

    static func testDelete() {

//        testDelete(target: 33)
//        testDelete(target: 13)
//        testDelete(target: 18)
//        testDelete(target: 58)
        testLevel()
    }

    static func testDelete(target: Int) {
        let root = TreeBuilder.binarySearchTree()

        print("删除前\(target)：中序遍历")
        BinaryTree.inOrder(tree: root)

        if let h = delete(target: target, tree: root) {
            print("删除后\(target)：中序遍历")
            BinaryTree.inOrder(tree: h)
        } else {
            print("未找到指定值：\(target)")
        }
    }

    static func testLevel() {
        let elements = [9,8]
//        let elements = [33,16,50,13,18,34,58,15,17,25,51,66,19,27,55]
        let root = TreeBuilder.buildBinaryTree(with: elements)
        print("中序遍历")
        BinaryTree.inOrder(tree: root)
       print("最大层是\(maxDepth(tree: root))")
    }
}
