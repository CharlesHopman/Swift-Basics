//
//  ViewController.swift
//  xib_ViewController_example
//
//  Created by Charles Hopman on 9/25/20.
//  Copyright © 2020 Charles Hopman. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let MyCollectionViewCellId: String = "CollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
    }


}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! CollectionViewCell
        cell.xibLabel.text = "xib label changed \(indexPath.row)"
        return cell
    }
}
