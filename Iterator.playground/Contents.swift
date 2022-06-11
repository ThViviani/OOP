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

protocol IteratorInterface {
    
    associatedtype Item
    func first() -> Item?
    func next()
    func isDone() -> Bool
    var current: Item? { get }
    
}

protocol Enumerable {
    
    associatedtype Iterator: IteratorInterface
    func makeIterator() -> Iterator
    
}

class LinkedListIterator<T:Equatable>: IteratorInterface {
    
    typealias Item = T
    
    func first() -> T? {
        return container.getElement(index: 0)
    }
    
    func next() {
        
        counter += 1
        
        if counter >= container.length() {
            counter = 0
            current = container.getElement(index: counter)
        }
        
        current = container.getElement(index: counter)
        
    }
    
    func isDone() -> Bool {
        return counter == container.length() - 1
    }
    
    var current: T?
    var container: LinkedList<T>
    var counter: Int
    
    init(for list: LinkedList<T>) {
        self.container = list
        self.current = list.getElement(index: 0)
        self.counter = 0
    }
    
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

extension LinkedList: Enumerable {

    typealias Iterator = LinkedListIterator<T>
    
    func makeIterator() -> Iterator {
        return Iterator(for: self)
    }
    
}

struct Music: Equatable {
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    func play() {
        print("Playing: " + title)
    }
}

// MARK: Examples
let playList = LinkedList<Music>()
playList.push(element: Music(title: "Soft Blade - Ksv"))
playList.push(element: Music(title: "Soft Blade - Ygoslavskiy groove"))
playList.push(element: Music(title: "Soft Blade - Silent people"))
playList.push(element: Music(title: "Soft Blade - Koleni"))
playList.push(element: Music(title: "Soft Blade - Swamp electro"))
playList.push(element: Music(title: "Soft Blade - Ne strashno"))
playList.push(element: Music(title: "Soft Blade - Softic dnb"))
playList.push(element: Music(title: "Soft Blade - Volca vidra"))
playList.push(element: Music(title: "Soft Blade - Ruchey"))

var playTrack = playList.makeIterator()

while !playTrack.isDone() {
    playTrack.current?.play()
    playTrack.next()
}
// OUTPUT:
//Playing: Soft Blade - Ruchey
//Playing: Soft Blade - Volca vidra
//Playing: Soft Blade - Softic dnb
//Playing: Soft Blade - Ne strashno
//Playing: Soft Blade - Swamp electro
//Playing: Soft Blade - Koleni
//Playing: Soft Blade - Silent people
//Playing: Soft Blade - Ygoslavskiy groove




