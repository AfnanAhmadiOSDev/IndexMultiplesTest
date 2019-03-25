//
//  ViewController.swift
//  MultiplesTest
//
//  Created by prince on 3/25/19.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        setupViews()
    }
    
    
    
    //MARK: properties
    let myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        
        let colv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colv.translatesAutoresizingMaskIntoConstraints = false
        colv.backgroundColor = .none
        
        return colv
    }()
    
    
    
    
    //MARK: setup methods
    func setupViews(){
        setupCollectionView()
    }
    
    func setupCollectionView() {
        addCollectionView()
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(Cell1.self, forCellWithReuseIdentifier: "Cell1id")
        myCollectionView.register(Cell2.self, forCellWithReuseIdentifier: "Cell2id")
        
        myCollectionView.bounces = false
        myCollectionView.showsVerticalScrollIndicator = false
        myCollectionView.showsHorizontalScrollIndicator = false
    }
    
    func addCollectionView(){
        view.addSubview(myCollectionView)
        
        myCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        
        myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    
    
    //MARK: collection view methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }//end numberOfItemsInSection
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.item % 3 == 0){//multiples of 3
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell1id", for: indexPath) as! Cell1
            cell.backgroundColor = .white
            
            if(cell.wasCreated){
                cell.cellLabel.text = "Cell(1) \(indexPath.item) was created before."
            }
            else{
                cell.cellLabel.text = "Creating cell(1) \(indexPath.item) first time."
                cell.wasCreated = true
            }
            
            return cell
        }
        else{
            let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "Cell2id", for: indexPath) as! Cell2
            cell.backgroundColor = .gray
            
            if(cell.wasCreated){
                cell.cellLabel.text = "Cell(2) \(indexPath.item) was created before."
            }
            else{
                cell.cellLabel.text = "Creating cell(2) \(indexPath.item) first time."
                cell.wasCreated = true
            }
            
            return cell
        }
    }//end cellForItemAt
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 200)
    }//end method
    
    
    
    
    
    

}//end class













class Cell1: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: cell properties
    var wasCreated: Bool = false
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some Text"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    
    
    
    //MARK: cell setup methods
    func setupCellViews(){
        self.addSubview(cellLabel)
        
        cellLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}//end class













class Cell2: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCellViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    //MARK: cell properties
    var wasCreated: Bool = false
    
    let cellLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some Text"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        
        return label
    }()
    
    
    
    
    //MARK: cell setup methods
    func setupCellViews(){
        self.addSubview(cellLabel)
        
        cellLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}//end class



























