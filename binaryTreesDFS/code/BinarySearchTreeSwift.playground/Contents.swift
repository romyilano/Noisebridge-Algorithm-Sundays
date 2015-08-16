//: Playground - noun: a place where people can play
//: taken mostly straight off the website
//: http://waynewbishop.com/swift/

import UIKit

// generic binary search tree

public class AVLTree<T: Comparable> {
    
    var key: T? // root
    var left: AVLTree?
    var right:AVLTree?
   
    func addNode(key: T) {
        if (self.key == nil) {
            self.key = key
            return
        }
        
        // check the left side of the tree
        if (key < self.key) {
            if (self.left != nil) { // recursion
                left!.addNode(key) // forced unwrapping
            } else {
                // create new left node
                var leftChild: AVLTree = AVLTree()
                leftChild.key = key
                self.left = leftChild
            }
        }
        //check the right side
        if (key > self.key) {
            if self.right != nil {
                right!.addNode(key)
            } else {
                // create a new right node
                var rightChild:AVLTree = AVLTree()
                rightChild.key = key
                self.right = rightChild
            }
        }
    }
    
    // Mark - DFS
    func printInOrderTraversal() {
        
        if self.key == nil {
            print("No key provided")
        }
        
        // left side RECURSE!
        if self.left != nil {
            left?.printInOrderTraversal()
        }
        
        print("\(self.key)")
        
        // process the right side with recursion
        if self.right != nil {
            right?.printInOrderTraversal()
        }
    }
    
    func printPreOrderTraversal() {
        if (self.key == nil) {
            print("No key provided")
        }
        
        print("\(self.key)")
        
        if self.left != nil {
            left?.printPreOrderTraversal()
        }
        
        if (self.right != nil) {
            right?.printPreOrderTraversal()
        }
    }
    
    func printPostOrderTraversal() {
        if self.key == nil {
            print("No key provided")
        }
        
        if self.left != nil {
            left?.printPostOrderTraversal()
        }
        
        if self.right != nil {
            right?.printPostOrderTraversal()
        }
        
        print("\(self.key)")
    }
}


let numberList:Array<Int> = [8, 2, 10, 9, 11, 7]

var root = AVLTree<Int>()

//sort each item in list
for number in numberList {
    root.addNode(number)
}

// O(log n) for insertion
// O (log n) for lookup


// print out all the values of the tree

// now review the DFS traversals


root.printInOrderTraversal()

root.printPreOrderTraversal()

root.printPostOrderTraversal()

