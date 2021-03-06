//
//  main.swift
//  Test-N-swift
//
//  Created by hyw18042577 on 2021/3/25.
//

import Foundation
class ListNode: Equatable, Hashable {
    public func hash(into hasher: inout Hasher) {
        // 用于唯一标识
        hasher.combine(val)
        hasher.combine(ObjectIdentifier(self))
    }

    static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
    
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
let node1 = ListNode.init(-10)
let node2 = ListNode.init(-3)
let node3 = ListNode.init(0)
let node4 = ListNode.init(5)
let node5 = ListNode.init(9)
//
//let node11 = ListNode.init(1)
//let node13 = ListNode.init(3)
//let node14 = ListNode.init(4)
//
//
//let node22 = ListNode.init(2)
//let node26 = ListNode.init(6)
//
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

//
//node11.next = node13
//node13.next = node14
//
//node22.next = node26

func printList (_ head: ListNode?) {
    var head_node = head
    while head_node != nil {
        print(head_node?.val ?? 0)
        head_node = head_node?.next
    }
}
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


// Definition for a Node.
class Node {
    var val: Int
    var left: Node?
    var right: Node?
    var next: Node?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}


let tree_node_1 = TreeNode.init(1)
let tree_node_2 = TreeNode.init(1)
let tree_node_3 = TreeNode.init(3)
let tree_node_4 = TreeNode.init(4)
let tree_node_5 = TreeNode.init(5)
let tree_node_6 = TreeNode.init(6)
tree_node_2.left = tree_node_1
tree_node_2.right = tree_node_4
tree_node_4.left = tree_node_3
tree_node_4.right = tree_node_5


let new_tree_node_1 = TreeNode.init(1)
let new_tree_node_2 = TreeNode.init(1)
let new_tree_node_3 = TreeNode.init(3)
let new_tree_node_4 = TreeNode.init(4)
let new_tree_node_5 = TreeNode.init(5)
let new_tree_node_6 = TreeNode.init(6)
new_tree_node_2.right = new_tree_node_1
//new_tree_node_2.right = new_tree_node_4
//new_tree_node_4.left = new_tree_node_3
//new_tree_node_4.right = new_tree_node_5
func createTree(_ nums: [Int?]) -> TreeNode? {
    var floor = 0
    var count = 0
    var treeNodes = [TreeNode?](repeating: nil, count: nums.count)
    while nums.count != 0 && count < nums.count {
        let start = Int(powf(2, Float(floor))) - 1
        var end = Int(powf(2, Float(floor + 1))) - 1
        if end > nums.count {
            end = nums.count
        }
        for i in start..<end {
            if nums[i] != nil {
                treeNodes[i] = TreeNode.init(nums[i]!)
            }
            if i > 0 {
                let parent = (i - 1) / 2
                if parent >= 0 {
                    let pNode = treeNodes[parent]
                    if pNode != nil {
                        if i % 2 == 1 {
                            pNode?.left = treeNodes[i]
                        } else {
                            pNode?.right = treeNodes[i]
                        }
                    }
                }
            }
            count += 1
        }
        floor += 1
    }
    return treeNodes[0]
}
//
//let n = createTree([5,4,8,11,nil,13,4,7,2,nil,nil,nil,nil,5,1])
let n = createTree([4,9,0,5,1])

//148. 排序链表
//给你链表的头结点 head ，请将其按 升序 排列并返回 排序后的链表 。
//进阶：
//你可以在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序吗？
//示例 1：
//输入：head = [4,2,1,3]
//输出：[1,2,3,4]
//示例 2：
//输入：head = [-1,5,3,4,0]
//输出：[-1,0,3,4,5]
//示例 3：
//输入：head = []
//输出：[]


func sortList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    let dummy = ListNode.init()
    var h = head
    dummy.next = h
    var last: ListNode?
    while h?.next != nil {
        while last !== h {
            let p = (h?.next)!
            if p.val < h!.val {
                
            }
        }
    }
    
    
}
//146. LRU 缓存机制
//运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制 。
//实现 LRUCache 类：
//LRUCache(int capacity) 以正整数作为容量 capacity 初始化 LRU 缓存
//int get(int key) 如果关键字 key 存在于缓存中，则返回关键字的值，否则返回 -1 。
//void put(int key, int value) 如果关键字已经存在，则变更其数据值；如果关键字不存在，则插入该组「关键字-值」。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。
//进阶：你是否可以在 O(1) 时间复杂度内完成这两种操作？
//示例：
//输入
//["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
//[[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
//输出
//[null, null, null, 1, null, -1, null, -1, 3, 4]
//解释
//LRUCache lRUCache = new LRUCache(2);
//lRUCache.put(1, 1); // 缓存是 {1=1}
//lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
//lRUCache.get(1);    // 返回 1
//lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
//lRUCache.get(2);    // 返回 -1 (未找到)
//lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
//lRUCache.get(1);    // 返回 -1 (未找到)
//lRUCache.get(3);    // 返回 3
//lRUCache.get(4);    // 返回 4
//提示：
//1 <= capacity <= 3000
//0 <= key <= 3000
//0 <= value <= 104
//最多调用 3 * 104 次 get 和 put

//class LinkedNodeList {
//    var val = 0
//    var key = 0
//    var pre: LinkedNodeList?
//    var next: LinkedNodeList?
//    init(_ key: Int, _ val: Int) {
//        self.val = val
//        self.key = key
//    }
//}
//
//class LRUCache {
//    var capacity = 0
//    var kv:[Int: LinkedNodeList] = [Int: LinkedNodeList]()
//    var dummy_head = LinkedNodeList(0, 0)
//    var dummy_tail = LinkedNodeList(0, 0)
//
//    func insertToHead(_ node: LinkedNodeList) {
//        node.next = dummy_head.next
//        dummy_head.next!.pre = node
//        dummy_head.next = node
//        node.pre = dummy_head
//    }
//
//    func removeTailNode() -> LinkedNodeList {
//        return removeNode(dummy_tail.pre!)
//    }
//
//    func removeNode(_ node: LinkedNodeList) -> LinkedNodeList {
//        node.pre?.next = node.next
//        node.next?.pre = node.pre
//        node.pre = nil
//        node.next = nil
//        return node
//    }
//
//    func moveToHead(_ node: LinkedNodeList) {
//        let _ = removeNode(node)
//        insertToHead(node)
//    }
//
//
//    init(_ capacity: Int) {
//        self.capacity = capacity
//        dummy_head.next = dummy_tail
//        dummy_tail.pre = dummy_head
//    }
//
//    func get(_ key: Int) -> Int {
//        if kv.keys.contains(key) {
//            let node = kv[key]!
//            moveToHead(node)
//            return node.val
//        } else {
//            return -1
//        }
//    }
//
//    func put(_ key: Int, _ value: Int) {
//        let node = LinkedNodeList.init(key, value)
//        if kv.keys.contains(key) {
//            let _ = removeNode(kv[key]!)
//            insertToHead(node)
//        } else {
//            if kv.count < 2 {
//                insertToHead(node)
//            } else {
//                let removedNode = removeTailNode()
//                kv[removedNode.key] = nil
//                insertToHead(node)
//            }
//        }
//        kv[key] = node
//    }
//}
//
//let cache = LRUCache(1)
//cache.put(2, 1)
//print(cache.get(2))

//let cache = LRUCache(2)
//cache.put(1, 1)
//cache.put(2, 2)
//print(cache.get(1))
//cache.put(3, 3)
//print(cache.get(2))
//cache.put(4, 4)
//print(cache.get(1))
//print(cache.get(3))
//print(cache.get(4))



//142. 环形链表 II
//给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
//为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。注意，pos 仅仅是用于标识环的情况，并不会作为参数传递到函数中。
//说明：不允许修改给定的链表。
//进阶：
//你是否可以使用 O(1) 空间解决此题？
//示例 1：
//输入：head = [3,2,0,-4], pos = 1
//输出：返回索引为 1 的链表节点
//解释：链表中有一个环，其尾部连接到第二个节点。
//示例 2：
//输入：head = [1,2], pos = 0
//输出：返回索引为 0 的链表节点
//解释：链表中有一个环，其尾部连接到第一个节点。
//示例 3：
//输入：head = [1], pos = -1
//输出：返回 null
//解释：链表中没有环。

//func detectCycle(_ head: ListNode?) -> ListNode? {
//    var slow = head
//    var fast = head
//    while true {
//        if fast == nil || fast?.next == nil {
//            return nil
//        }
//        slow = slow?.next
//        fast = fast?.next?.next
//        if slow == fast {
//            break
//        }
//    }
//    fast = head
//    while slow == fast {
//        slow = slow?.next
//        fast = fast?.next
//    }
//    return fast
//}
//130. 被围绕的区域
//给你一个 m x n 的矩阵 board ，由若干字符 'X' 和 'O' ，找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。
//示例 1：
//输入：board = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
//输出：[["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]]
//解释：被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是“相连”的。
//示例 2：
//输入：board = [["X"]]
//输出：[["X"]]
func solve(_ board: inout [[Character]]) {
    
}
//129. 求根节点到叶节点数字之和
//给你一个二叉树的根节点 root ，树中每个节点都存放有一个 0 到 9 之间的数字。
//每条从根节点到叶节点的路径都代表一个数字：
//例如，从根节点到叶节点的路径 1 -> 2 -> 3 表示数字 123 。
//计算从根节点到叶节点生成的 所有数字之和 。
//叶节点 是指没有子节点的节点。
//示例 1：
//输入：root = [1,2,3]
//输出：25
//解释：
//从根到叶子节点路径 1->2 代表数字 12
//从根到叶子节点路径 1->3 代表数字 13
//因此，数字总和 = 12 + 13 = 25
//示例 2：
//输入：root = [4,9,0,5,1]
//输出：1026
//解释：
//从根到叶子节点路径 4->9->5 代表数字 495
//从根到叶子节点路径 4->9->1 代表数字 491
//从根到叶子节点路径 4->0 代表数字 40
//因此，数字总和 = 495 + 491 + 40 = 1026
//func sumNumbers(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    var results = 0
//    var path = 0
//    path = root!.val
//    dfs(root, &results, &path)
//    return results
//}
//
//func dfs(_ root: TreeNode?, _ results: inout Int, _ path: inout Int) {
//    if root?.left == nil && root?.right == nil {
//        results += path
//        return
//    }
//    if root?.left != nil {
//        path = path * 10 + root!.left!.val
//        dfs(root?.left, &results, &path)
//        path = (path - root!.left!.val) / 10
//    }
//
//    if root?.right != nil {
//        path = path * 10 + root!.right!.val
//        dfs(root?.right, &results, &path)
//        path = (path - root!.right!.val) / 10
//    }
//}
//print(sumNumbers(n))

//128. 最长连续序列
//给定一个未排序的整数数组 nums ，找出数字连续的最长序列（不要求序列元素在原数组中连续）的长度。
//进阶：你可以设计并实现时间复杂度为 O(n) 的解决方案吗？
//示例 1：
//输入：nums = [100,2,200,1,3,4]
//输出：4
//解释：最长数字连续序列是 [1, 2, 3, 4]。它的长度为 4。
//示例 2：
//输入：nums = [0,3,7,2,5,8,4,6,0,1]
//输出：9
//提示：
//0 <= nums.length <= 104
//-109 <= nums[i] <= 109

//func longestConsecutive(_ nums: [Int]) -> Int {
//    var hashSet = Set<Int>.init(minimumCapacity: nums.count)
//    for num in nums {
//        hashSet.insert(num)
//    }
//    var longest = 0
//    for num in hashSet {
//        if !hashSet.contains(num - 1) {
//            var currentNum = num
//            var currentStreak = 1
//            while hashSet.contains(currentNum + 1) {
//                currentNum += 1
//                currentStreak += 1
//            }
//            longest = max(longest, currentStreak)
//        }
//    }
//    return longest
//}
//print(longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
//125. 验证回文串
//给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
//说明：本题中，我们将空字符串定义为有效的回文串。
//示例 1:
//输入: "A man, a plan, a canal: Panama"
//输出: true
//示例 2:
//输入: "race a car"
//输出: false
//func isPalindrome(_ s: String) -> Bool {
//
//    let str = Array(s.lowercased().replacingOccurrences(of: " ", with: ""))
//    var left = 0
//    var right = str.count - 1
//    let zero = ("0" as Character).asciiValue!
//    let nine = ("9" as Character).asciiValue!
//    let a = ("a" as Character).asciiValue!
//    let z = ("z" as Character).asciiValue!
//    let count = str.count
//    while left < right {
//        while left < count && left <= right && !((str[left].asciiValue! >= zero && str[left].asciiValue! <= nine) || (str[left].asciiValue! >= a && str[left].asciiValue! <= z)) {
//            left += 1
//            if left == count || left == right {
//                return true
//            }
//        }
//        while right > 0 && !((str[right].asciiValue! >= zero && str[right].asciiValue! <= nine) || (str[right].asciiValue! >= a && str[right].asciiValue! <= z)) {
//            right -= 1
//        }
//        if left <= right && str[left] == str[right] {
//            left += 1
//            right -= 1
//        } else {
//            return false
//        }
//    }
//    return true
//}
//print(isPalindrome(".,"))
//123. 买卖股票的最佳时机 III
//给定一个数组，它的第 i 个元素是一支给定的股票在第 i 天的价格。
//设计一个算法来计算你所能获取的最大利润。你最多可以完成 两笔 交易。
//注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
//示例 1:
//输入：prices = [0,0,3,1,4,1,5]
//输出：6
//解释：在第 4 天（股票价格 = 0）的时候买入，在第 6 天（股票价格 = 3）的时候卖出，这笔交易所能获得利润 = 3-0 = 3 。
//     随后，在第 7 天（股票价格 = 1）的时候买入，在第 8 天 （股票价格 = 4）的时候卖出，这笔交易所能获得利润 = 4-1 = 3 。
//示例 2：
//输入：prices = [1,2,3,4,5]
//输出：4
//解释：在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
//     注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
//     因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
//示例 3：
//输入：prices = [7,6,4,3,1]
//输出：0
//解释：在这个情况下, 没有交易完成, 所以最大利润为 0。
//示例 4：
//输入：prices = [1]
//输出：0
//func maxProfit(_ prices: [Int]) -> Int {
//
//}
//122. 买卖股票的最佳时机 II
//给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
//设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
//注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
//示例 1:
//输入: [7,1,5,3,6,4]
//输出: 7
//解释: 在第 2 天（股票价格 = 1）的时候买入，在第 3 天（股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
//     随后，在第 4 天（股票价格 = 3）的时候买入，在第 5 天（股票价格 = 6）的时候卖出, 这笔交易所能获得利润 = 6-3 = 3 。
//示例 2:
//输入: [1,2,3,4,5]
//输出: 4
//解释: 在第 1 天（股票价格 = 1）的时候买入，在第 5 天 （股票价格 = 5）的时候卖出, 这笔交易所能获得利润 = 5-1 = 4 。
//     注意你不能在第 1 天和第 2 天接连购买股票，之后再将它们卖出。
//     因为这样属于同时参与了多笔交易，你必须在再次购买前出售掉之前的股票。
//示例 3:
//输入: [7,6,4,3,1]
//输出: 0
//解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。

//func maxProfit(_ prices: [Int]) -> Int {
//    var max_profit = 0
//    var left = 0
//    var right = 1
//    while left < right && right < prices.count {
//        let sub = prices[right] - prices[left]
//        if sub > 0 && ((right < prices.count - 1 && prices[right] > prices[right + 1]) || right == prices.count - 1) {
//            max_profit += sub
//            left = right + 1
//            right = left + 1
//        } else if sub <= 0 {
//            left += 1
//            right += 1
//        } else {
//            right += 1
//        }
//    }
//    return max_profit
//}
//print(maxProfit([7,1,5,3,6,4]))
//121. 买卖股票的最佳时机
//给定一个数组 prices ，它的第 i 个元素 prices[i] 表示一支给定股票第 i 天的价格。
//你只能选择 某一天 买入这只股票，并选择在 未来的某一个不同的日子 卖出该股票。设计一个算法来计算你所能获取的最大利润。
//返回你可以从这笔交易中获取的最大利润。如果你不能获取任何利润，返回 0 。
//示例 1：
//输入：[7,1,5,3,6,4]
//[2,9,3,8,1,9]
//输出：5
//解释：在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
//     注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格；同时，你不能在买入前卖出股票。
//示例 2：
//输入：prices = [7,6,4,3,1]
//输出：0
//解释：在这种情况下, 没有交易完成, 所以最大利润为 0。
//func maxProfit(_ prices: [Int]) -> Int {
//    var left = 0
//    var right = 1
//    var max_profit = 0
//    while left < right && right < prices.count {
//        if prices[left] <= prices[right] {
//            max_profit = max(max_profit, prices[right] - prices[left])
//            right += 1
//        } else {
//            left = right
//            right += 1
//        }
//    }
//    return max_profit
//}
//print(maxProfit([7,6,4,3,1]))

//120. 三角形最小路径和
//给定一个三角形 triangle ，找出自顶向下的最小路径和。
//每一步只能移动到下一行中相邻的结点上。相邻的结点 在这里指的是 下标 与 上一层结点下标 相同或者等于 上一层结点下标 + 1 的两个结点。也就是说，如果正位于当前行的下标 i ，那么下一步可以移动到下一行的下标 i 或 i + 1 。
//示例 1：
//输入：triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
//输出：11
//解释：如下面简图所示：
//   2
//  3 4
// 6 5 7
//4 1 8 3
//自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
//示例 2：
//输入：triangle = [[-10]]
//输出：-10
//提示：
//1 <= triangle.length <= 200
//triangle[0].length == 1
//triangle[i].length == triangle[i - 1].length + 1
//-104 <= triangle[i][j] <= 104
//进阶：
//你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题吗？
//func minimumTotal(_ triangle: [[Int]]) -> Int {
//    var dp = [Int](repeating: 0, count: triangle.count + 1)
//    let n = triangle.count
//    for i in (0...n - 1).reversed() {
//        for j in 0...i {
//            dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
//        }
//    }
//    return dp[0]
//}
//print(minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
//119. 杨辉三角 II
//给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
//
//
//
//在杨辉三角中，每个数是它左上方和右上方的数的和。
//
//示例:
//
//输入: 3
//输出: [1,3,3,1]
//进阶：
//
//你可以优化你的算法到 O(k) 空间复杂度吗？

//func getRow(_ rowIndex: Int) -> [Int] {
//    if rowIndex == 0 {
//        return [1]
//    }
//    var last_path = [1]
//    for i in 1...rowIndex {
//        var path = [Int]()
//        for j in 0...i {
//            if j == 0 {
//                path.append(1)
//            } else if j == i {
//                path.append(1)
//            } else {
//                path.append(last_path[j - 1] + last_path[j])
//            }
//        }
//        last_path = path
//    }
//    return last_path
//}
//118. 杨辉三角
//给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
//在杨辉三角中，每个数是它左上方和右上方的数的和。
//示例:
//输入: 5
//输出:
//[
//     [1],
//    [1,1],
//   [1,2,1],
//  [1,3,3,1],
// [1,4,6,4,1]
//]

//func generate(_ numRows: Int) -> [[Int]] {
//    var res = [[Int]]()
//    res.append([1])
//    for i in 1..<numRows {
//        let last_path = res.last
//        var path = [Int]()
//        for j in 0...i {
//            if j == 0 {
//                path.append(1)
//            } else if j == i {
//                path.append(1)
//            } else {
//                path.append(last_path![j - 1] + last_path![j])
//            }
//        }
//        res.append(path)
//    }
//    return res
//}
//print(generate(8))
//117. 填充每个节点的下一个右侧节点指针 II
//给定一个二叉树
//填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。
//初始状态下，所有 next 指针都被设置为 NULL。
//进阶：
//你只能使用常量级额外空间。
//使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。
//示例：
//输入：root = [1,2,3,4,5,null,7]
//输出：[1,#,2,3,#,4,5,7,#]
//解释：给定二叉树如图 A 所示，你的函数应该填充它的每个 next 指针，以指向其下一个右侧节点，如图 B 所示。序列化输出按层序遍历顺序（由 next 指针连接），'#' 表示每层的末尾。
//提示：
//树中的节点数小于 6000
//-100 <= node.val <= 100
//func connect(_ root: Node?) -> Node? {
//    if root == nil {
//        return nil
//    }
//    var cur = root
//
//    while cur != nil {
//        let dummy = Node.init(0)
//        var pre = dummy
//        while cur != nil {
//            if cur?.left != nil {
//                pre.next = cur?.left
//                pre = pre.next!
//            }
//            if cur?.right != nil {
//                pre.next = cur?.right
//                pre = pre.next!
//            }
//            cur = cur?.next
//        }
//        cur = dummy.next
//    }
//    return root
//}
//116. 填充每个节点的下一个右侧节点指针
//给定一个 完美二叉树 ，其所有叶子节点都在同一层，每个父节点都有两个子节点。二叉树定义如下：
//struct Node {
//  int val;
//  Node *left;
//  Node *right;
//  Node *next;
//}
//填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。
//初始状态下，所有 next 指针都被设置为 NULL。
//进阶：
//你只能使用常量级额外空间。
//使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。
//示例：
//输入：root = [1,2,3,4,5,6,7]
//输出：[1,#,2,3,#,4,5,6,7,#]
//解释：给定二叉树如图 A 所示，你的函数应该填充它的每个 next 指针，以指向其下一个右侧节点，如图 B 所示。序列化的输出按层序遍历排列，同一层节点由 next 指针连接，'#' 标志着每一层的结束。
//提示：
//树中节点的数量少于 4096
//-1000 <= node.val <= 1000

//func connect(_ root: Node?) -> Node? {
//    if root == nil {
//        return nil
//    }
//    var queue = [Node]()
//    var prev: Node?
//    queue.append(root!)
//    while queue.count != 0 {
//        let size = queue.count
//        prev = nil
//        for _ in 0..<size {
//            let r = queue.removeFirst()
//            if prev != nil {
//                prev?.next = r
//            }
//            prev = r
//            if r.left != nil {
//                queue.append(r.left!)
//            }
//            if r.right != nil {
//                queue.append(r.right!)
//            }
//        }
//    }
//    return root
//}

//114. 二叉树展开为链表
//给你二叉树的根结点 root ，请你将它展开为一个单链表：
//展开后的单链表应该同样使用 TreeNode ，其中 right 子指针指向链表中下一个结点，而左子指针始终为 null 。
//展开后的单链表应该与二叉树 先序遍历 顺序相同。
//示例 1：
//输入：root = [1,2,5,3,4,null,6]
//输出：[1,null,2,null,3,null,4,null,5,null,6]
//示例 2：
//输入：root = []
//输出：[]
//示例 3：
//输入：root = [0]
//输出：[0]

//func flatten(_ root: TreeNode?) {
//    if root == nil {
//        return
//    }
//    var stack = [TreeNode]()
//    stack.append(root!)
//    var prev: TreeNode?
//    while stack.count != 0 {
//        let cur = stack.popLast()
//        if prev != nil {
//            prev?.left = nil
//            prev?.right = cur
//        }
//        if cur?.right != nil {
//            stack.append(cur!.right!)
//        }
//        if cur?.left != nil {
//            stack.append(cur!.left!)
//        }
//        prev = cur
//    }
//}
//flatten(n)
//113. 路径总和 II
//给你二叉树的根节点 root 和一个整数目标和 targetSum ，找出所有 从根节点到叶子节点 路径总和等于给定目标和的路径。
//叶子节点 是指没有子节点的节点。
//示例 1：
//输入：root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
//输出：[[5,4,11,2],[5,8,4,5]]
//示例 2：
//输入：root = [1,2,3], targetSum = 5
//输出：[]
//示例 3：
//输入：root = [1,2], targetSum = 0
//输出：[]
//func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
//    if root == nil {
//        return []
//    }
//    var results = [[Int]]()
//    var path = [Int]()
//    path.append(root!.val)
//    dfs(root, targetSum, &path, &results)
//    return results
//}
//
//func dfs(_ root: TreeNode?, _ targetSum: Int, _ path: inout [Int], _ results: inout [[Int]]) {
//    if root?.left == nil && root?.right == nil {
//        if targetSum - root!.val == 0 {
//            results.append(path)
//        }
//        return
//    }
//    if root?.left != nil {
//        path.append(root!.left!.val)
//        dfs(root?.left, targetSum - root!.val, &path, &results)
//        path.removeLast()
//    }
//
//    if root?.right != nil {
//        path.append(root!.right!.val)
//        dfs(root?.right, targetSum - root!.val, &path, &results)
//        path.removeLast()
//    }
//}
//print(pathSum(n, 22))
//print(n)
//112. 路径总和
//给你二叉树的根节点 root 和一个表示目标和的整数 targetSum ，判断该树中是否存在 根节点到叶子节点 的路径，这条路径上所有节点值相加等于目标和 targetSum 。
//叶子节点 是指没有子节点的节点。
//示例 1：
//输入：root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
//输出：true
//示例 2：
//输入：root = [1,2,3], targetSum = 5
//输出：false
//示例 3：
//输入：root = [1,2], targetSum = 0
//输出：false
//深度优先遍历
//func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//    if root == nil {
//        return false
//    }
//    if root?.left == nil && root?.right == nil {
//        return targetSum == root!.val
//    }
//    return hasPathSum(root?.left, targetSum - root!.val) || hasPathSum(root?.right, targetSum - root!.val)
//}

//
//func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
//    if root == nil {
//        return false
//    }
//    if root?.left == nil && root?.right == nil {
//        return targetSum == root!.val
//    }
//    return hasPathSum(root?.left, targetSum - root!.val) || hasPathSum(root?.right, targetSum - root!.val)
//}

//111. 二叉树的最小深度
//给定一个二叉树，找出其最小深度。
//最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
//说明：叶子节点是指没有子节点的节点。
//示例 1：
//输入：root = [3,9,20,null,null,15,7]
//输出：2
//示例 2：
//输入：root = [2,null,3,null,4,null,5,null,6]
//输出：5
//func minDepth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    if root?.left == nil && root?.right == nil {
//        return 1
//    }
//    if root?.left == nil && root?.right != nil {
//        return minDepth(root?.right) + 1
//    }
//    if root?.right == nil && root?.left != nil {
//        return minDepth(root?.left) + 1
//    }
//    return min(minDepth(root?.left), minDepth(root?.right)) + 1
//}
//func minDepth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    if root?.left == nil && root?.right == nil {
//        return 1
//    }
//    var min_depth = Int(Int.max)
//    if root?.left != nil {
//        min_depth = min(minDepth(root?.left), min_depth)
//    }
//    if root?.right != nil {
//        min_depth = min(minDepth(root?.right), min_depth)
//    }
//    return min_depth + 1
//}

//广度优先遍历
//func minDepth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    var queue = [[String: Any]]()
//    queue.append(["TreeNode": root!, "Depth": 1])
//    while queue.count != 0 {
//        let size = queue.count
//        for _ in 0..<size {
//            let map = queue.removeFirst()
//            let r = map["TreeNode"] as! TreeNode
//            let depth = map["Depth"] as! Int
//            if r.left == nil && r.right == nil {
//                return depth
//            }
//            if r.left != nil {
//                queue.append(["TreeNode": r.left!, "Depth": depth + 1])
//            }
//            if r.right != nil {
//                queue.append(["TreeNode": r.right!, "Depth": depth + 1])
//            }
//        }
//    }
//    return 0
//}
//
//print(minDepth(tree_node_2))

//110. 平衡二叉树
//给定一个二叉树，判断它是否是高度平衡的二叉树。
//本题中，一棵高度平衡二叉树定义为：
//一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1 。
//示例 1：
//输入：root = [3,9,20,null,null,15,7]
//输出：true
//示例 2：
//输入：root = [1,2,2,3,3,null,null,4,4]
//输出：false
//示例 3：
//输入：root = []
//输出：true

//自底向上
//func isBalanced(_ root: TreeNode?) -> Bool {
//    return dfs(root) != -1
//}
//
//func dfs(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    let left = dfs(root?.left)
//    if left == -1 {
//        return -1
//    }
//    let right = dfs(root?.right)
//    if right == -1 {
//        return -1
//    }
//    let abs_lr = abs(left - right)
//    return abs_lr < 2 ? max(left, right) + 1 : -1
//}
//自顶向下
//func isBalanced(_ root: TreeNode?) -> Bool {
//    if root == nil {
//        return true
//    }
//    return abs((depth(root?.left) - depth(root?.right))) < 2 && isBalanced(root?.left) && isBalanced(root?.right)
//}
//
//func depth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    return max(depth(root?.left), depth(root?.right)) + 1
//}



//109. 有序链表转换二叉搜索树
//给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。
//本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
//示例:
//给定的有序链表： [-10, -3, 0, 5, 9],
//一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：
//
//      0
//     / \
//   -3   9
//   /   /
// -10  5

//func sortedListToBST(_ head: ListNode?) -> TreeNode? {
//    return buildTree(head, nil)
//}
//
//func buildTree(_ left: ListNode?, _ right: ListNode?) -> TreeNode? {
//    if left != nil && right != nil && left!.val == right!.val {
//        return nil
//    }
//    if left == nil && right == nil {
//        return nil
//    }
//    var mid = left
//    var r = left
//    while r?.val != right?.val && r?.next?.val != right?.val {
//        mid = mid?.next
//        r = r?.next
//        r = r?.next
//    }
//    let root = TreeNode.init(mid!.val)
//    root.left = buildTree(left, mid)
//    root.right = buildTree(mid?.next, right)
//    return root
//}
//
//let root = sortedListToBST(node1)
//print(root)

//108. 将有序数组转换为二叉搜索树
//给你一个整数数组 nums ，其中元素已经按 升序 排列，请你将其转换为一棵 高度平衡 二叉搜索树。
//高度平衡 二叉树是一棵满足「每个节点的左右两个子树的高度差的绝对值不超过 1 」的二叉树。
//示例 1：
//输入：nums = [-10,-3,0,5,9]
//输出：[0,-3,9,-10,null,5]
//解释：[0,-10,5,null,-3,null,9] 也将被视为正确答案：
//示例 2：
//输入：nums = [1,3]
//输出：[3,1]
//解释：[1,3] 和 [3,1] 都是高度平衡二叉搜索树。
//提示：
//1 <= nums.length <= 104
//-104 <= nums[i] <= 104
//nums 按 严格递增 顺序排列
//func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
//    if nums.count == 0 {
//        return nil
//    }
//    if nums.count == 1 {
//        return TreeNode.init(nums[0])
//    }
//    let middle = nums.count / 2
//    let root = TreeNode.init(nums[middle])
//    root.left = sortedArrayToBST(Array(nums[0..<middle]))
//
//    if middle >= nums.count - 1 {
//        root.right = nil
//    } else {
//        root.right = sortedArrayToBST(Array(nums[(middle + 1)..<nums.count]))
//    }
//    return root
//}
//
//let root = sortedArrayToBST([-10,-3,0,5,9])
//print(root)
//107. 二叉树的层序遍历 II
//给定一个二叉树，返回其节点值自底向上的层序遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
//例如：
//给定二叉树 [3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//返回其自底向上的层序遍历为：
//[
//  [15,7],
//  [9,20],
//  [3]
//]

//func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
//    if root == nil {
//        return []
//    }
//    var queue = [TreeNode]()
//    var res = [[Int]]()
//    queue.append(root!)
//    while queue.count != 0 {
//        let size = queue.count
//        var list = [Int]()
//        for _ in 0..<size {
//            let r = queue.removeFirst()
//            if r.left != nil {
//                queue.append(r.left!)
//            }
//            if r.right != nil {
//                queue.append(r.right!)
//            }
//            list.append(r.val)
//        }
//        res.insert(list, at: 0)
//    }
//    return res
//}
//106. 从中序与后序遍历序列构造二叉树
//根据一棵树的中序遍历与后序遍历构造二叉树。
//注意:
//你可以假设树中没有重复的元素。
//例如，给出
//中序遍历 inorder = [9,3,15,20,7]
//后序遍历 postorder = [9,15,7,20,3]
//返回如下的二叉树：
//
//    3
//   / \
//  9  20
//    /  \
//   15   7

//func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
//    var inorder_map = [Int: Int]()
//    for i in 0..<inorder.count {
//        inorder_map[inorder[i]] = i
//    }
//    return myBuildTree(postorder, inorder, 0, postorder.count - 1, 0, inorder.count - 1, inorder_map)
//}
//
//func myBuildTree(_ postorder: [Int], _ inorder: [Int], _ postorder_left: Int, _ postorder_right: Int, _ inorder_left: Int, _ inorder_right: Int, _ map: [Int: Int]) -> TreeNode? {
//    if postorder_left > postorder_right || inorder_left > inorder_right {
//        return nil
//    }
//    //后序遍历 的根结点
//    let postorder_root = postorder[postorder_right]
//    //中序遍历 的根结点
//    let inorder_root = map[postorder_root]!
//    //求出左子树的长度
//    let right_length = inorder_right - inorder_root
//
//    //构造根结点
//    let root = TreeNode.init(postorder_root)
//    root.right = myBuildTree(postorder, inorder, postorder_right - right_length, postorder_right - 1, inorder_root + 1, inorder_right, map)
//
//    root.left = myBuildTree(postorder, inorder, postorder_left, postorder_right - right_length - 1, inorder_left, inorder_root - 1, map)
//    return root
//}
//let tree = buildTree([9,3,15,20,7], [9,15,7,20,3])
//
//print(tree?.val)


//105. 从前序与中序遍历序列构造二叉树
//根据一棵树的前序遍历与中序遍历构造二叉树。
//注意:
//你可以假设树中没有重复的元素。
//例如，给出
//前序遍历 preorder = [3,9,20,15,7]
//中序遍历 inorder = [9,3,15,20,7]
//返回如下的二叉树：
//
//    3
//   / \
//  9  20
//    /  \
//   15   7

//func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//    var inorder_map = [Int: Int]()
//    for i in 0..<inorder.count {
//        inorder_map[inorder[i]] = i
//    }
//    return myBuildTree(preorder, inorder, 0, preorder.count - 1, 0, preorder.count - 1, inorder_map)
//}
//
//func myBuildTree(_ preorder: [Int], _ inorder: [Int], _ preorder_left: Int, _ preorder_right: Int, _ inorder_left: Int, _ inorder_right: Int, _ map: [Int: Int]) -> TreeNode? {
//    if preorder_left > preorder_right {
//        return nil
//    }
//    //前序遍历 的根结点
//    let preorder_root = preorder[preorder_left]
//    //中序遍历 的根结点
//    let inorder_root = map[preorder_root]!
//    //求出左子树的长度
//    let left_length = inorder_root - inorder_left
//
//    //构造根结点
//    let root = TreeNode.init(preorder_root)
//    root.left = myBuildTree(preorder, inorder, preorder_left + 1, preorder_left + left_length, inorder_left, inorder_root - 1, map)
//    root.right = myBuildTree(preorder, inorder, preorder_left + left_length + 1, preorder_right, inorder_root + 1, inorder_right, map)
//    return root
//}
//
//let tree = buildTree([3,9,20,15,7], [9,3,15,20,7])
//
//print(tree?.val)


//104. 二叉树的最大深度
//给定一个二叉树，找出其最大深度。
//二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
//说明: 叶子节点是指没有子节点的节点。
//示例：
//给定二叉树 [3,9,20,null,null,15,7]，
//    3
//   / \
//  9  20
//    /  \
//   15   7
//返回它的最大深度 3 。
//BFS
//func maxDepth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    var res = 0
//    var queue = [TreeNode]()
//    queue.append(root!)
//    while queue.count != 0 {
//        for _ in 0..<queue.count {
//            let r = queue.removeFirst()
//            if r.left != nil {
//                queue.append(r.left!)
//            }
//            if r.right != nil {
//                queue.append(r.right!)
//            }
//        }
//        res += 1
//    }
//    return res
//}
//DFS
//func maxDepth(_ root: TreeNode?) -> Int {
//    if root == nil {
//        return 0
//    }
//    return max(maxDepth(root?.left), maxDepth(root?.right)) + 1
//}
//103. 二叉树的锯齿形层序遍历
//给定一个二叉树，返回其节点值的锯齿形层序遍历。（即先从左往右，再从右往左进行下一层遍历，以此类推，层与层之间交替进行）。
//例如：
//给定二叉树 [3,9,20,null,null,15,7],
//
//    3
//   / \
//  9  20
//    /  \
//   15   7
//返回锯齿形层序遍历如下：
//[
//  [3],
//  [20,9],
//  [15,7]
//]
//func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
//    if root == nil {
//        return []
//    }
//    var res = [[Int]]()
//    var queue = [TreeNode]()
//    queue.append(root!)
//    var direction = 1
//    while queue.count != 0 {
//        var level_list = [Int]()
//        for i in (0..<queue.count).reversed() {
//            let root = queue.remove(at: i)
//            level_list.append(root.val)
//            if direction == -1 {
//                if root.right != nil {
//                    queue.append(root.right!)
//                }
//                if root.left != nil {
//                    queue.append(root.left!)
//                }
//            } else {
//                if root.left != nil {
//                    queue.append(root.left!)
//                }
//                if root.right != nil {
//                    queue.append(root.right!)
//                }
//            }
//        }
//        direction = -direction
//        res.append(level_list)
//    }
//    return res
//}
//102. 二叉树的层序遍历
//给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。
//示例：
//二叉树：[3,9,20,null,null,15,7],
//    3
//   / \
//  9  20
//    /  \
//   15   7
//返回其层序遍历结果：
//[
//  [3],
//  [9,20],
//  [15,7]
//]
//func levelOrder(_ root: TreeNode?) -> [[Int]] {
//    if root == nil {
//        return []
//    }
//    var res = [[Int]]()
//    var queue = [TreeNode]()
//    queue.append(root!)
//    while queue.count != 0 {
//        var level_list = [Int]()
//        for _ in 0..<queue.count {
//            let root = queue.removeFirst()
//            level_list.append(root.val)
//            if root.left != nil {
//                queue.append(root.left!)
//            }
//            if root.right != nil {
//                queue.append(root.right!)
//            }
//        }
//        res.append(level_list)
//    }
//    return res
//}

//101. 对称二叉树
//给定一个二叉树，检查它是否是镜像对称的。
//例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
//
//    1
//   / \
//  2   2
// / \ / \
//3  4 4  3
//
//但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
//
//    1
//   / \
//  2   2
//   \   \
//   3    3
//进阶：
//你可以运用递归和迭代两种方法解决这个问题吗？
//func isSymmetric(_ root: TreeNode?) -> Bool {
//
//    return compareTowNode(root?.left, root?.right)
//}
//
//func compareTowNode(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//    if left == nil && right == nil {
//        return true
//    }
//    if left == nil || right == nil {
//        return false
//    }
//    if left?.val != right?.val {
//        return false
//    }
//    return compareTowNode(left?.left, right?.right) && compareTowNode(left?.right, right?.left)
//}
//func isSymmetric(_ root: TreeNode?) -> Bool {
//    return check(root?.left, root?.right)
//}
//
//func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
//    var link_list = [TreeNode]()
//    if (left != nil && right == nil) || (left == nil && right != nil) {
//        return false
//    }
//    link_list.append(left!)
//    link_list.append(right!)
//    while link_list.count != 0 {
//        let left_n = link_list.removeFirst()
//        let right_n = link_list.removeFirst()
//
//        if left_n.val != right_n.val {
//            return false
//        }
//
//        let l_l_n = left_n.left
//        let r_r_n = right_n.right
//        let l_r_n = left_n.right
//        let r_l_n = right_n.left
//
//        if (l_l_n != nil && r_r_n == nil) || (l_l_n == nil && r_r_n != nil) {
//            return false
//        } else if l_l_n == nil && r_r_n == nil {
//            continue
//        } else {
//            link_list.append(l_l_n!)
//            link_list.append(r_r_n!)
//        }
//
//        if (l_r_n != nil && r_l_n == nil) || (l_r_n == nil && r_l_n != nil) {
//            return false
//        } else if l_r_n == nil && r_l_n == nil {
//            continue
//        } else {
//            link_list.append(l_r_n!)
//            link_list.append(r_l_n!)
//        }
//    }
//    return true
//}

//100. 相同的树
//给你两棵二叉树的根节点 p 和 q ，编写一个函数来检验这两棵树是否相同。
//如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。
//示例 1：
//输入：p = [1,2,3], q = [1,2,3]
//输出：true
//示例 2：
//输入：p = [1,2], q = [1,null,2]
//输出：false
//示例 3：
//输入：p = [1,2,1], q = [1,1,2]
//输出：false
//提示：
//两棵树上的节点数目都在范围 [0, 100] 内
//-104 <= Node.val <= 104

//func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//    var stack_p = [TreeNode]()
//    var stack_q = [TreeNode]()
//    var new_p = p
//    var new_q = q
//    while new_p != nil || stack_p.count != 0 || stack_q.count != 0 || new_q != nil {
//        while new_p != nil {
//            stack_p.append(new_p!)
//            new_p = new_p?.left
//        }
//
//        while new_q != nil {
//            stack_q.append(new_q!)
//            new_q = new_q?.left
//        }
//
//        let p_root = stack_p.popLast()
//        let q_root = stack_q.popLast()
//
//        if stack_p.count != stack_q.count || p_root?.val != q_root?.val {
//            return false
//        }
//        new_p = p_root?.right
//        new_q = q_root?.right
//    }
//    return true
//}
//func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//    if p == nil && q == nil {
//        return true
//    }
//    if p == nil || q == nil {
//        return false
//    }
//    if p?.val != q?.val {
//        return false
//    }
//    return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
//}
//print(isSameTree(tree_node_2, new_tree_node_2))
//98. 验证二叉搜索树
//给定一个二叉树，判断其是否是一个有效的二叉搜索树。
//假设一个二叉搜索树具有如下特征：
//节点的左子树只包含小于当前节点的数。
//节点的右子树只包含大于当前节点的数。
//所有左子树和右子树自身必须也是二叉搜索树。
//示例 1:
//输入:
//    2
//   / \
//  1   3
//输出: true
//示例 2:
//输入:
//    5
//   / \
//  1   4
//     / \
//    3   6
//输出: false
//解释: 输入为: [5,1,4,null,null,3,6]。
//     根节点的值为 5 ，但是其右子节点值为 4 。
//迭代法
//func isValidBST(_ root: TreeNode?) -> Bool {
//    var stack = [TreeNode]()
//    var res = Int(Int.min)
//    var r = root
//    while r != nil || stack.count != 0 {
//        while r != nil {
//            stack.append(r!)
//            r = r?.left
//        }
//        let top = stack.popLast()
//        if top!.val <= res {
//            return false
//        }
//        res = top!.val
//        r = top?.right
//    }
//    return true
//}
//递归法
//func isValidBST(_ root: TreeNode?) -> Bool {
//    var res = true
//    var pre = Int(Int.min)
//    inOrder(root, &res, &pre)
//    return res
//}
//
//func inOrder(_ root: TreeNode?, _ res: inout Bool, _ pre: inout Int) {
//    if root == nil {
//        return
//    }
//
//    inOrder(root?.left, &res, &pre)
//    if root!.val <= pre {
//        res = false
//        return
//    }
//    pre = root!.val
//    inOrder(root?.right, &res, &pre)
//}
//
//
//print(isValidBST(tree_node_2))

//95. 不同的二叉搜索树 II
//给定一个整数 n，生成所有由 1 ... n 为节点所组成的 二叉搜索树 。
//示例：
//输入：3
//输出：
//[
//  [1,null,3,2],
//  [3,2,null,1],
//  [3,1,null,null,2],
//  [2,1,3],
//  [1,null,2,null,3]
//]
//解释：
//以上的输出对应以下 5 种不同结构的二叉搜索树：
//
//   1         3     3      2      1
//    \       /     /      / \      \
//     3     2     1      1   3      2
//    /     /       \                 \
//   2     1         2                 3
//
//提示：
//0 <= n <= 8

//func generateTrees(_ n: Int) -> [TreeNode?] {
//
//}
//94. 二叉树的中序遍历
//递归法
//func inorderTraversal(_ root: TreeNode?) -> [Int] {
//    var res = [Int]()
//    inorder(root, &res)
//    return res
//}
//
//func inorder(_ root: TreeNode?, _ res: inout [Int]) {
//    print(root?.val ?? 0)
//    if root == nil {
//        return
//    }
//    inorder(root?.left, &res)
//    inorder(root?.right, &res)
//    res.append(root!.val)
//}
//迭代法
//func inorderTraversal(_ root: TreeNode?) -> [Int] {
//    var r = root
//    var stack = [TreeNode]()
//    var res = [Int]()
//    while r != nil || stack.count != 0 {
//        while r != nil {
//            stack.append(r!)
//            r = r?.left
//        }
//        let p = stack.popLast()
//        res.append(p!.val)
//        r = p?.right
//    }
//    return res
//}
//
//print(inorderTraversal(tree_node_1))
//92. 反转链表 II
//给你单链表的头指针 head 和两个整数 left 和 right ，其中 left <= right 。请你反转从位置 left 到位置 right 的链表节点，返回 反转后的链表 。
//示例 1：
//输入：head = [1,2,3,4,5], left = 2, right = 4
//输出：[1,4,3,2,5]
//示例 2：
//输入：head = [5], left = 1, right = 1
//输出：[5]
//提示：
//链表中节点数目为 n
//1 <= n <= 500
//-500 <= Node.val <= 500
//1 <= left <= right <= n
//func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//    if left == right {
//        return head
//    }
//    let dummy = ListNode.init()
//    dummy.next = head
//
//    var left_head = dummy
//    var left_p = head
//
//    var right_head = head
//    var right_count = 0
//
//    while right_count < right - 1 {
//        right_count += 1
//        if right_count == left - 1 {
//            left_head = right_head!
//
//            left_p = right_head!.next
//        }
//
//        if right_count == right - 1 {
//            right_head = right_head!.next
//            let p = right_head?.next
//            right_head!.next = nil
//            right_head = p
//            break
//        } else {
//            right_head = right_head?.next
//        }
//    }
//    left_head.next = nil
//    while left_p != nil {
//        let p = left_p
//        left_p = left_p?.next
//        p?.next = right_head
//        right_head = p!
//    }
//    left_head.next = right_head
//    return dummy.next
//}
//
//printList(reverseBetween(node1, 2, 4))
//90. 子集 II
//给你一个整数数组 nums ，其中可能包含重复元素，请你返回该数组所有可能的子集（幂集）。
//解集 不能 包含重复的子集。返回的解集中，子集可以按 任意顺序 排列。
//示例 1：
//输入：nums = [1,2,2]
//输出：[[],[1],[1,2],[1,2,2],[2],[2,2]]
//示例 2：
//输入：nums = [0]
//输出：[[],[0]]
//提示：
//1 <= nums.length <= 10
//-10 <= nums[i] <= 10
//func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
//    let sorted_nums = nums.sorted()
//    var path = [Int]()
//    var result = [[Int]]()
//    dfs(0, sorted_nums, &path, &result)
//    return result
//}
//
//func dfs(_ index: Int, _ nums: [Int], _ path: inout [Int], _ result: inout [[Int]]) {
//    result.append(path)
//    for i in index..<nums.count {
//        if i > index && nums[i] == nums[i - 1] {
//            continue
//        }
//        path.append(nums[i])
//        dfs(i + 1, nums, &path, &result)
//        path.removeLast()
//    }
//}
//print(subsetsWithDup([1,2,2]))
//89. 格雷编码
//格雷编码是一个二进制数字系统，在该系统中，两个连续的数值仅有一个位数的差异。
//给定一个代表编码总位数的非负整数 n，打印其格雷编码序列。即使有多个不同答案，你也只需要返回其中一种。
//格雷编码序列必须以 0 开头。
//示例 1:
//输入: 2
//输出: [0,1,3,2]
//解释:
//00 - 0
//01 - 1
//11 - 3
//10 - 2
//对于给定的 n，其格雷编码序列并不唯一。
//例如，[0,2,3,1] 也是一个有效的格雷编码序列。
//00 - 0
//10 - 2
//11 - 3
//01 - 1
//示例 2:
//输入: 0
//输出: [0]
//解释: 我们定义格雷编码序列必须以 0 开头。
//     给定编码总位数为 n 的格雷编码序列，其长度为 2n。当 n = 0 时，长度为 20 = 1。
//     因此，当 n = 0 时，其格雷编码序列为 [0]。

//func grayCode(_ n: Int) -> [Int] {
//
//}
//88. 合并两个有序数组
//给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
//初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。你可以假设 nums1 的空间大小等于 m + n，这样它就有足够的空间保存来自 nums2 的元素。
//示例 1：
//输入：nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//输出：[1,2,2,3,5,6]
//示例 2：
//输入：nums1 = [1], m = 1, nums2 = [], n = 0
//输出：[1]
//提示：
//nums1.length == m + n
//nums2.length == n
//0 <= m, n <= 200
//1 <= m + n <= 200
//-109 <= nums1[i], nums2[i] <= 109
//1 2 3 1 5 6
//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//    if n == 0 {
//        return
//    }
//    for i in m..<(m + n) {
//        nums1[i] = nums2[i - m]
//    }
//    if m == 0 {
//        return
//    }
//    for i in m..<m + n {
//        for j in (1...i).reversed() {
//            if nums1[j] < nums1[j - 1] {
//                let tmp = nums1[j]
//                nums1[j] = nums1[j - 1]
//                nums1[j - 1] = tmp
//            } else {
//                break
//            }
//        }
//    }
//}
//func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
//    var p1 = m - 1
//    var p2 = n - 1
//    var tail = m + n - 1
//    var cur = 0
//    while p1 >= 0 || p2 >= 0 {
//        if p1 == -1 {
//            cur = nums2[p2]
//            p2 -= 1
//        } else if p2 == -1 {
//            cur = nums1[p1]
//            p1 -= 1
//        } else if nums1[p1] > nums2[p2] {
//            cur = nums1[p1]
//            p1 -= 1
//        } else {
//            cur = nums2[p2]
//            p2 -= 1
//        }
//        nums1[tail] = cur
//        tail -= 1
//    }
//}
//var nums1 = [2,0]
//var nums2 = [1]
//merge(&nums1, 1, nums2, 1)
//print(nums1)
//86. 分隔链表
//给你一个链表的头节点 head 和一个特定值 x ，请你对链表进行分隔，使得所有 小于 x 的节点都出现在 大于或等于 x 的节点之前。
//你应当 保留 两个分区中每个节点的初始相对位置。
//示例 1：
//输入：head = [1,4,3,2,5,2], x = 3
//输出：[1,2,2,4,3,5]
//示例 2：
//输入：head = [2,1], x = 2
//输出：[1,2]
//提示：
//链表中节点的数目在范围 [0, 200] 内
//-100 <= Node.val <= 100
//-200 <= x <= 200
//func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
//    let dummy = ListNode.init()
//    var small = dummy
//    let right = ListNode.init()
//    var large = right
//    var new_head = head
//    while new_head != nil {
//        if new_head!.val < x {
//            small.next = new_head
//            small = small.next!
//        } else {
//            large.next = new_head
//            large = large.next!
//        }
//        new_head = new_head?.next
//    }
//    large.next = nil
//    small.next = right.next
//    return dummy.next
//}
//printList(partition(node1, 3))
//84. 柱状图中最大的矩形
//给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
//求在该柱状图中，能够勾勒出来的矩形的最大面积。
//以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。
//图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。
//示例:
//输入: [2,1,5,6,2,3]
//输出: 10
//func largestRectangleArea(_ heights: [Int]) -> Int {
//    var stack = [Int]()
//    var res = 0
//    stack.append(0)
//    for i in 0..<heights.count {
//        while stack.count != 0 && heights[i] <  {
//            <#code#>
//        }
//        if let last = stack.last {
//            if last < heights[i] {
//                stack.append(heights[i])
//            } else {
//
//            }
//        }
//    }
//}
//83. 删除排序链表中的重复元素
//存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除所有重复的元素，使每个元素 只出现一次 。
//返回同样按升序排列的结果链表。
//示例 1：
//输入：head = [1,1,2]
//输出：[1,2]
//示例 2：
//输入：head = [1,1,2,3,3]
//输出：[1,2,3]
//提示：
//链表中节点数目在范围 [0, 300] 内
//-100 <= Node.val <= 100
//题目数据保证链表已经按升序排列

//func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//    let dummy = ListNode.init()
//    var new_head = dummy
//    var cur = head
//    var next = head?.next
//    while next != nil || cur != nil {
//        while next != nil && next!.val == cur!.val {
//            next = next?.next
//        }
//        new_head.next = cur
//        cur?.next = nil
//        new_head = new_head.next!
//        cur = next
//        next = next?.next
//    }
//    return dummy.next
//}
//printList(deleteDuplicates(node1))
//82. 删除排序链表中的重复元素 II
//存在一个按升序排列的链表，给你这个链表的头节点 head ，请你删除链表中所有存在数字重复情况的节点，只保留原始链表中 没有重复出现 的数字。
//返回同样按升序排列的结果链表。
//示例 1：
//输入：head = [1,2,3,3,4,4,5]
//输出：[1,2,5]
//示例 2：
//输入：head = [1,1,1,2,3]
//输出：[2,3]
//提示：
//链表中节点数目在范围 [0, 300] 内
//-100 <= Node.val <= 100
//题目数据保证链表已经按升序排列
//11335
//12335
//func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//    let dummy = ListNode.init()
//    var new_head = dummy
//    var cur = head
//    var next = head?.next
//    while cur != nil || next != nil {
//        if next != nil && cur!.val == next!.val{
//            while next != nil && cur!.val == next!.val {
//                next = next?.next
//            }
//        } else {
//            new_head.next = cur
//            cur?.next = nil
//            new_head = new_head.next!
//        }
//        cur = next
//        next = next?.next
//    }
//    return dummy.next
//}
//
//printList(deleteDuplicates(node1))
//81. 搜索旋转排序数组 II
//已知存在一个按非降序排列的整数数组 nums ，数组中的值不必互不相同。
//在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转 ，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,4,4,5,6,6,7] 在下标 5 处经旋转后可能变为 [4,5,6,6,7,0,1,2,4,4] 。
//给你 旋转后 的数组 nums 和一个整数 target ，请你编写一个函数来判断给定的目标值是否存在于数组中。如果 nums 中存在这个目标值 target ，则返回 true ，否则返回 false 。
//示例 1：
//输入：nums = [2,5,6,7,0,1,2], target = 0
//输出：true
//示例 2：
//输入：nums = [4,5,6,7,8,1,2,3,4], target = 3
//输出：false
//提示：
//1 <= nums.length <= 5000
//-104 <= nums[i] <= 104
//题目数据保证 nums 在预先未知的某个下标上进行了旋转
//-104 <= target <= 104
//进阶：
//这是 搜索旋转排序数组 的延伸题目，本题中的 nums  可能包含重复元素。
//这会影响到程序的时间复杂度吗？会有怎样的影响，为什么？
//func search(_ nums: [Int], _ target: Int) -> Bool {
//    var lo = 0
//    var hi = nums.count - 1
//    while lo <= hi {
//
//        while lo < hi - 1 && nums[lo] == nums[lo + 1] {
//            lo += 1
//        }
//
//        while lo < hi - 1 && nums[hi] == nums[hi - 1] {
//            hi -= 1
//        }
//
//        let mid = (lo + hi) / 2
//        if target == nums[mid] || target == nums[lo] {
//            return true
//        }
//
//        if nums[lo] < nums[mid] && target < nums[mid] && target > nums[lo] {//在左边, 并且左边有序
//            hi = mid - 1
//        } else if nums[hi] > nums[mid] && target > nums[mid] && target < nums[hi] {//在右边, 并且右边有序
//            lo = mid + 1
//        } else if nums[hi] > nums[mid] && (target > nums[hi] || target < nums[mid]) {//在左边,左边无序
//            hi = mid - 1
//        } else {
//            lo = mid + 1
//        }
//    }
//    return false
//}
//// 5 1 3 || 5
////
//print(search([15,16,19,20,1,2,3,4,5,7,10,14], 20))
//80. 删除有序数组中的重复项 II
//给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 最多出现两次 ，返回删除后数组的新长度。
//不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
//说明：
//为什么返回数值是整数，但输出的答案是数组呢？
//请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
//你可以想象内部操作如下:
//// nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
//int len = removeDuplicates(nums);
//// 在函数里修改输入数组对于调用者是可见的。
//// 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
//示例 1：
//输入：nums = [1,1,1,2,2,3]
//输出：5, nums = [1,1,2,2,3]
//解释：函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3 。 不需要考虑数组中超出新长度后面的元素。
//示例 2：
//输入：nums = [0,0,1,1,1,1,2,3,3]
//输出：7, nums = [0,0,1,1,2,3,3]
//解释：函数应返回新长度 length = 7, 并且原数组的前五个元素被修改为 0, 0, 1, 1, 2, 3, 3 。 不需要考虑数组中超出新长度后面的元素。
//提示：
//1 <= nums.length <= 3 * 104
//-104 <= nums[i] <= 104
//nums 已按升序排列
// 1 1 2 1 2 2
// 1 1 2 2 1 2
//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    var left = 0
//    var right = 1
//    var last_max = 1
//    while right <= nums.count - 1 {
//        if nums[right] == nums[right - 1] && last_max < 2 {
//            left += 1
//            last_max += 1
//        } else if nums[right] != nums[left] {
//            left += 1
//            let tmp = nums[left]
//            nums[left] = nums[right]
//            nums[right] = tmp
//            last_max = 1
//        } else if nums[right] != nums[right - 1] && last_max < 2 {
//            left += 1
//            let tmp = nums[left]
//            nums[left] = nums[right]
//            nums[right] = tmp
//            last_max += 1
//        }
//        right += 1
//    }
//    return left + 1
//}
//var nums = [1,1,1,2,2,3,3,3,3,3,4]
//let n = removeDuplicates(&nums)
//while true {
//    for i in 0..<n {
//        print(nums[i])
//    }
//    break
//}
//79. 单词搜索
//给定一个 m x n 二维字符网格 board 和一个字符串单词 word 。如果 word 存在于网格中，返回 true ；否则，返回 false 。
//单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
//示例 1：
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
//输出：true
//示例 2：
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
//输出：true
//示例 3：
//输入：board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
//输出：false
//func exist(_ board: [[Character]], _ word: String) -> Bool {
//    var path = [Character]()
//    var result = false
//    let list_word = Array(word)
//    dfs(0, board, &path, list_word, &result)
//    return result
//}
//
//func dfs(_ index: Int, _ board: [[Character]], _ path: inout [Character], _ word: [Character], _ result: inout Bool) {
//    if path.count == word.count {
//        if path == word {
//            result = true
//            return
//        }
//        return
//    }
//    if result == true {
//        return
//    }
//
//    for i in index..<word.count {
//
//    }
//}
//78. 子集
//给你一个整数数组 nums ，数组中的元素 互不相同 。返回该数组所有可能的子集（幂集）。
//解集 不能 包含重复的子集。你可以按 任意顺序 返回解集。
//示例 1：
//输入：nums = [1,2,3]
//输出：[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
//示例 2：
//输入：nums = [0]
//输出：[[],[0]]
//提示：
//1 <= nums.length <= 10
//-10 <= nums[i] <= 10
//nums 中的所有元素 互不相同
//func subsets(_ nums: [Int]) -> [[Int]] {
//    var path = [Int]()
//    var results = [[Int]]()
//    for i in 0...nums.count {
//        dfs(0, nums, &path, &results, i)
//    }
//    return results
//}
//
//func dfs(_ index: Int, _ list: [Int], _ path: inout [Int], _ results: inout [[Int]], _ k: Int) {
//    if k == path.count {
//        results.append(path)
//        return
//    }
//    for i in index..<list.count {
//        path.append(list[i])
//        dfs(i + 1, list, &path, &results, k)
//        path.removeLast()
//    }
//}
//print(subsets([1,2,3]))
//77. 组合
//给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。
//示例:
//输入: n = 4, k = 2
//输出:
//[
//  [2,4],
//  [3,4],
//  [2,3],
//  [1,2],
//  [1,3],
//  [1,4],
//]
//func combine(_ n: Int, _ k: Int) -> [[Int]] {
//    let list = [Int](1...n)
//    var path = [Int]()
//    var result = [[Int]]()
//    dfs(0, list, &path, k, result: &result)
//    return result
//}
//
//func dfs(_ index: Int, _ list: [Int], _ path: inout [Int], _ k: Int, result: inout [[Int]]) {
//    if path.count == k {
//        result.append(path)
//        return
//    }
//    if path.last == list.last {
//        return
//    }
//    print("index:\(index)")
//    for i in index..<list.count {
//        path.append(list[i])
//        print("====\(i):\(path)")
//        dfs(i + 1, list, &path, k, result: &result)
//        path.removeLast()
//        print(">>>>\(i):\(path)")
//    }
//}
//print(combine(6, 3))
//76. 最小覆盖子串
//给你一个字符串 s 、一个字符串 t 。返回 s 中涵盖 t 所有字符的最小子串。如果 s 中不存在涵盖 t 所有字符的子串，则返回空字符串 "" 。
//注意：如果 s 中存在这样的子串，我们保证它是唯一的答案。
//示例 1：
//输入：s = "ADOBECODEBANC", t = "ABC"
//输出："BANC"
//示例 2：
//输入：s = "a", t = "a"
//输出："a"
//提示：
//1 <= s.length, t.length <= 105
//s 和 t 由英文字母组成
//进阶：你能设计一个在 o(n) 时间内解决此问题的算法吗？
//func minWindow(_ s: String, _ t: String) -> String {
//    var left = 0
//    var right = t.count - 1
//    let s_list = Array(s)
//    var map = [Character:Int]()
//    for char in t {
//        if map[char] != nil {
//            map[char] = map[char]! + 1
//        } else {
//            map[char] = 1
//        }
//    }
//    while right <= s.count - 1 {
//        let char = s_list[left]
//        if map[char] != nil {
//
//        }
//    }
//}
//75. 颜色分类
//给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
//此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
//示例 1：
//输入：nums = [2,0,2,1,1,0]
//输出：[0,0,1,1,2,2]
//示例 2：
//输入：nums = [2,0,1]
//输出：[0,1,2]
//示例 3：
//输入：nums = [0]
//输出：[0]
//示例 4：
//输入：nums = [1]
//输出：[1]

//func sortColors(_ nums: inout [Int]) {
//    var zero = 0
//    var one = 0
//    var two = 0
//    for val in nums {
//        switch val {
//        case 0:
//            zero += 1
//        case 1:
//            one += 1
//        case 2:
//            two += 1
//        default:
//            break
//        }
//    }
//    if zero > 0 {
//        for i in 0..<zero {
//            nums[i] = 0
//        }
//    }
//    if one > 0 {
//        for i in 0..<one {
//            nums[zero + i] = 1
//        }
//    }
//    if two > 0 {
//        for i in 0..<two {
//            nums[zero + one + i] = 2
//        }
//    }
//    print(nums)
//}
//var nums = [2]
//sortColors(&nums)
//74. 搜索二维矩阵
//编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
//每行中的整数从左到右按升序排列。
//每行的第一个整数大于前一行的最后一个整数。
//示例 1：
//输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
//输出：true
//示例 2：
//输入：matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
//输出：false
//func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
//    var lo = 0
//    var hi = matrix.count - 1
//    while lo < hi {
//        let mid = (lo + hi) / 2
//        if target == matrix[mid][0] {
//            return true
//        }
//        if target < matrix[mid][0] {
//            hi = mid - 1
//        } else {
//            lo = mid + 1
//        }
//    }
//    var index = lo
//    if index > 0 && target < matrix[lo][0] {
//        index -= 1
//    }
//    lo = 0
//    hi = matrix[index].count - 1
//    while lo <= hi {
//        let mid = (lo + hi) / 2
//        if target == matrix[index][mid] {
//            return true
//        }
//        if target < matrix[index][mid] {
//            hi = mid - 1
//        } else {
//            lo = mid + 1
//        }
//    }
//    return false
//}
//print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,50]], 34))
//73. 矩阵置零
//给定一个 m x n 的矩阵，如果一个元素为 0 ，则将其所在行和列的所有元素都设为 0 。请使用 原地 算法。
//进阶：
//一个直观的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
//一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
//你能想出一个仅使用常量空间的解决方案吗？
//示例 1：
//输入：matrix = [[1,1,1],[1,0,1],[1,1,1]]
//输出：[[1,0,1],[0,0,0],[1,0,1]]
//示例 2：
//输入：matrix = [[0,1,2,0],[3,4,5,2],[1,3,1,5]]
//输出：[[0,0,0,0],[0,4,5,0],[0,3,1,0]]
//提示：
//m == matrix.length
//n == matrix[0].length
//1 <= m, n <= 200
//-231 <= matrix[i][j] <= 231 - 1
//func setZeroes(_ matrix: inout [[Int]]) {
//    var vel_set = Set<Int>.init()
//    var hor_set = Set<Int>.init()
//
//    let vel = matrix.count
//    let hor = matrix[0].count
//    for i in 0..<vel {
//        for j in 0..<hor {
//            if matrix[i][j] == 0 {
//                vel_set.insert(i)
//                hor_set.insert(j)
//            }
//        }
//    }
//    for vel in vel_set {
//        for i in 0..<hor {
//            matrix[vel][i] = 0
//        }
//    }
//    for hor in hor_set {
//        for i in 0..<vel {
//            matrix[i][hor] = 0
//        }
//    }
//    print(matrix)
//}
//var matrix = [[1,1,1],[1,0,1],[1,1,1]]
//setZeroes(&matrix)
//72. 编辑距离
//给你两个单词 word1 和 word2，请你计算出将 word1 转换成 word2 所使用的最少操作数 。
//你可以对一个单词进行如下三种操作：
//插入一个字符
//删除一个字符
//替换一个字符
//示例 1：
//输入：word1 = "horse", word2 = "ros"
//输出：3
//解释：
//horse -> rorse (将 'h' 替换为 'r')
//rorse -> rose (删除 'r')
//rose -> ros (删除 'e')
//示例 2：
//输入：word1 = "intention", word2 = "execution"
//输出：5
//解释：
//intention -> inention (删除 't')
//inention -> enention (将 'i' 替换为 'e')
//enention -> exention (将 'n' 替换为 'x')
//exention -> exection (将 'n' 替换为 'c')
//exection -> execution (插入 'u')
//func minDistance(_ word1: String, _ word2: String) -> Int {
//
//}
//71. 简化路径
//给你一个字符串 path ，表示指向某一文件或目录的 Unix 风格 绝对路径 （以 '/' 开头），请你将其转化为更加简洁的规范路径。
//在 Unix 风格的文件系统中，一个点（.）表示当前目录本身；此外，两个点 （..） 表示将目录切换到上一级（指向父目录）；两者都可以是复杂相对路径的组成部分。任意多个连续的斜杠（即，'//'）都被视为单个斜杠 '/' 。 对于此问题，任何其他格式的点（例如，'...'）均被视为文件/目录名称。
//请注意，返回的 规范路径 必须遵循下述格式：
//始终以斜杠 '/' 开头。
//两个目录名之间必须只有一个斜杠 '/' 。
//最后一个目录名（如果存在）不能 以 '/' 结尾。
//此外，路径仅包含从根目录到目标文件或目录的路径上的目录（即，不含 '.' 或 '..'）。
//返回简化后得到的 规范路径 。
//示例 1：
//输入：path = "/home/"
//输出："/home"
//解释：注意，最后一个目录名后面没有斜杠。
//示例 2：
//输入：path = "/../"
//输出："/"
//解释：从根目录向上一级是不可行的，因为根目录是你可以到达的最高级。
//示例 3：
//输入：path = "/home//foo/"
//输出："/home/foo"
//解释：在规范路径中，多个连续斜杠需要用一个斜杠替换。
//示例 4：
//输入：path = "/a/./b/../../c/"
//输出："/c"

//func simplifyPath(_ path: String) -> String {
//    var stack = [String]()
//    let list = path.split(separator: "/")
//    for str in list {
//        switch str {
//        case "..":
//            if stack.count > 0 {
//                stack.removeLast()
//            }
//            break
//        case ".",
//            "":
//            break
//        default:
//            stack.append(String(str))
//        }
//    }
//    return "/\(stack.joined(separator: "/"))"
//}
//print(simplifyPath("/a/./b/../../c/"))
//70. 爬楼梯
//假设你正在爬楼梯。需要 n 阶你才能到达楼顶。
//每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？
//注意：给定 n 是一个正整数。
//示例 1：
//输入： 2
//输出： 2
//解释： 有两种方法可以爬到楼顶。
//1.  1 阶 + 1 阶
//2.  2 阶
//示例 2：
//输入： 3
//输出： 3
//解释： 有三种方法可以爬到楼顶。
//1.  1 阶 + 1 阶 + 1 阶
//2.  1 阶 + 2 阶
//3.  2 阶 + 1 阶
//func climbStairs(_ n: Int) -> Int {
//    if n == 1 { return 1 }
//    if n == 2 { return 2 }
//    var d = 1, p = 1, r = 2
//    for _ in 2...n {
//        r = d + p
//        d = p
//        p = r
//    }
//    return r
//}
//
//print(climbStairs(10))
//69. x 的平方根
//实现 int sqrt(int x) 函数。
//计算并返回 x 的平方根，其中 x 是非负整数。
//由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。
//示例 1:
//输入: 4
//输出: 2
//示例 2:
//输入: 8
//输出: 2
//说明: 8 的平方根是 2.82842...,
//     由于返回类型是整数，小数部分将被舍去。
//func mySqrt(_ x: Int) -> Int {
//    if x <= 1 {
//        return x
//    }
//    var lo = 1
//    var hi = x / 2
//
//    while lo <= hi {
//        let mid = (lo + hi) / 2
//        if mid * mid <= x && (mid + 1) * (mid + 1) > x {
//            return mid
//        }
//        if mid * mid > x {
//            hi = mid - 1
//        } else {
//            lo = mid + 1
//        }
//    }
//    return 0
//}
//print(mySqrt(1024))
//67. 二进制求和
//给你两个二进制字符串，返回它们的和（用二进制表示）。
//输入为 非空 字符串且只包含数字 1 和 0。
//示例 1:
//输入: a = "11", b = "1"
//输出: "100"
//示例 2:
//输入: a = "1010", b = "1011"
//输出: "10101"
//提示：
//每个字符串仅由字符 '0' 或 '1' 组成。
//1 <= a.length, b.length <= 10^4
//字符串如果不是 "0" ，就都不含前导零。

//func addBinary(_ a: String, _ b: String) -> String {
//    let a_list = Array(a)
//    let b_list = Array(b)
//    let max_count = a.count > b.count ? a.count : b.count
//    var plus = 0
//    var result = ""
//    for i in (0..<max_count).reversed() {
//        let a_i = a.count - (max_count - i)
//        let b_i = b.count - (max_count - i)
//        let a_char = a_i >= 0 ? a_list[a_i] : "0"
//        let b_char = b_i >= 0 ? b_list[b_i] : "0"
//        let sum = plus + Int(a_char.asciiValue! - ("0" as Character).asciiValue!) + Int(b_char.asciiValue! - ("0" as Character).asciiValue!)
//        result = "\(sum % 2)\(result)"
//        plus = sum / 2
//    }
//    if plus == 1 {
//        return "1\(result)"
//    }
//    return result
//}
//
//print(addBinary("11", "1"))
//66. 加一
//给定一个由 整数 组成的 非空 数组所表示的非负整数，在该数的基础上加一。
//最高位数字存放在数组的首位， 数组中每个元素只存储单个数字。
//你可以假设除了整数 0 之外，这个整数不会以零开头。
//示例 1：
//输入：digits = [1,2,3]
//输出：[1,2,4]
//解释：输入数组表示数字 123。
//示例 2：
//输入：digits = [4,3,2,1]
//输出：[4,3,2,2]
//解释：输入数组表示数字 4321。
//示例 3：
//输入：digits = [0]
//输出：[1]
//提示：
//1 <= digits.length <= 100
//0 <= digits[i] <= 9
//func plusOne(_ digits: [Int]) -> [Int] {
//    var result = digits
//    for i in (0..<digits.count).reversed() {
//        let cur = result[i] + 1
//        if cur > 9 {
//            result[i] = cur - 10
//        } else {
//            result[i] = cur
//            return result
//        }
//    }
//    if result[0] == 0 {
//        result.insert(1, at: 0)
//    }
//    return result
//}
//print(plusOne([9,9,9,9,9]))
//64. 最小路径和
//给定一个包含非负整数的 m x n 网格 grid ，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
//说明：每次只能向下或者向右移动一步。
//示例 1：
//输入：grid = [[1,3,1],[1,5,1],[4,2,1]]
//输出：7
//解释：因为路径 1→3→1→1→1 的总和最小。
//示例 2：
//输入：grid = [[1,2,3],[4,5,6]]
//输出：12
//提示：
//m == grid.length
//n == grid[i].length
//1 <= m, n <= 200
//0 <= grid[i][j] <= 100
//func minPathSum(_ grid: [[Int]]) -> Int {
//    let row = grid[0].count
//    let section = grid.count
//    var path = [[Int]](repeating: [Int](repeating: 100, count: row), count: section)
//    path[0][0] = grid[0][0]
//    for i in 1..<section {
//        path[i][0] = path[i - 1][0] + grid[i][0]
//    }
//    for j in 1..<row {
//        path[0][j] = path[0][j - 1] + grid[0][j]
//    }
//
//    for i in 1..<section {
//        for j in 1..<row {
//            path[i][j] = min(path[i - 1][j] + grid[i][j], path[i][j - 1] + grid[i][j])
//        }
//    }
//    return path[section - 1][row - 1]
//}
//print(minPathSum([[1]]))
//63. 不同路径 II
//一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为“Start” ）。
//机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为“Finish”）。
//现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？
//网格中的障碍物和空位置分别用 1 和 0 来表示。
//示例 1：
//输入：obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]
//输出：2
//解释：
//3x3 网格的正中间有一个障碍物。
//从左上角到右下角一共有 2 条不同的路径：
//1. 向右 -> 向右 -> 向下 -> 向下
//2. 向下 -> 向下 -> 向右 -> 向右
//示例 2：
//输入：obstacleGrid = [[0,1],[0,0]]
//输出：1
//提示：
//m == obstacleGrid.length
//n == obstacleGrid[i].length
//1 <= m, n <= 100
//obstacleGrid[i][j] 为 0 或 1
//3行 2列
//func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
//    let m = obstacleGrid.count//2 行
//    let n = obstacleGrid[0].count//3 列
//    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
//    var stuck = m
//    for i in 0..<m {
//        if obstacleGrid[i][0] == 1 {
//            stuck = i
//        }
//        if i < stuck {
//            result[i][0] = 1
//        } else {
//            result[i][0] = 0
//        }
//    }
//
//    stuck = n
//    for i in 0..<n {
//        if obstacleGrid[0][i] == 1 {
//            stuck = i
//        }
//        if i < stuck {
//            result[0][i] = 1
//        } else {
//            result[0][i] = 0
//        }
//    }
//
//    for i in 1..<m {
//        for j in 1..<n {
//            if obstacleGrid[i][j] == 1 {
//                result[i][j] = 0
//            } else {
//                result[i][j] = result[i - 1][j] + result[i][j - 1]
//            }
//        }
//    }
//    return result[m - 1][n - 1]
//}
//
//print(uniquePathsWithObstacles([[0]]))
//60. 排列序列
//给出集合 [1,2,3,...,n]，其所有元素共有 n! 种排列。
//按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
//"123"
//"132"
//"213"
//"231"
//"312"
//"321"
//给定 n 和 k，返回第 k 个排列。
//示例 1：
//输入：n = 3, k = 3
//输出："213"
//示例 2：
//输入：n = 4, k = 9
//输出："2314"
//示例 3：
//输入：n = 3, k = 1
//输出："123"

#warning("time out")
//func getPermutation(_ n: Int, _ k: Int) -> String {
//    var list = [Int](1...n)
//    var result = ""
//    var path = ""
//    var used = [Bool](repeating: false, count: n)
//    var loop = 0
//    dfs(0, &loop, &list, &path, &used, &result, k)
//    return result
//}
//
//func dfs(_ index: Int, _ loop: inout Int, _ list: inout [Int], _ path: inout String, _ used: inout [Bool], _ result: inout String, _ k: Int) {
//    if path.count == list.count {
//        loop += 1
//        result = path
//        return
//    }
//    if loop == k {
//        return
//    }
//
//    for i in 0..<list.count {
//        if !used[i] {
//            path += "\(list[i])"
//            used[i] = true
//            dfs(index + 1, &loop, &list, &path, &used, &result, k)
//            path.removeLast()
//            used[i] = false
//        }
//    }
//}
//print(getPermutation(9, 36200))
//59. 螺旋矩阵 II
//给你一个正整数 n ，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的 n x n 正方形矩阵 matrix 。
//示例 1：
//输入：n = 3
//输出：[[1,2,3],[8,9,4],[7,6,5]]
//示例 2：
//输入：n = 1
//输出：[[1]]
//func generateMatrix(_ n: Int) -> [[Int]] {
//    let sum = n * n
//    var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
//    var l = 0, r = n - 1, t = 0, b = n - 1
//    var cur = 0
//    while true {
//        for i in l...r {//left to right
//            cur += 1
//            matrix[l][i] = cur
//        }
//        t += 1
//        if cur == sum { return matrix }
//
//        for i in t...b {//top to bottom
//            cur += 1
//            matrix[i][r] = cur
//        }
//        r -= 1
//        if cur == sum { return matrix }
//
//        for i in (l...r).reversed() {//right to left
//            cur += 1
//            matrix[b][i] = cur
//        }
//        b -= 1
//        if cur == sum { return matrix }
//
//        for i in (t...b).reversed() {//bottom to top
//            cur += 1
//            matrix[i][l] = cur
//        }
//        l += 1
//        if cur == sum { return matrix }
//    }
//    return matrix
//}

//print(generateMatrix(3))
//58. 最后一个单词的长度
//给你一个字符串 s，由若干单词组成，单词之间用空格隔开。返回字符串中最后一个单词的长度。如果不存在最后一个单词，请返回 0 。
//单词 是指仅由字母组成、不包含任何空格字符的最大子字符串。
//示例 1：
//输入：s = "Hello World"
//输出：5
//示例 2：
//输入：s = " "
//输出：0
//提示：
//1 <= s.length <= 104
//s 仅有英文字母和空格 ' ' 组成
//func lengthOfLastWord(_ s: String) -> Int {
//    var sum = 0
//    for char in s.reversed() {
//        if sum == 0 && char == " " {
//            continue
//        }
//
//        if char == " " {
//            return sum
//        } else {
//            sum += 1
//        }
//    }
//    return sum
//}
//
//print(lengthOfLastWord("Hello World"))
//62. 不同路径
//一个机器人位于一个 m x n 网格的左上角 （起始点在下图中标记为 “Start” ）。
//机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角（在下图中标记为 “Finish” ）。
//问总共有多少条不同的路径？
//示例 1：
//输入：m = 3, n = 7
//输出：28
//示例 2：
//输入：m = 3, n = 2
//输出：3
//解释：
//从左上角开始，总共有 3 条路径可以到达右下角。
//1. 向右 -> 向下 -> 向下
//2. 向下 -> 向下 -> 向右
//3. 向下 -> 向右 -> 向下
//示例 3：
//输入：m = 7, n = 3
//输出：28
//func uniquePaths(_ m: Int, _ n: Int) -> Int {
//    var results = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
//    for i in 0..<n {
//        results[0][i] = 1
//    }
//    for j in 0..<m {
//        results[j][0] = 1
//    }
//    for i in 1..<m {
//        for j in 1..<n {
//            results[i][j] = results[i - 1][j] + results[i][j - 1]
//        }
//    }
//    return results[m - 1][n - 1]
//}
//print(uniquePaths(23, 12))
//57. 插入区间
//给你一个 无重叠的 ，按照区间起始端点排序的区间列表。
//在列表中插入一个新的区间，你需要确保列表中的区间仍然有序且不重叠（如果有必要的话，可以合并区间）。
//示例 1：
//输入：intervals = [[1,3],[6,9]], newInterval = [2,5]
//输出：[[1,5],[6,9]]
//示例 2：
//输入：intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
//输出：[[1,2],[3,10],[12,16]]
//解释：这是因为新的区间 [4,8] 与 [3,5],[6,7],[8,10] 重叠。
//示例 3：
//输入：intervals = [], newInterval = [5,7]
//输出：[[5,7]]
//示例 4：
//输入：intervals = [[1,5]], newInterval = [2,3]
//输出：[[1,5]]
//示例 5：
//输入：intervals = [[1,5]], newInterval = [2,7]
//输出：[[1,7]]

//func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
//    if intervals.count == 0 {
//        return [newInterval]
//    }
//    var list = [[Int]]()
//    if newInterval[1] < intervals[0][0] {
//        list = intervals
//        list.insert(newInterval, at: 0)
//        return list
//    }
//
//    if newInterval[0] > intervals[intervals.count - 1][1] {
//        list = intervals
//        list.append(newInterval)
//        return list
//    }
//
//    var left = 0
//    var right = 0
//    var cur = 0
//    var found = false
//    while cur < intervals.count {
//        let cur_interval = intervals[cur]
//        if found {
//            list.append(cur_interval)
//            cur += 1
//            continue
//        }
//        if newInterval[0] > cur_interval[1] {
//            list.append(cur_interval)
//            cur += 1
//            continue
//        } else {
//            left = cur
//            var tmp = [Int]()
//            while left < intervals.count {
//                if newInterval[0] < intervals[left][0] {
//                    tmp.append(newInterval[0])
//                    break
//                } else if newInterval[0] >= intervals[left][0] && newInterval[0] <= intervals[left][1] {
//                    tmp.append(intervals[left][0])
//                    break
//                } else {
//                    left += 1
//                }
//            }
//            right = left
//            while right <= intervals.count {
//                if right < intervals.count {
//                    if newInterval[1] < intervals[right][0] {
//                        tmp.append(newInterval[1])
//                        if newInterval[0] > intervals[left][1] {
//                            cur -= 1
//                        }
//                        cur += (right - left)
//                        break
//                    } else if newInterval[1] >= intervals[right][0] && newInterval[1] <= intervals[right][1] {
//                        tmp.append(intervals[right][1])
//                        cur += (right - left) + 1
//                        break
//                    } else {
//                        right += 1
//                    }
//                } else {
//                    tmp.append(newInterval[1])
//                    cur += (right - left)
//                    break
//                }
//            }
//            list.append(tmp)
//            found = true
//        }
//
//    }
//    return list
//}
//print(insert([[12,16]],[4,13]))
//56. 合并区间
//以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间。
//示例 1：
//输入：intervals = [[1,3],[2,6],[8,10],[15,18]]
//输出：[[1,6],[8,10],[15,18]]
//解释：区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
//示例 2：
//输入：intervals = [[1,4],[4,5]]
//输出：[[1,5]]
//解释：区间 [1,4] 和 [4,5] 可被视为重叠区间。

//func merge(_ intervals: [[Int]]) -> [[Int]] {
//    if intervals.count <= 1 {
//        return intervals
//    }
//    var list = intervals
//    list.sort { (list1, list2) -> Bool in
//        return list1[0] < list2[0]
//    }
//    var results = [[Int]]()
//    var pointer = 0
//    var left = 0
//    var max_right = 0
//    while pointer < intervals.count {
//        let cur = list[pointer]
//        if pointer + 1 < intervals.count {
//            let next = list[pointer + 1]
//            max_right = max(cur[1], max_right)
//            if max_right < next.first! {
//                let tmp = [list[left].first!, max_right]
//                results.append(tmp)
//                pointer += 1
//                left = pointer
//                max_right = 0
//                continue
//            }
//        } else {
//            max_right = max(cur[1], max_right)
//            if max_right >= cur.first! {
//                let tmp = [list[left].first!, max_right]
//                results.append(tmp)
//            } else {
//                results.append(cur)
//            }
//        }
//        pointer += 1
//    }
//    return results
//}
//print(merge([[1,20],[2,6],[8,22],[15,18]]))
//55. 跳跃游戏
//给定一个非负整数数组 nums ，你最初位于数组的 第一个下标 。
//数组中的每个元素代表你在该位置可以跳跃的最大长度。
//判断你是否能够到达最后一个下标。
//示例 1：
//输入：nums = [2,3,1,1,4]
//输出：true
//解释：可以先跳 1 步，从下标 0 到达下标 1, 然后再从下标 1 跳 3 步到达最后一个下标。
//示例 2：
//输入：nums = [3,2,1,0,4]
//输出：false
//解释：无论怎样，总会到达下标为 3 的位置。但该下标的最大跳跃长度是 0 ， 所以永远不可能到达最后一个下标。
//提示：
//1 <= nums.length <= 3 * 104
//0 <= nums[i] <= 105

//func canJump(_ nums: [Int]) -> Bool {
//    if nums.count == 0 {
//        return false
//    }
//    if nums.count == 1 {
//        return true
//    }
//    if nums[0] == 0 {
//        return false
//    }
//    var max_reach = nums[0]
//    for i in 0..<nums.count - 1 {
//        if max_reach >= i {
//            max_reach = max(i + nums[i], max_reach)
//        }
//        if max_reach >= nums.count - 1 {
//            return true
//        }
//    }
//    return false
//}
//
//print(canJump([1,2,3]))
//54. 螺旋矩阵
//给你一个 m 行 n 列的矩阵 matrix ，请按照 顺时针螺旋顺序 ，返回矩阵中的所有元素。
//示例 1：
//输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[1,2,3,6,9,8,7,4,5]
//示例 2：
//输入：matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
//输出：[1,2,3,4,8,12,11,10,9,5,6,7]
//func spiralOrder(_ matrix: [[Int]]) -> [Int] {
//    let m = matrix.count
//    let n = matrix[0].count
//    var results = [Int]()
//    let sum = m * n
//    var l = 0, r = n - 1, t = 0, b = m - 1
//    while true {
//        for i in l...r {//left to right
//            results.append(matrix[l][i])
//        }
//        t += 1
//        if results.count == sum {
//            return results
//        }
//        for i in t...b {//top to bottom
//            results.append(matrix[i][r])
//        }
//        r -= 1
//        if results.count == sum {
//            return results
//        }
//        for i in (l...r).reversed() {//right to left
//            results.append(matrix[b][i])
//        }
//        b -= 1
//        if results.count == sum {
//            return results
//        }
//        for i in (t...b).reversed() {//bottom to top
//            results.append(matrix[i][l])
//        }
//        l += 1
//        if results.count == sum {
//            return results
//        }
//    }
//}
//
//print(spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]]))

//53. 最大子序和
//给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
//示例 1：
//输入：nums = [-2,1,-3,4,-1,2,2,-5,4]
//输出：6
//解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
//示例 2：
//输入：nums = [1]
//输出：1
//示例 3：
//输入：nums = [0]
//输出：0
//示例 4：
//输入：nums = [-1]
//输出：-1
//示例 5：
//输入：nums = [-100000]
//输出：-100000
//func maxSubArray(_ nums: [Int]) -> Int {
//    var max_sum = 0
//    var result = nums[0]
//    for num in nums {
//        max_sum = max(num, max_sum + num)
//        result = max(max_sum, result)
//    }
//    return result
//}
//print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
//51. N 皇后
//n 皇后问题 研究的是如何将 n 个皇后放置在 n×n 的棋盘上，并且使皇后彼此之间不能相互攻击。
//给你一个整数 n ，返回所有不同的 n 皇后问题 的解决方案。
//每一种解法包含一个不同的 n 皇后问题 的棋子放置方案，该方案中 'Q' 和 '.' 分别代表了皇后和空位。
//示例 1：
//输入：n = 4
//输出：[[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]]
//解释：如上图所示，4 皇后问题存在两个不同的解法。
//示例 2：
//输入：n = 1
//输出：[["Q"]]
//提示：
//1 <= n <= 9
//皇后彼此不能相互攻击，也就是说：任何两个皇后都不能处于同一条横行、纵行或斜线上。

//func solveNQueens(_ n: Int) -> [[String]] {
//
//}
//50. Pow(x, n)
//实现 pow(x, n) ，即计算 x 的 n 次幂函数（即，xn）。
//示例 1：
//输入：x = 2.00000, n = 10
//输出：1024.00000
//示例 2：
//输入：x = 2.10000, n = 3
//输出：9.26100
//示例 3：
//输入：x = 2.00000, n = -2
//输出：0.25000
//解释：2-2 = 1/22 = 1/4 = 0.25
//提示：
//-100.0 < x < 100.0
//-231 <= n <= 231-1
//-104 <= xn <= 104

//func myPow(_ x: Double, _ n: Int) -> Double {
//    if n >= 0 {
//        return myPow_abs(x, n)
//    } else {
//        return 1 / myPow_abs(x, -n)
//    }
//}
//
//func myPow_abs(_ x: Double, _ n: Int) -> Double {
//    if n == 0 {
//        return 1
//    }
//    if n == 1 {
//        return x
//    }
//    if n % 2 == 0 {
//        let tmp = myPow(x, n / 2);
//        return tmp * tmp
//    } else {
//        let tmp = myPow(x, (n - 1) / 2);
//        return tmp * tmp * x
//    }
//}
//
//print(myPow(2, -2))
//49. 字母异位词分组
//给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
//示例:
//输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
//输出:
//[
//  ["ate","eat","tea"],
//  ["nat","tan"],
//  ["bat"]
//]
//说明：
//所有输入均为小写字母。
//不考虑答案输出的顺序。

//func groupAnagrams(_ strs: [String]) -> [[String]] {
//    var map = [String: [String]]()
//    var results = [[String]]()
//    for str in strs {
//        let sorted_str = String(str.sorted())
//        var path = map[sorted_str]
//        if path != nil {
//            path!.append(str)
//        } else {
//            path = [str]
//        }
//        map[sorted_str] = path
//    }
//    for (_, value) in map {
//        results.append(value)
//    }
//    return results
//}
//print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
//48. 旋转图像
//给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
//你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
//示例 1：
//输入：matrix = [[1,2,3],[4,5,6],[7,8,9]]
//输出：[[7,4,1],[8,5,2],[9,6,3]]
//示例 2：
//输入：matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
//输出：[[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
//示例 3：
//输入：matrix = [[1]]
//输出：[[1]]
//示例 4：
//输入：matrix = [[1,2],[3,4]]
//输出：[[3,1],[4,2]]
//func rotate(_ matrix: inout [[Int]]) {
//    let count = matrix.count
//    for i in 0..<count {
//        for j in 0..<count {
//            if j > i {
//                let tmp = matrix[i][j]
//                matrix[i][j] = matrix[j][i]
//                matrix[j][i] = tmp
//            }
//        }
//    }
//
//    for i in 0..<count {
//        for j in 0..<count {
//            if j < count / 2 {
//                let tmp = matrix[i][j]
//                matrix[i][j] = matrix[i][count - 1 - j]
//                matrix[i][count - 1 - j] = tmp
//            }
//        }
//    }
//}
//
//var matrix = [[1,2],[3,4]]
//rotate(&matrix)

//47. 全排列 II
//给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。
//示例 1：
//输入：nums = [1,1,2]
//输出：
//[[1,1,2],
// [1,2,1],
// [2,1,1]]
//示例 2：
//输入：nums = [1,2,3]
//输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//提示：
//1 <= nums.length <= 8
//-10 <= nums[i] <= 10

//func permuteUnique(_ nums: [Int]) -> [[Int]] {
//    if nums.count == 0 {
//        return []
//    }
//    var results = [[Int]]()
//    var path = [Int]()
//    var used = [Bool](repeating: false, count: nums.count)
//    dfs(0, nums.sorted(), &results, &path, &used)
//    return results
//}
//
//func dfs(_ index: Int, _ nums: [Int], _ results: inout [[Int]], _ path: inout [Int], _ used: inout [Bool]) {
//    if index == nums.count {
//        results.append(path)
//    } else {
//        for i in 0..<nums.count {
//            if i > 0 && nums[i] == nums[i - 1] && used[i - 1] {
//                continue
//            }
//            if used[i] == false {
//                path.append(nums[i])
//                used[i] = true
//                dfs(index + 1, nums, &results, &path, &used)
//                path.removeLast()
//                used[i] = false
//            }
//        }
//    }
//}
//print(permuteUnique([1,1,2]))

//46. 全排列
//给定一个 没有重复 数字的序列，返回其所有可能的全排列。
//示例:
//输入: [1,2,3]
//输出:
//[
//  [1,2,3],
//  [1,3,2],
//  [2,1,3],
//  [2,3,1],
//  [3,1,2],
//  [3,2,1]
//]

//1 2 3 4
//1 2 4 3
//1 3 2 4
//1 3 4 2
//1 4 2 3
//1 4 3 2
//2 1 3 4
//2 1 4 3
//2,3,1,4
//2,3,4,1
//2,4,1,3
//2,4,3,1
//3,1,2,4
//3 1 4 2
//3 2 1 4
//3 2 4 1
//3 4 1 2
//3 4 2 1

//func permute(_ nums: [Int]) -> [[Int]] {
//    if nums.count == 0 {
//        return []
//    }
//    var results = [[Int]]()
//    var path = [Int]()
//    var used = [Bool](repeating: false, count: nums.count)
//    dfs(0, nums, &results, &path, &used)
//    return results
//}
//
//func dfs(_ index: Int, _ nums: [Int], _ results: inout [[Int]], _ path: inout [Int], _ used: inout [Bool]) {
//    if index == nums.count {
//        results.append(path)
//    } else {
//        for i in 0..<nums.count {
//            if used[i] == false {
//                path.append(nums[i])
//                used[i] = true
//                dfs(index + 1, nums, &results, &path, &used)
//                path.removeLast()
//                used[i] = false
//            }
//        }
//    }
//}
//
//print(permute([2,1,3]))
//45. 跳跃游戏 II
//给定一个非负整数数组，你最初位于数组的第一个位置。
//数组中的每个元素代表你在该位置可以跳跃的最大长度。
//你的目标是使用最少的跳跃次数到达数组的最后一个位置。
//示例:
//输入: [2,3,1,1,4]
//输出: 2
//解释: 跳到最后一个位置的最小跳跃数是 2。
//     从下标为 0 跳到下标为 1 的位置，跳 1 步，然后跳 3 步到达数组的最后一个位置。
//说明:
//假设你总是可以到达数组的最后一个位置。
//func jump(_ nums: [Int]) -> Int {
//    var max_position = 0
//    var end = 0
//    var ans = 0
//    for i in 0..<nums.count - 1 {
//        max_position = max(max_position, i + nums[i])
//        print("\(i) \(end) \(ans)")
//        if i == end {
//            end = max_position
//            ans += 1
//        }
//    }
//    return ans
//}
//
//print(jump([2,3,1,1,4]))
//给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。
//示例 1：
//输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
//输出：6
//解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
//示例 2：
//输入：height = [4,2,0,3,2,5]
//输出：9
//func trap(_ height: [Int]) -> Int {
//    var left = 0
//    var right = height.count - 1
//    var left_max = 0
//    var right_max = 0
//    var ans = 0
//    while left < right {
//        if height[left] < height[right] {
//            if height[left] > left_max {
//                left_max = height[left]
//            } else {
//                ans += left_max - height[left]
//            }
//            left += 1
//        } else {
//            if height[right] > right_max {
//                right_max = height[right]
//            } else {
//                ans += right_max - height[right]
//            }
//            right -= 1
//        }
//    }
//    return ans
//}
//
//print(trap([0,1,0,2,1,0,1,3,2,1,2,1]))
//40. 组合总和 II
//给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
//candidates 中的每个数字在每个组合中只能使用一次。
//说明：
//所有数字（包括目标数）都是正整数。
//解集不能包含重复的组合。
//示例 1:
//输入: candidates = [10,1,2,7,6,1,5], target = 8,
//所求解集为: [1,1,2,5,6,7,10]
//[
//  [1, 7],
//  [1, 2, 5],
//  [2, 6],
//  [1, 1, 6]
//]
//示例 2:
//输入: candidates = [2,5,2,1,2], target = 5,
//所求解集为:
//[
//  [1,2,2],
//  [5]
//]
//func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
//    if candidates.count == 0 {
//        return []
//    }
//    var list = candidates
//    list.sort()
//    var results = [[Int]]()
//    var path = [Int]()
//    dfs(list, 0, target, &path, &results)
//    return results
//}
//
//func dfs(_ candidates: [Int], _ index: Int, _ target: Int, _ path: inout [Int], _ results: inout [[Int]]) {
//    if target == 0 {
//        if !results.contains(path) {
//            results.append(path)
//        }
//        return
//    }
//
//
//    for i in index..<candidates.count {
//        if target < candidates[index] {
//            break
//        }
//        if i > index && candidates[i] == candidates[i - 1] {
//            continue
//        }
//        path.append(candidates[i])
//        dfs(candidates, i + 1, target - candidates[i], &path, &results)
//        path.removeLast()
//    }
//}
////[1,2,2,2,5]
//print(combinationSum2([1,2,2,2,5], 6))
//39. 组合总和
//给定一个无重复元素的数组 candidates  和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
//candidates 中的数字可以无限制重复被选取。
//说明：
//所有数字（包括 target）都是正整数。
//解集不能包含重复的组合。
//示例 1：
//输入：candidates = [2,3,6,7], target = 7,
//所求解集为：
//[
//  [7],
//  [2,2,3]
//]
//示例 2：
//输入：candidates = [2,3,5], target = 8,
//所求解集为：
//[
//  [2,2,2,2],
//  [2,3,3],
//  [3,5]
//]
//func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//    if candidates.count == 0 {
//        return []
//    }
//    var list = candidates
//    list.sort()
//    var results = [[Int]]()
//    var path = [Int]()
//    dfs(list, target, 0, &results, &path)
//    return results
//}
//
//
//func dfs(_ candidates: [Int], _ target: Int, _ index: Int, _ results: inout [[Int]], _ path: inout [Int]) {
//
//    if target == 0 {
//        results.append(path)
//        return
//    }
//
//    if target < candidates[index] {
//        return
//    }
//
//    for i in index..<candidates.count {
//
//        path.append(candidates[i])
//        dfs(candidates, target - candidates[i], i, &results, &path)
//        path.removeLast()
//    }
//
//}
//
//print(combinationSum([2,3,6,7], 7))

//给定一个正整数 n ，输出外观数列的第 n 项。
//「外观数列」是一个整数序列，从数字 1 开始，序列中的每一项都是对前一项的描述。
//你可以将其视作是由递归公式定义的数字字符串序列：
//countAndSay(1) = "1"
//countAndSay(n) 是对 countAndSay(n-1) 的描述，然后转换成另一个数字字符串。
//前五项如下：
//1.     1
//2.     11
//3.     21
//4.     1211
//5.     111221
//6.     312211
//7.     13112221
//8.     1113213211
//第一项是数字 1
//描述前一项，这个数是 1 即 “ 一 个 1 ”，记作 "11"
//描述前一项，这个数是 11 即 “ 二 个 1 ” ，记作 "21"
//描述前一项，这个数是 21 即 “ 一 个 2 + 一 个 1 ” ，记作 "1211"
//描述前一项，这个数是 1211 即 “ 一 个 1 + 一 个 2 + 二 个 1 ” ，记作 "111221"
//要 描述 一个数字字符串，首先要将字符串分割为 最小 数量的组，每个组都由连续的最多 相同字符 组成。然后对于每个组，先描述字符的数量，然后描述字符，形成一个描述组。要将描述转换为数字字符串，先将每组中的字符数量用数字替换，再将所有描述组连接起来。
//func countAndSay(_ n: Int) -> String {
//    if n == 1 {
//        return "1"
//    }
//    let str = countAndSay(n - 1)
//    var sum_s = ""
//
//    var cur = 0
//    let list = Array(str)
//    //111221
//    while cur < list.count {
//        let c = list[cur]
//        var count = 1
//        while cur < list.count - 1 && c == list[cur + 1] {
//            cur += 1
//            count += 1
//        }
//        sum_s += "\(count)\(c)"
//        cur += 1
//    }
//    return sum_s
//}
//
//
//print(countAndSay(30))
//判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
//数字 1-9 在每一行只能出现一次。
//数字 1-9 在每一列只能出现一次。
//数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
//数独部分空格内已填入了数字，空白格用 '.' 表示。
//示例 1:
//输入:
//[
//  ["5","3",".",".","7",".",".",".","."],
//  ["6",".",".","1","9","5",".",".","."],
//  [".","9","8",".",".",".",".","6","."],
//  ["8",".",".",".","6",".",".",".","3"],
//  ["4",".",".","8",".","3",".",".","1"],
//  ["7",".",".",".","2",".",".",".","6"],
//  [".","6",".",".",".",".","2","8","."],
//  [".",".",".","4","1","9",".",".","5"],
//  [".",".",".",".","8",".",".","7","9"]
//]
//输出: true
//示例 2:
//输入:
//[
//  ["8","3",".",".","7",".",".",".","."],
//  ["6",".",".","1","9","5",".",".","."],
//  [".","9","8",".",".",".",".","6","."],
//  ["8",".",".",".","6",".",".",".","3"],
//  ["4",".",".","8",".","3",".",".","1"],
//  ["7",".",".",".","2",".",".",".","6"],
//  [".","6",".",".",".",".","2","8","."],
//  [".",".",".","4","1","9",".",".","5"],
//  [".",".",".",".","8",".",".","7","9"]
//]
//输出: false
//解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
//     但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
//func isValidSudoku(_ board: [[Character]]) -> Bool {
//    for i in 0..<9 {
//        var map = [Character: Int]()
//        for clist in board {
//            let keyC = clist[i]
//            if map[keyC] != nil {
//                return false
//            } else if keyC != "." {
//                map[keyC] = 1
//            }
//        }
//    }
//
//    for clist in board {
//        var map = [Character: Int]()
//        for i in 0..<9 {
//            let keyC = clist[i]
//            if map[keyC] != nil {
//                return false
//            } else if keyC != "." {
//                map[keyC] = 1
//            }
//        }
//    }
//
//    for i in 0..<3 {
//        for n in 0..<3 {
//            var map = [Character: Int]()
//            for j in 0..<3 {
//                for k in 0..<3 {
//                    let keyC = board[j + 3 * i][k + 3 * n]
//                    if map[keyC] != nil {
//                        return false
//                    } else if keyC != "." {
//                        map[keyC] = 1
//                    }
//                }
//            }
//        }
//    }
//    return true
//}
//
//print(isValidSudoku([["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"], [".","6",".",".",".",".","2","8","."], [".",".",".","4","1","9",".",".","5"], [".",".",".",".","8",".",".","7","9"]]))

//给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
//你可以假设数组中无重复元素。
//示例 1:
//输入: [1,3,5,6], 5
//输出: 2
//示例 2:
//输入: [1,3,5,6], 2
//输出: 1
//示例 3:
//输入: [1,3,5,6], 7
//输出: 4
//示例 4:
//输入: [1,3,5,6], 0
//输出: 0
//func searchInsert(_ nums: [Int], _ target: Int) -> Int {
//    var lo = 0
//    var hi = nums.count - 1
//    while lo <= hi {
//        let mid = (lo + hi) / 2
//        if target == nums[mid] {
//            return mid
//        }
//        if target < nums[mid] {
//            hi = mid - 1
//        } else {
//            lo = mid + 1
//        }
//    }
//    return max(lo, hi)
//}
//
//print(searchInsert([2], 2))
//给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
//如果数组中不存在目标值 target，返回 [-1, -1]。
//进阶：
//你可以设计并实现时间复杂度为 O(log n) 的算法解决此问题吗？
//示例 1：
//输入：nums = [5,7,7,8,8,10], target = 8
//输出：[3,4]
//示例 2：
//输入：nums = [5,7,7,8,8,10], target = 6
//输出：[-1,-1]
//示例 3：
//输入：nums = [], target = 0
//输出：[-1,-1]

//func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//    var left = -1
//    var lo = 0
//    var hi = nums.count - 1
//    while lo < hi {
//        let mid = (lo + hi) / 2
//        if nums[mid] < target {
//            lo = mid + 1
//        } else if nums[mid] > target {
//            hi = mid - 1
//        } else {
//            lo = mid
//        }
//    }
//    left = lo
//    lo = 0
//    hi = nums.count - 1
//    while lo < hi {
//        let mid = (lo + hi) / 2
//        if nums[mid] < target {
//            lo = mid + 1
//        } else if nums[mid] > target {
//            hi = mid - 1
//        } else {
//            hi = mid
//        }
//    }
//    return [left, hi]
//}

//func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
//    if nums.count == 0 {
//        return [-1, -1]
//    }
//    var lo = 0
//    var hi = nums.count - 1
//    var index = -1
//    while lo <= hi {
//        let mid = (lo + hi) / 2
//        if nums[mid] == target {
//            index = mid
//            break
//        }
//        if target > nums[mid] {
//            lo = mid + 1
//        } else {
//            hi = mid - 1
//        }
//    }
//    if index == -1 {
//        return [-1, -1]
//    }
//    var left = index - 1
//    var right = index + 1
//    while left >= 0 && nums[left] == nums[index] {
//        left -= 1
//    }
//    while right <= nums.count - 1 && nums[right] == nums[index] {
//        right += 1
//    }
//    return [left + 1, right - 1]
//}

//print(searchRange([0,1,2,3,4,4,4], 2))
//整数数组 nums 按升序排列，数组中的值 互不相同 。
//在传递给函数之前，nums 在预先未知的某个下标 k（0 <= k < nums.length）上进行了 旋转，使数组变为 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]（下标 从 0 开始 计数）。例如， [0,1,2,4,5,6,7] 在下标 3 处经旋转后可能变为 [4,5,6,7,0,1,2] 。
//给你 旋转后 的数组 nums 和一个整数 target ，如果 nums 中存在这个目标值 target ，则返回它的索引，否则返回 -1 。
//示例 1：
//输入：nums = [4,5,6,7,0,1,2], target = 0
//输出：4
//示例 2：
//输入：nums = [4,5,6,1,2,3], target = 3
//输出：-1
//示例 3：
//输入：nums = [1], target = 0
//输出：-1
//[1, 2, 4, 5, 6, 7]
//[6,7,0,1,2,4,5] 1

//func commonSearch(_ nums: [Int], _ target: Int) -> Int {
//    var left = 0
//    var right = nums.count - 1
//    while left <= right {
//        let mid = (left + right) / 2
//        if target == nums[mid] {
//            return mid
//        }
//        if target <= nums[mid] {
//            right = mid - 1
//        } else {
//            left = mid + 1
//        }
//    }
//    return -1
//}
//
//print(commonSearch([1,2,3,5,6,7,8], 6))
//
//func search(_ nums: [Int], _ target: Int) -> Int {
//    var left = 0
//    var right = nums.count - 1
//    while left <= right {
//        let mid = (left + right) / 2
//        if target == nums[mid] {
//            return mid
//        }
//        if nums[mid] >= nums[left] {//左边是有序的
//            if target <= nums[mid] && target >= nums[left] {
//                right = mid - 1
//            } else {
//                left = mid + 1
//            }
//        } else {//右边是有序的
//            if target >= nums[mid] && target <= nums[right] {
//                left = mid + 1
//            } else {
//                right = mid - 1
//            }
//        }
//    }
//    return -1
//}
//
//print(search([3,1], 1))


//给你一个只包含 '(' 和 ')' 的字符串，找出最长有效（格式正确且连续）括号子串的长度。
//示例 1：
//输入：s = "(()"
//输出：2
//解释：最长有效括号子串是 "()"
//示例 2：
//输入：s = ")()())"
//输出：4
//解释：最长有效括号子串是 "()()"
//示例 3：
//输入：s = ""
//输出：0

//func longestValidParentheses(_ s: String) -> Int {
//    if s.count == 0 {
//        return 0
//    }
//    var cur = 0
//    var max_cnt = 0
//    var list = [Int]()
//    list.append(-1)
//    let strList = Array(s)
//    while cur < strList.count {
//
//        let c = strList[cur]
//        switch c {
//        case "(":
//            list.append(cur)
//        case ")":
//            list.removeLast()
//            if list.count != 0 {
//                max_cnt = max(max_cnt, cur - list.last!)
//            } else {
//                list.append(cur)
//            }
//        default:
//            break
//        }
//        cur += 1
//    }
//    return max_cnt
//}
////-1 0
////-1 1 2
//print(longestValidParentheses("()(()()"))

//实现获取 下一个排列 的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
//如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
//必须 原地 修改，只允许使用额外常数空间。
//示例 1：
//输入：nums = [1,2,3]
//输出：[1,3,2]
//示例 2：
//输入：nums = [3,2,1]
//输出：[1,2,3]
//示例 3：
//输入：nums = [1,1,5]
//输出：[1,5,1]
//示例 4：
//输入：nums = [1]
//输出：[1]

//func nextPermutation(_ nums: inout [Int]) {
//    if nums.count == 0 {
//        return
//    }
//    var left = nums.count - 2
//    while left >= 0 {
//        if nums[left] < nums[left + 1] {
//            break
//        }
//        left -= 1
//    }
//    if left >= 0 {
//        var right = nums.count - 1
//        while right >= 0 {
//            if nums[right] > nums[left] {
//                break
//            }
//            right -= 1
//        }
//
//        let tmp = nums[left]
//        nums[left] = nums[right]
//        nums[right] = tmp
//    }
//    nums[(left + 1)..<nums.count].sort()
//}
//[4,2,0,2,3,2,0]
//[4,2,0,3,0,2,2]
//[4,2,2,0,0,2,3]

//[2,1,2,3,2,0]
//[2,1,3,0,2,2]
//[2,2,0,1,2,2]
//1 2 3 4 5
//1 5 2 4 3
//1 5 3 2 4
//1 2 3 4
//1 2 4 3
//1 3 2 4
//1 3 4 2
//1 4 2 3
//1 4 3 2
//2 1 3 4
//2 1 4 3
//2,3,1,4
//2,3,4,1
//2,4,1,3
//2,4,3,1
//3,1,2,4
//3 1 4 2
//3 2 1 4
//3 2 4 1
//3 4 1 2
//3 4 2 1

//1 2 3
//1 3 2
//2 1 3
//2 3 1
//3 1 2
//3 2 1
//var nums = [1,2]
////2 3 1
////2, 1, 3
//nextPermutation(&nums)
//print(nums)

//给定一个字符串 s 和一些长度相同的单词 words。找出 s 中恰好可以由 words 中所有单词串联形成的子串的起始位置。
//注意子串要与 words 中的单词完全匹配，中间不能有其他字符，但不需要考虑 words 中单词串联的顺序
//示例 1：
//输入：
//  s = "barfoothefoobarman",
//  words = ["foo","bar"]
//输出：[0,9]
//解释：
//从索引 0 和 9 开始的子串分别是 "barfoo" 和 "foobar" 。
//输出的顺序不重要, [9,0] 也是有效答案。
//示例 2：
//输入：
//  s = "wordgoodgoodgoodbestword",
//  words = ["word","good","best","word"]
//输出：[] 1234 1243 1324 1342 1423 1432 2134 2142 2314 2341 2413 2431
//func findSubstring(_ s: String, _ words: [String]) -> [Int] {
//    var results = [Int]()
//    if s.count == 0 || words.count == 0 {
//        return results
//    }
//    var cnt = 0
//    var map = [String: Int]()
//    for str in words {
//        if let val = map[str] {
//            map[str] = val + 1
//        } else {
//            map[str] = 1
//        }
//    }
//    let length = words[0].count
//    let sum_length = words.count * length
//    if s.count < sum_length {
//        return results
//    }
//    var left = 0
//    while left < (s.count - sum_length) {
//        var tmp_map = [String: Int]()
//        var j = left
//        while j - left < sum_length {
//            cnt += 1
//            let tmp_str = String(s[s.index(s.startIndex, offsetBy: j)..<s.index(s.startIndex, offsetBy: j + length)])
//            if let val = map[tmp_str] {
//                let val1 = tmp_map[tmp_str]
//                if val1 != nil {
//                    if val1! < val {
//                        tmp_map[tmp_str] = val1! + 1
//                    } else {
//                        left += (tmp_map.count - 1) * length
//                        break
//                    }
//                } else {
//                    tmp_map[tmp_str] = 1
//                }
//            } else {
//                left += sum_length
//                break
//            }
//            j += length
//        }
//        if tmp_map == map {
//            results.append(left)
//        }
//        left += 1
//    }
//    print(cnt)
//    return results
//}
//
////"wordgoodgoodgoodbestword"
////["word","good","best","good"]
//print(findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
//给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。
//返回被除数 dividend 除以除数 divisor 得到的商。
//整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2
//示例 1:
//输入: dividend = 10, divisor = 3
//输出: 3
//解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
//示例 2:
//输入: dividend = 7, divisor = -3
//输出: -2
//解释: 7/-3 = truncate(-2.33333..) = -2
//func divide(_ dividend: Int, _ divisor: Int) -> Int {
//    if dividend == 0 {
//        return 0
//    }
//    if divisor == 1 {
//        return dividend
//    }
//
//    if divisor == -1 {
//        if dividend > Int(Int32.min) {
//            return -dividend
//        }
//        return Int(Int32.max)
//    }
//
//    let sign = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
//    let left = dividend < 0 ? -dividend : dividend
//    let right = divisor < 0 ? -divisor : divisor
//    return sign ? div(left, right) : -div(left, right)
//}
//
//func div(_ a: Int, _ b: Int) -> Int {
//    if a < b {
//        return 0
//    }
//    var count = 1
//    var result = b
//    while result + result <= a {
//        count += count
//        result += result
//    }
//    return count + div(a - result, b)
//}
//
//print(divide(2147483647, 2))

//实现 strStr() 函数。
//给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
//示例 1:
//输入: haystack = "hello", needle = "ll"
//输出: 2
//示例 2:
//输入: haystack = "aaaaa", needle = "bba"
//输出: -1
//说明:
//当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
//对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
//func strStr(_ haystack: String, _ needle: String) -> Int {
//    if needle.count == 0 || haystack == needle {
//        return 0
//    }
//    let firstLetter = needle.first
//    if haystack.count - needle.count > 0 {
//        for i in 0...(haystack.count - needle.count) {
//            if haystack[haystack.index(haystack.startIndex, offsetBy: i)] == firstLetter {
//                if String(haystack[haystack.index(haystack.startIndex, offsetBy: i)..<haystack.index(haystack.startIndex, offsetBy:i + needle.count)]) == needle {
//                    return i
//                }
//            }
//        }
//    }
//    return -1
//}
//
//print(strStr("abc", "bc"))


//给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。
//不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。
//元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。
//说明:
//为什么返回数值是整数，但输出的答案是数组呢?
//请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
//你可以想象内部操作如下:
//// nums 是以“引用”方式传递的。也就是说，不对实参作任何拷贝
//int len = removeElement(nums, val);
//// 在函数里修改输入数组对于调用者是可见的。
//// 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}
//示例 1：
//输入：nums = [3,2,2,3], val = 3
//输出：2, nums = [2,2]
//解释：函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。你不需要考虑数组中超出新长度后面的元素。例如，函数返回的新长度为 2 ，而 nums = [2,2,3,3] 或 nums = [2,2,0,0]，也会被视作正确答案。
//示例 2：
//输入：nums = [0,1,2,2,3,0,4,2], val = 2
//0 1 3 2 2 0 4 2
//0 1 3 0 2 2 4 2
//0 1 3 0 4 2 2 2
//输出：5, nums = [0,1,4,0,3]
//解释：函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。注意这五个元素可为任意顺序。你不需要考虑数组中超出新长度后面的元素。

//func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//    var i = 0
//    for j in 0..<nums.count {
//        if nums[j] != val {
//            nums[i] = nums[j]
//            i += 1
//        }
//    }
//    return i
//}
//func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//    if nums.count == 0 {
//        return 0
//    }
//    if nums.count == 1 {
//        return nums[0] == val ? 0 : 1
//    }
//    var left = 0
//    var right = 1
//    while left <= nums.count - 1{
//        if nums[left] == val {
//            while right < nums.count && nums[right] == val{
//                right += 1
//            }
//            if right < nums.count {
//                let temp = nums[left]
//                nums[left] = nums[right]
//                nums[right] = temp
//            } else {
//                break
//            }
//
//        } else {
//            left += 1
//            right = left + 1
//        }
//    }
//    return left
//}

//var nums = [3,3]
//0 0 1 1 1 2 2 3 3 4
//0 1 0 1 1 2 2 3 3 4
//0 1 2 3 1 0 2 1 3 4
//0 1 2 3 4 0 2 1 3 1
//var nums = [0]
//let len = removeElement(&nums, 5);
// 在函数里修改输入数组对于调用者是可见的。
// 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。

//while true {
//    for val in nums {
//        print(val)
//    }
//    break
//}

//给你一个有序数组 nums ，请你 原地 删除重复出现的元素，使每个元素 只出现一次 ，返回删除后数组的新长度。
//不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。
//说明:
//为什么返回数值是整数，但输出的答案是数组呢?
//请注意，输入数组是以「引用」方式传递的，这意味着在函数里修改输入数组对于调用者是可见的。
//你可以想象内部操作如下:
//// nums 是以“引用”方式传递的。也就是说，不对实参做任何拷贝
//int len = removeDuplicates(nums);
//// 在函数里修改输入数组对于调用者是可见的。
//// 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
//for (int i = 0; i < len; i++) {
//    print(nums[i]);
//}

//func removeDuplicates(_ nums: inout [Int]) -> Int {
//    if nums.count < 2 {
//        return nums.count
//    }
//    var left = 0
//    var right = 1
//    while right <= nums.count - 1 {
//        if nums[left] != nums[right] {
//            left += 1
//            nums[left] = nums[right]
//        }
//        right += 1
//
//    }
//    return left + 1
//}

//var nums = [0,0,1,1,1,2,2,3,3,4]
////0 0 1 1 1 2 2 3 3 4
////0 1 0 1 1 2 2 3 3 4
////0 1 2 3 1 0 2 1 3 4
////0 1 2 3 4 0 2 1 3 1
////var nums = [0]
//let len = removeDuplicates(&nums);
//// 在函数里修改输入数组对于调用者是可见的。
//// 根据你的函数返回的长度, 它会打印出数组中 该长度范围内 的所有元素。
//
//while true {
//    for val in nums {
//        print(val)
//    }
//    break
//}


//给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
//你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
//示例 1：
//输入：head = [1,2,3,4]
//输出：[2,1,4,3]
//示例 2：
//输入：head = []
//输出：[]
//示例 3：
//输入：head = [1]
//输出：[1]
//func swapPairs(_ head: ListNode?) -> ListNode? {
//    let dummy = ListNode.init(0)
//    var cur = dummy
//    var low = head
//    var high = head?.next?.next
//    dummy.next = head
//
//    while low != nil && low?.next != nil {
//        let temp = low?.next //2
//        low?.next = high // 1 -> 3
//        cur.next = temp! // 0 -> 2
//        temp?.next = low // 2 -> 1
//        cur = low! // 0 -> 1
//        low = high // low = 3
//        high = high?.next?.next // nil
//    }
//    return dummy.next
//}
//
//printList(swapPairs(node1))

//明明想在学校中请一些同学一起做一项问卷调查，为了实验的客观性，他先用计算机生成了N个1到1000之间的随机整数（N≤1000），对于其中重复的数字，只保留一个，把其余相同的数去掉，不同的数对应着不同的学生的学号。然后再把这些数从小到大排序，按照排好的顺序去找同学做调查。请你协助明明完成“去重”与“排序”的工作(同一个测试用例里可能会有多组数据(用于不同的调查)，希望大家能正确处理)。
//
//题目描述
//计算字符串最后一个单词的长度，单词以空格隔开。
//
//输入描述:
//输入一行，代表要计算的字符串，非空，长度小于5000。
//
//输出描述:
//输出一个整数，表示输入字符串最后一个单词的长度。
//
//示例1
//输入
//复制
//hello nowcoder
//输出
//复制
//8

//注：测试用例保证输入参数的正确性，答题者无需验证。测试用例不止一组。
//
//当没有新的输入时，说明输入结束。
//
//
//输入描述:
//注意：输入可能有多组数据(用于不同的调查)。每组数据都包括多行，第一行先输入随机整数的个数N，接下来的N行再输入相应个数的整数。具体格式请看下面的"示例"。
//
//
//输出描述:
//返回多行，处理后的结果
//样例输入解释：
//样例有两组测试
//第一组是3个数字，分别是：2，2，1。
//第二组是11个数字，分别是：10，20，40，32，67，40，20，89，300，400，15。

import Foundation


//while true {
//    if let input = scanf() {
//        if let lastLetter = input.components(separatedBy: " ").last {
//            print(lastLetter.count)
//        }
//    } else {
//        break
//    }
//}

//func scanf() -> String? {
//    guard let read = readLine() else {
//        return nil
//    }
//    return String(read)
//}
//示例 1：
//编写一个函数来查找字符串数组中的最长公共前缀。

//如果不存在公共前缀，返回空字符串 ""。


//输入：strs = ["flower","flow","flight"]
//输出："fl"
//示例 2：
//
//输入：strs = ["dog","racecar","car"]
//输出：""
//解释：输入不存在公共前缀。
//while true {
//    if let _ = scanf() {
//        let strs = ["dog","racecar","car"]
//        let firstStr = strs[0]
//        var commonLetter = ""
//        if <#condition#> {
//            <#code#>
//        }
//        for i in 0..<firstStr.count {
//            let letter = String(firstStr[firstStr.index(firstStr.startIndex, offsetBy: i)])
//            var hasCommon = true
//            for j in 1..<strs.count {
//                let str = strs[j]
//                let leftLetter = String(str[str.index(str.startIndex, offsetBy: i)])
//                if letter != leftLetter {
//                    hasCommon = false
//                }
//            }
//            if !hasCommon {
//                break
//            } else {
//                commonLetter += letter
//            }
//        }
//        print(commonLetter)
//    } else {
//        break
//    }
//}

//while true {
//    guard let input = scanf() else {
//        break
//    }
//    if var sum = Int(input) {
//        for i in 2...Int(sqrt(Double(sum))) {
//            if sum % i == 0 {
//                while sum % i == 0 {
//                    sum = sum / i
//                    print("\(i) ", separator:" ", terminator:"")
//                }
//            }
//        }
//        if sum != 1 {
//           print("\(sum) ")
//           break
//       }
//    }
//    break
//}

//while true {
//    if let input = scanf() {
//        let count = input.count / 8
//        let leftCount = input.count % 8
//        for i in 0..<count {
//            let start = input.index(input.startIndex, offsetBy: i * 8)
//            let end = input.index(input.startIndex, offsetBy: (i + 1) * 8)
//            print(String(input[start..<end]))
//        }
//        if leftCount != 0 {
//            var last = String(input[input.index(input.startIndex, offsetBy: count * 8)..<input.index(input.startIndex, offsetBy: input.count)])
//            for _ in 0..<(8 - leftCount) {
//                last += "0"
//            }
//            print(last)
//        }
//    }
//}
//
//while true {
//    if let input = scanf() {
//        if let secondInput = scanf() {
//            var sum = 0
//            for char in input.lowercased() {
//                if char == Character(secondInput.lowercased()) {
//                    sum += 1
//                }
//            }
//            print(sum)
//        }
//    } else {
//        break
//    }
//}


//func switchToValue(s: String) -> Int {
//    switch s {
//    case "A":
//        return 10
//    case "B":
//        return 11
//    case "C":
//        return 12
//    case "D":
//        return 13
//    case "E":
//        return 14
//    case "F":
//        return 15
//    default:
//        return Int(s) ?? 0
//    }
//}
//
//while true {
//    if let s = scanf() {
//        var sum = 0
//        for i in 2..<s.count {
//            let value = switchToValue(s: String(s[s.index(s.startIndex, offsetBy: i)]))
//            sum = (sum * 16 + value)
//        }
//        print(sum)
//    } else {
//        break
//    }
//}

//while true {
//    if let input = scanf(), let s = Int(input) {
//        if s > 0 {
//            var inputCount = s
//            var set = Set<String>()
//            while inputCount > 0 {
//                if let data = scanf() {
//                    set.insert(data)
//                }
//                inputCount = inputCount - 1
//            }
//            for str in set.sorted(by: { (str1, str2) -> Bool in
//                return Int(str1) ?? 0 < Int(str2) ?? 0
//            }) {
//                print(str)
//            }
//        }
//    } else {
//        break
//    }
//}

