import UIKit

class Amplifier {
    
    func on() {
        print(toString(), "on")
    }
    
    func off() {
        print(toString(), "off")
    }
    
    private func toString() -> String {
        return "Amplifier"
    }
    
    init() {}
    
}

class DvdPlayer {
    
    func on() {
        print(toString(), "on")
    }
    
    func off() {
        print(toString(), "off")
    }
    
    func play(film: Film) {
        print("Playing ", film.name)
    }
    
    private func toString() -> String {
        return "DvdPlayer"
    }
    
    init() {}
    
}

class Projector {
    
    func on() {
        print(toString(), "on")
    }
    
    func off() {
        print(toString(), "off")
    }
    
    func tvMode() {
        print(toString(), "tvMode")
    }
    
    func wideScreenMode() {
        print(toString(), "wideScreenMode")
    }
    
    private func toString() -> String {
        return "Projector "
    }
    
    init() {}
    
}

class TheatherLights {
    
    func on() {
        print(toString(), "on")
    }
    
    func off() {
        print(toString(), "off")
    }
    
    private func toString() -> String {
        return "TheatherLights "
    }
    
    init() {}
    
}

struct Film {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
}

class HomePlayerFacade {
    
    private var amplifier: Amplifier
    private var dvd: DvdPlayer
    private var projector: Projector
    private var light: TheatherLights
    
    func watch(film: Film) {
        
        print("Movie will start")
        projector.on()
        light.on()
        amplifier.on()
        dvd.on()
        dvd.play(film: film)
        
    }
    
    func end(){
        
        print("Movie is end!")
        projector.off()
        amplifier.off()
        dvd.off()
        
    }
    
    init(
        amplifier: Amplifier,
        dvd: DvdPlayer,
        projector: Projector,
        light: TheatherLights
    ) {
        self.amplifier = amplifier
        self.dvd = dvd
        self.projector = projector
        self.light = light
    }
}


let amplifier = Amplifier()
let dvd = DvdPlayer()
let projector = Projector()
let light = TheatherLights()
let film = Film(name: "Омерзительная восьмерка")

let player = HomePlayerFacade(
    amplifier: amplifier,
    dvd: dvd,
    projector: projector,
    light: light
)

player.watch(film: film)
player.end()

// OUTPUT:
//Movie will start
//Projector  on
//TheatherLights  on
//Amplifier on
//DvdPlayer on
//Playing  Омерзительная восьмерка
//Movie is end!
//Projector  off
//Amplifier off
//DvdPlayer off

