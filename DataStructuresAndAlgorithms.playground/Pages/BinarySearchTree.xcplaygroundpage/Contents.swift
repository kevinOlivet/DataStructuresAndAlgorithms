import Foundation

// OJO: This BinarySearchTree is
class BinaryNode<Element> {

    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?

    init(value: Element) {
        self.value = value
    }

    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

extension BinaryNode: CustomStringConvertible {
    var description: String {
        return String(describing: value)
    }
}

struct BinarySearchTree<Element: Comparable> {
    private(set) var root: BinaryNode<Element>?

    init() { }

    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }

    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        // OJO: This comparison could be <= to better manage duplicate values
        // Using <= will result in a more balanced tree
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySearchTree {
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }

    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }

        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }

            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)

        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
}

extension BinarySearchTree: CustomStringConvertible {
        var description: String {
            guard let first = root else { return "(Empty)" }
            var queue = [BinaryNode<Element>]()
            queue.append(first)
            var output = ""
            while queue.count > 0 {
                var nodesAtCurrentLevel = queue.count
                while nodesAtCurrentLevel > 0 {
                    let node = queue.removeFirst()
                    output += "\(node.value) "
                    if node.leftChild != nil { queue.append(node.leftChild!) }
                    if node.rightChild != nil { queue.append(node.rightChild!) }
                    nodesAtCurrentLevel -= 1
                }
                output += "\n"
            }
            return output
        }
}

var bst = BinarySearchTree<Int>()
bst.insert(5)
bst.insert(1)
bst.insert(7)
bst.insert(6)
bst.insert(2)
bst.insert(1)
bst.insert(9)
bst.insert(1)

print(bst)
