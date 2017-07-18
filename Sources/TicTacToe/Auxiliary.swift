import Foundation

func crossPlatformRandom(upperBound num: UInt32) -> Int {
    let rand: UInt32

    #if os(Linux)
        srandom(UInt32(time(nil)))
        rand = (UInt32(random()) % (num))
    #else
        rand = (arc4random_uniform(num))
    #endif

    return Int(rand)
}
