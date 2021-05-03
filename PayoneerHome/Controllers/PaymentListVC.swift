//
//  ViewController.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit

class PaymentListVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    //Declare Variables
    let indentifier = "paymentMethedListIndentifier"
    var paymentMethodArray = [PaymentMethodListDetails]()
        
    
    lazy var collectionView: UICollectionView = {
          let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.makeLayout())
          collectionView.backgroundColor = UIColor.clear
          collectionView.delegate = self
          collectionView.dataSource = self
          collectionView.translatesAutoresizingMaskIntoConstraints = false
          return collectionView
      }()
    
    //List Layout
    func makeLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .estimated(110))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 40, trailing: 5)
                      
                return section
                
        
        }
        
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation bar Manipulation
        navigationItem.titleView = navbarTitle(title: "Payment Methods")
        colorNavigationBar(navigationController: self.navigationController)
        view.backgroundColor = .white
        
        
        //Register UIcolectionView Cell
        collectionView.register(PaymentListCollectionViewCell.self, forCellWithReuseIdentifier: indentifier)
        collectionView.showsVerticalScrollIndicator = false
        
        //Add UIcollectionView to Main View
        view.addSubview(collectionView)
        
        //UIcollectionView layout
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, height: 0, width: 0)
        
        getALLPaymentMethodList()
       
    }

    //MARK:---- Get all Payments method
    func getALLPaymentMethodList() {
      START_PAGE_LOADING(viewcontroller: self)
        let jsonUrlString = PAYMENT_METHOD_URL
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            if let error = err  {
                let alert = UIAlertController.alert(title: "Error", message: "\(error)")
                self.present(alert, animated: true)
                STOP_PAGE_LOADING()
                return
            }
            
            
     if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
             print("response = \(String(describing: response))")
        STOP_PAGE_LOADING()
        switch httpStatus.statusCode {
        case 300...399:
            let alert = UIAlertController.alert(title: "Message", message: "You're redirected. Please follow steps")
            self.present(alert, animated: true)
            return
        case 400...499:
            let alert = UIAlertController.alert(title: "Message", message: "invalid request, Not found, Unauthorized")
            self.present(alert, animated: true)
            return
        case 500...599:
            let alert = UIAlertController.alert(title: "Message", message: "Internal Server Error, Not found, Unauthorized")
            self.present(alert, animated: true)
            return
        default:
            
            let alert = UIAlertController.alert(title: "Message", message: "IUnknown found")
            self.present(alert, animated: true)
            return
                           }
                
                
            }

            
            guard let data = data else { return }
            do  {
                
                let paymentMethods = try JSONDecoder().decode(PaymentMethodNetworks.self, from: data)
               
                self.paymentMethodArray = paymentMethods.networks.applicable
                DispatchQueue.main.async {
                   
                    self.collectionView.reloadData()
                    STOP_PAGE_LOADING()
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
                self.callErrorPaymentMethodListHandler()
            }
            
            
        }.resume()
        
    }
    
    func callErrorPaymentMethodListHandler(){
        let alertController = UIAlertController.init(title: "˜Error", message: "Something went wrong, Please retry.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: { (action) in
                self.getALLPaymentMethodList()
        }))
        STOP_PAGE_LOADING()
        self.present(alertController, animated: true, completion: nil)
    }

    //MARK: ---- UIcollection View Delegate Manipulation
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
      }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return paymentMethodArray.count
    
   }
   

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: indentifier, for: indexPath) as? PaymentListCollectionViewCell else {fatalError("Unable to deque cell")}

    cell.paymentMethodListNameLabel.text = paymentMethodArray[indexPath.row].label
    cell.payMethodListImage.loadImage(urlstring: "\(paymentMethodArray[indexPath.row].links.logo ?? "")")
      
    return cell
  
   }
    

    
}


