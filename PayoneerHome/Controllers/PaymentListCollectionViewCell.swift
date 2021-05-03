//
//  PaymentListCollectionViewCell.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit

class PaymentListCollectionViewCell: UICollectionViewCell {
    
    //Creat Cell items
        var container : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 8
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height:0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

        }()

        var payMethodListImage : CustomImageView = {
        let imageView = CustomImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 60))
            imageView.contentMode = .scaleToFill
        return imageView

        }()


            var paymentMethodListNameLabel : UILabel = {
            let label = UILabel()

            label.textAlignment = .left
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
            label.textColor = .black
            label.adjustsFontSizeToFitWidth = true
            return label
            }()



         override init(frame: CGRect) {
             super.init(frame: frame)
          
            self.contentView.addSubview(self.container)
            self.container.addSubview(payMethodListImage)
            self.container.addSubview(paymentMethodListNameLabel)

             
            
          
          setupAnchor()
          
        }
           
    //Configure cell layout
        fileprivate func setupAnchor() {
                let width = frame.width
         
        container.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)

            payMethodListImage.anchor(top: container.topAnchor, left: container.leftAnchor, bottom:  nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, height: 60, width: 80)
             
                
        paymentMethodListNameLabel.anchor(top: container.topAnchor, left: payMethodListImage.rightAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 10, paddingBottom: 30, paddingRight: 20, height: 30, width: width - 150)

                
        }
                        
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

        }
