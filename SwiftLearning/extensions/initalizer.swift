// extension as initializers

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()

print("\(defaultRect)")

let memberwiseRect = Rect(
    origin: Point(x: 2.0, y: 2.0),
    size: Size(width: 5.0, height: 5.0)
)

print("\(memberwiseRect)")

print("------------------------")

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
print("\(centerRect)")
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
