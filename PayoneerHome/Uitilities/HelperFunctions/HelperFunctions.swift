//
//  HelperFunctions.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit


func CLEAR_PAGE_LOADING_AND_TOASTS(viewcontroller:UIViewController) {
  
    UIActivityIndicatorView.stopLoading()
}


func START_PAGE_LOADING(viewcontroller: UIViewController){
  
    
    let resultingView = UIActivityIndicatorView.startLoading()
    resultingView.center = viewcontroller.self.view.center;
    viewcontroller.view.addSubview(resultingView)
}

func STOP_PAGE_LOADING(){
     UIActivityIndicatorView.stopLoading()
}

    func colorNavigationBar(navigationController:UINavigationController?){
        navigationController?.navigationBar.barTintColor = UIColor.appGreenColor()
        navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.hidesBarsOnSwipe = false
      
        
     
    }
