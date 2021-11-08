//
//  setLanguageViewController.swift
//  Guest Dashboard UI
//
//  Created by BS-125 on 6/11/21.
//

import UIKit

class setLanguageViewController: UIViewController {

    @IBOutlet weak var selectLanguageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLanguageView.roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }

}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
