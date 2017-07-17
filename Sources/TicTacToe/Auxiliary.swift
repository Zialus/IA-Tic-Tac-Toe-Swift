import Foundation

func crossPlatformRandom(upperBound n: UInt32) -> Int {
    let rand: UInt32

    #if os(Linux)
        srandom(UInt32(time(nil)))
        rand = (random() % (n))
    #else
        rand = (arc4random_uniform(n))
    #endif

    return Int(rand)
}
