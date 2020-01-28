import Foundation
import CoreGraphics
import Advance
import SwiftUI

struct SimpleTransform {
    var scale: CGFloat = 1.0
    var rotation: CGFloat = 0.0
    
    init() {}
    
    init(scale: CGFloat, rotation: CGFloat) {
        self.scale = scale
        self.rotation = rotation
    }
    
    var affineTransform: CGAffineTransform {
        var t = CGAffineTransform.identity
        t = t.rotated(by: rotation)
        t = t.scaledBy(x: scale, y: scale)
        return t
    }
    
    static var zero: SimpleTransform {
        SimpleTransform(scale: 0.0, rotation: 0.0)
    }
}

extension SimpleTransform: Animatable {
        
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(scale, rotation)
        }
        set {
            scale = newValue.first
            rotation = newValue.second
        }
    }

}


