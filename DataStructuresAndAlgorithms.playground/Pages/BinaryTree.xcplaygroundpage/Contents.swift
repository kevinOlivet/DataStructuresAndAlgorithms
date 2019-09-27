import Foundation

class BinaryNode<Element> {

    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?

    init(_ value: Element) {
        self.value = value
    }
}

extension BinaryNode {

    // Traverse In Order = 1-9-3-10-2-4-6
    func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }

    // Traverse Post Order = 1-3-9-4-6-2-10
    func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }

    // Traverse Pre Order = 10-9-1-3-2-4-6
    func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
}

/*
                 10
               /    \
              9      2
            / \     / \
           1   3   4   6

 */

let ten = BinaryNode(10)

let nine = BinaryNode(9)
let two = BinaryNode(2)

let one = BinaryNode(1)
let three = BinaryNode(3)
let four = BinaryNode(4)
let six = BinaryNode(6)

ten.leftChild = nine
ten.rightChild = two

nine.leftChild = one
nine.rightChild = three

two.leftChild = four
two.rightChild = six

//ten.traverseInOrder { print($0) }
//ten.traversePostOrder { print($0) }
ten.traversePreOrder { print($0) }
