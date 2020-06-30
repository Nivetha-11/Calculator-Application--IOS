

import UIKit

@IBDesignable
class CurveButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBInspectable var curveButton:Bool = false{
        didSet{
            if curveButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if curveButton{
            layer.cornerRadius = frame.height / 2
        }
    }
}
