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
    @IBOutlet weak var myTableView: UITableView!
    
    
    let MyCollectionViewCellId: String = "CollectionViewCell"
    
    var location = [country]()
    
    var urlString = "https://www.metaweather.com/api/location/search/?query=san"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        DispatchQueue.global().async {
            print(Thread.current)
            self.fetchData()
        }
        
        //MARK: Register NIB
        let nibCell = UINib(nibName: MyCollectionViewCellId, bundle: nil)
        myCollectionView.register(nibCell, forCellWithReuseIdentifier: MyCollectionViewCellId)
        
        let nibCell2 = UINib(nibName: "CollectionViewCell2", bundle: nil)
        myCollectionView.register(nibCell2, forCellWithReuseIdentifier: "CollectionViewCell2")
        
        let nibCellTbl = UINib(nibName: "TableViewCell", bundle: nil)
        myTableView.register(nibCellTbl, forCellReuseIdentifier: "TableViewCell")
    }
    
    //MARK: Fetch the data from API
    func fetchData(){
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, res, error) in
            let decoder = JSONDecoder();
            do {
                self.location = []
                self.location = try decoder.decode([country].self, from: data!)
                print(self.location)
                DispatchQueue.main.async {
                    self.myCollectionView?.reloadData()
                    self.myTableView?.reloadData()
                }
            } catch {
                print(error)

            }
            }.resume()
    }
}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate {
    
    
    //MARK: Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(">",self.location.count)
        return self.location.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row%2 == 0){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCellId, for: indexPath) as! CollectionViewCell
            cell.xibLabel.text = self.location[indexPath.row].title
            return cell
        }
        else{
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell2", for: indexPath) as! CollectionViewCell2
            cell2.xibLabel.text = self.location[indexPath.row].title
            return cell2
        }
    }
    
    //MARK: Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(">>>",self.location.count)
        return self.location.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.xibLabel.text = location[indexPath.row].title
        return cell
    }
    
    //MARK: Collection Cell UI
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: UIScreen.main.bounds.width, height: 100)
        print(">>>>>>", UIScreen.main.bounds.width,">>>>>>", size)
        return size
    }
   
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1000.0
    }

    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let loc = location[indexPath.row]
        print("\(indexPath.row) - \(loc.title)")
    }
}
