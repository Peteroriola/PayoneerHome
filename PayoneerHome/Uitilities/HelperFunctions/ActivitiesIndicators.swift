//
//  ActivitiesIndicators.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit

let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();
let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 40, height: 50))


let aview : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 5
    view.clipsToBounds = true
    view.isOpaque = false
    return view
}()

extension UIActivityIndicatorView {
    
    static func startLoading() -> UIView {
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = UIColor.black
        activityIndicator.hidesWhenStopped = true;
        activityIndicator.startAnimating();
        aview.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        aview.addSubview(activityIndicator)
        activityIndicator.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 50, width: 50)
        activityIndicator.centerXAnchor.constraint(equalTo: aview.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: aview.centerYAnchor).isActive = true
        //UIApplication.shared.beginIgnoringInteractionEvents();
        return aview
    }
    
   static func stopLoading(){
        activityIndicator.stopAnimating();
        aview.removeFromSuperview()
        
    }
}
