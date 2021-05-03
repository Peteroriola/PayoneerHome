//
//  CustomImageView.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit


    var imageCache = [String:UIImage]()

    class CustomImageView: UIImageView {
        
        var lastURLUsedToLoadImage : String?
        
        
        func loadImage(urlstring : String) {
            
            lastURLUsedToLoadImage = urlstring
            
 
            
            guard let url = URL(string: urlstring) else {return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let err = error {
                    print("Failed to fetch image", err)
                    return
                }
                
                
                if (url.absoluteString != self.lastURLUsedToLoadImage){
                    return
                }
                
                
                //Picture Data Retrieved
                guard let imageData = data else { return }
                let photoImage = UIImage(data: imageData)

                imageCache[url.absoluteString] = photoImage
                
             
                DispatchQueue.main.async {
                
                    self.image = photoImage
                }
                
                
                }.resume()
            
        }
        func loadImageWithTintColor(urlstring: String, tintColor: UIColor) {
            
            lastURLUsedToLoadImage = urlstring

            
            guard let url = URL(string: urlstring) else {return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let err = error {
                    print("Failed to fetch image", err)
                    return
                }
                
                if (url.absoluteString != self.lastURLUsedToLoadImage){
                    return
                }
      
                guard let imageData = data else { return }
                let photoImage = UIImage(data: imageData)
                imageCache[url.absoluteString] = photoImage?.tintImageColor(color: tintColor)
                DispatchQueue.main.async {
                  
                    self.image = photoImage?.tintImageColor(color: tintColor)
                }
                
                
                }.resume()
        }
}
