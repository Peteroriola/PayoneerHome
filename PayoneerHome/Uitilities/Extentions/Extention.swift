//
//  Extention.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit

extension UINavigationController {
    
    static func pushToNewNavigation(controller: UIViewController, navController: UINavigationController) {
        navController.pushViewController(controller, animated: true)
    }
    
    
    static func pushToNewNavigationWithCallBack(controller: UIViewController, navController: UINavigationController, completion: @escaping () -> () ) {
        completion()
        navController.pushViewController(controller, animated: true)
    }
    
    static func presentNewNavigationController(controller: UIViewController) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller)
        return navController
    }
    
    static func presentNewNavigationControllerWithCallBack(controller: UIViewController, completion: @escaping () -> ()) -> UINavigationController {
        let navController = UINavigationController(rootViewController: controller)
        completion()
        return navController
    }
    
}
func navbarTitle(title: String) -> UILabel {
    let label = UILabel()
    label.text = title
    label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
    label.textColor = UIColor.white
    label.sizeToFit()
    return label
}

import UIKit

extension UIView {
    
    func anchorSize(to view: UIView) {
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop : CGFloat, paddingLeft : CGFloat, paddingBottom : CGFloat, paddingRight: CGFloat, height : CGFloat, width : CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant : paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        
    }
    
    
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha:1)
    }
  
    static func rgba(red: CGFloat, green: CGFloat, blue:CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha:0)
    }
    static func appGreenColor() -> UIColor {
        return UIColor.rgb(red: 41, green: 113, blue: 42)
    }

}

extension UIImage {
    func tintImageColor(color: UIColor) -> UIImage {
        var image = withRenderingMode(.alwaysTemplate)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.set()
        
        image.draw(in: CGRect(origin: .zero, size: size))
        image = UIGraphicsGetImageFromCurrentImageContext() ?? image
        UIGraphicsEndImageContext()
        return image
    }
}
extension UIAlertController {
    
    static func alert(title:String, message:String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        return alert
    }
}
