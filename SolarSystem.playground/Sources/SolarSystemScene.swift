import SpriteKit

public class SolarSystemScene: SKScene {
    private var label : SKLabelNode!
    private var sun : SKShapeNode!
    private var orbit: SKShapeNode!
    private var planet: SKShapeNode!
    private var moonOrbit: SKShapeNode!
    private var moon: SKShapeNode!

    override public func didMove(to view: SKView) {
        // Sun node
        sun = SKShapeNode(rectOf: CGSize(width: 100, height: 100), cornerRadius: 50)
        sun.position = CGPoint(x: 0, y: 0)
        sun.fillColor = .yellow
        sun.run(SKAction.repeatForever(SKAction.rotate(byAngle:6, duration: 2)))
        addChild(sun)

        // Planet orbit node
        orbit = SKShapeNode(rectOf: CGSize(width: 400, height: 400), cornerRadius: 200)
        orbit.position = CGPoint(x: 0, y: 0)
        addChild(orbit)

        // Planet node
        planet = SKShapeNode(rectOf: CGSize(width: 30, height: 30), cornerRadius: 15)
        planet.position = CGPoint(x: 0, y: 0)
        planet.fillColor = .red
        planet.run(SKAction.repeatForever(SKAction.follow(orbit.path!, asOffset: false, orientToPath: true, speed: 100)))
        orbit.addChild(planet)

        // Moon orbit node
        moonOrbit = SKShapeNode(rectOf: CGSize(width: 90, height: 90), cornerRadius: 45)
        moonOrbit.position = CGPoint(x: 0, y: 0)
        planet.addChild(moonOrbit)

        // Moon node
        moon = SKShapeNode(rectOf: CGSize(width: 10, height: 10), cornerRadius: 5)
        moon.position = CGPoint(x: 0, y: 0)
        moon.fillColor = .blue
        moon.run(SKAction.repeatForever(SKAction.follow(moonOrbit.path!, asOffset: false, orientToPath: false, speed: 100)))
        moonOrbit.addChild(moon)
    }

    @objc public static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }

    public override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
