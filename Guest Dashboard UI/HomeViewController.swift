//
//  HomeViewController.swift
//  Guest Dashboard UI
//
//  Created by BS-125 on 3/11/21.
//

import UIKit

class HomeViewController: UIViewController {

   
    
    @IBOutlet weak var slideCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    

    let arr = ["demo","demo","demo","demo","demo" ]
    
    var timer = Timer()
    var counter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
     
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        
       // slideCollectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        pageControl.numberOfPages = arr.count
        pageControl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        }
        /*let vc = self.storyboard?.instantiateViewController(identifier:"setLanguageViewController") as! setLanguageViewController
        self.navigationController?.pushViewController(vc, animated: true)*/
       
        
    
    }
    
    override func viewDidAppear(_ animated: Bool) {

      super.viewDidAppear(animated)

    
      
      DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {

          //If your first viewController is in Navigation stack
          if let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setLanguageViewController") as? setLanguageViewController {

              if let navigator = self.navigationController {

                  navigator.pushViewController(secondViewController, animated: true)
              }
            
          }

          //If your first viewController is NOT in Navigation stack
          if let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "setLanguageViewController") as? setLanguageViewController {

              self.present(secondViewController, animated: true, completion: nil)
          }
      }
   }
    
    @objc func changeImage() {
        if counter < arr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.slideCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
            pageControl.currentPage = counter
        }
        else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.slideCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl.currentPage = counter
        }
    }
    
    
    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = slideCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DataCollectionViewCell
        cell.img.image = UIImage(named: arr[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = (collectionView.frame.width - 20)
        return CGSize(width: width, height: height)
    }
   
  
}




