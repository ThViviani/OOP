import UIKit
import Foundation
import os

protocol Observer {
    func update(dataOfView data: Int)
    func unsubscribe(_ subject: Subject)
    var id: Int { get }
}

protocol DisplayElements {
    func display()
}

protocol Subject {
    func registerObserver(_ observer: Observer)
    func removeObserver(_ observer: Observer)
    func notifyObservers()
}

class WeatherData: Subject {
    
    var observers: Array<Observer> = []
    
    func registerObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer) {
        if let index = observers.firstIndex(where: {$0.id == observer.id} ) {
            observers.remove(at: index)
        }
    }
    
    func notifyObservers() {
        for observer in observers {
            observer.update(dataOfView: getData())
        }
    }
        
    func getData() -> Int {
        return Int(arc4random())
    }
    
}

class CurrentConditionView: Observer, DisplayElements {
    
    var id: Int = Int(arc4random())

    var data: Int = 0
    
    init(_ subject: Subject) {
        subject.registerObserver(self)
    }
    
    func update(dataOfView data: Int) {
        self.data = data
        display()
    }
    
    func display() {
        print("CurrentConditionView, data = \(data)")
    }
    
    func unsubscribe(_ subject: Subject) {
        subject.removeObserver(self)
    }
    
}

class TemperatureView: Observer, DisplayElements {

    var id: Int = Int(arc4random())
    
    var data: Int = 0
    
    init(_ subject: Subject) {
        subject.registerObserver(self)
    }
    
    func update(dataOfView data: Int) {
        self.data = data
        display()
    }
    
    func display() {
        print("TemperatureView, data = \(data)")
    }
    
    func unsubscribe(_ subject: Subject) {
        subject.removeObserver(self)
    }
    
}

let testWeatherData = WeatherData()
var view1 = CurrentConditionView(testWeatherData)
var view2 = TemperatureView(testWeatherData)

view1.data
view2.data

testWeatherData.observers

testWeatherData.notifyObservers()
view1.data
view2.data

testWeatherData.notifyObservers()
view1.data
view2.data

view2.unsubscribe(testWeatherData)
view1.data
view2.data

testWeatherData.notifyObservers()
testWeatherData.notifyObservers()
testWeatherData.notifyObservers()
view1.data
view2.data





