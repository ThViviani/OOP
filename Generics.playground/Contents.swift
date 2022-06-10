import UIKit
import Foundation

protocol List {
    associatedtype T
    func push(element: T)
    func put(element: T, position: Int)
    func remove(position: Int)
    func find(element: T) -> Int?
    func getElement(index: Int) -> T?
}

class LinkedList<T:Equatable>: List {
    
    private class Node<T> {
        var next: Node<T>?
        var previous: Node<T>?
        var payload: T
        
        init(for data: T) {
            self.next = nil
            self.previous = nil
            self.payload = data
        }
    }
    
    private var head: Node<T>?
    private var size: Int
    
    init() {
        self.head = nil
        self.size = 0
    }
    
    // MARK: API methods
    func push(element: T) {
        let newNode = Node<T>(for: element)
        self.size += 1
        
        if head == nil {
            head = newNode
            return
        }
        
        // <->|5|<-> -||-
        let currentNode = head
        head = newNode
        head?.next = currentNode
        currentNode?.previous = head
    }
    
    func put(element: T, position: Int) {
        
        if position >= length() {
            print("position out of list bound")
            return
        }
        
        var currentNode = head
        for _ in 0..<position {
            currentNode = currentNode?.next
        }
        
        currentNode?.payload = element
    }
    
    func remove(position: Int) {
        
        if position >= length() {
            print("position out of list bound!")
            return
        }
        
        
        
        if position == 0 {
            head = head?.next
            head?.previous = nil
            return
        }
                
        var currentNode = head?.next
        var removeNode = head?.next
        for _ in 1...position {
            removeNode = currentNode
            currentNode = currentNode?.next
        }
        currentNode?.previous = removeNode?.previous
        removeNode?.previous?.next = currentNode
        
    }
    
    func find(element: T) -> Int? {
        
        var firstFoundIndex = 0
        var currentNode = head
        while currentNode != nil {
            if currentNode?.payload == element {
                return firstFoundIndex
            }
            currentNode = currentNode?.next
            firstFoundIndex += 1
        }
        
        return nil
    }
    
    func getElement(index: Int) -> T? {
        
        if index >= length() {
            return nil
        }
        
        var currentNode = head
        for _ in 0..<index {
            currentNode = currentNode?.next
        }
        
        return currentNode?.payload
        
    }
    
    func display() {
        var currentNode = head
        while(currentNode != nil) {
            print(currentNode?.payload)
            currentNode = currentNode?.next
        }
    }

    func length() -> Int {
        return self.size
    }
}

class ArrayList<T:Equatable>: List {
    
    private var arr: [T?]
    private var size: Int
    private var reserveSize: Int
    
    init(lenghth size: Int) {
        self.arr = Array(repeating: nil, count: size)
        self.size = size
        self.reserveSize = size
    }
    
    init() {
        self.arr = []
        self.size = 0
        self.reserveSize = 0
    }
    
    // MARK: API methods
    func push(element: T) {
        
        self.size += 1
        
        if size >= reserveSize {
            let oldArray = self.arr
            self.reserveSize = size * 2
            self.arr = Array(repeating: nil, count: reserveSize)
            
            for index in oldArray.indices {
                self.arr[index] = oldArray[index]
            }
            
            self.arr[size - 1] = element
            return
        }
        
        self.arr[size - 1] = element

    }
    
    func put(element: T, position: Int) {
        
        if position >= size {
            print("position out of array bound")
            return
        }
        
        self.arr[position] = element
        
    }
    
    func remove(position: Int) {
        
        if position >= size {
            print("position out of array bound")
            return
        }
        
        for index in 1..<size {
            if index > position {
                arr[index - 1] = arr[index]
                arr[index] = nil
            }
        }
        
        size -= 1
    }
    
    func find(element: T) -> Int? {
        
        for index in 0..<size {
            if arr[index] == element {
                return index
            }
        }
        
        return nil
        
    }
    
    func getElement(index: Int) -> T? {
        
        if index >= size {
            print("position out of array bound")
            return nil
        }
        
        return arr[index]
        
    }
    
    func displaySize() {
        print(self.size, self.reserveSize)
    }
    
    func display() {
        
        for index in 0..<self.size {
            print(arr[index])
        }
        
    }
}

// MARK: Examples: Linked list
var ls = LinkedList<Int>() // nil
ls.push(element: 5)  // nil <->|5|<-> nil
ls.push(element: 10) // nil <->|5|<->|10|<-> nil
ls.push(element: 11) // nil <->|5|<->|10|<->|11|<-> nil

ls.put(element: 667, position: 667) // position out of list bound
ls.put(element: 1, position: 1)     // nil <->|5|<->|1|<->|11|<-> nil

ls.remove(position: 668) // position out of list bound!
ls.remove(position: 1)   // nil <->|5|<->|11|<-> nil

ls.find(element: 1111111) // nil
ls.find(element: 5)       // 1
ls.find(element: 11)      // 0

ls.getElement(index: 669) // nil
ls.getElement(index: 0)   // 11


// MARK: Examples: Array list
var arr = ArrayList<Int>(lenghth: 15) // [nil, nil, ..., nil] size = 15
arr = ArrayList<Int>() // []

arr.push(element: 2) // [2]
arr.push(element: 4) // [2, 4]
arr.push(element: 3) // [2, 4, 3]
arr.push(element: 5) // [2, 4, 3, 5]

arr.put(element: 667, position: 1000) // position out of array bound
arr.put(element: 667, position: 3)    // [2, 4, 3, 667]

arr.remove(position: 668) // position out of array bound
arr.remove(position: 1)   // [2, 3, 667]

arr.find(element: 668) // nil
arr.find(element: 2)   // 0

arr.getElement(index: 669) // nil
arr.getElement(index: 0)   // 2


