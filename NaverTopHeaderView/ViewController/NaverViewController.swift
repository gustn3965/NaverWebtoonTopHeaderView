//
//  NavigationBarScrollViewController.swift
//  Widget14Temp
//
//  Created by hyunsu on 2020/10/25.
//

import UIKit 
class NaverViewController : UIViewController {
    
    var collectionView : UICollectionView!
    let headerView = HeaderView(image: "naver")
    var headerHeightConstraint : NSLayoutConstraint?
    var heightWithSafeArea : CGFloat = 0
    var navigationHeight : CGFloat = 0
    var navigationHeightWithStatusBarHeight : CGFloat = 0
    
    
    var navBarHeightConstraint : NSLayoutConstraint?
    
    var flowLayout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionHeadersPinToVisibleBounds = true
        return layout
    }()
    
    var sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    private let reuseIdentifier = "FlickerCell2"
    private let itemsPerRow : CGFloat = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setHeightWitheSafeArea()
        setNavigationBar()
        setUpHeaderView()
        setUpCollectionView()
        self.view.bringSubviewToFront(headerView)
    }
    
    func setHeightWitheSafeArea() {
        heightWithSafeArea =  200
    }
    
    func setNavigationBar() {
        self.navigationController?.additionalSafeAreaInsets = UIEdgeInsets(top:-navigationHeightWithStatusBarHeight , left: 0, bottom: 0, right: 0   )
        self.view.layoutIfNeeded()
        
        let search = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
        let text = UIBarButtonItem(image: UIImage(systemName: "text.justify"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [text,search]
        self.navigationController?.navigationBar.tintColor = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        
    
        
        navigationHeight = self.navigationController!.navigationBar.frame.height
        let statusbarHeight = UIApplication.shared.statusBarFrame.height
        navigationHeightWithStatusBarHeight = navigationHeight + statusbarHeight

        navigationItem.title = "네이버웹툰"
        
    }
  
    func setUpHeaderView() {
        self.view.addSubview(headerView)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerHeightConstraint =  headerView.heightAnchor.constraint(equalToConstant: heightWithSafeArea)
        headerHeightConstraint?.isActive = true
        NSLayoutConstraint.activate(
            [headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
             headerView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
             headerView.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
    }
    
    func setUpCollectionView() {
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ScrollViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 88),
             collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
             collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
             collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor)])
        let inset = UIEdgeInsets(top: heightWithSafeArea  , left: 0, bottom: 0, right: 0)
        collectionView.contentInset = inset
    }
    
    
}

extension NaverViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //2
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    //3
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        //1
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! ScrollViewCell
        //2
        cell.backgroundColor = .clear
        //3
        
        cell.imageView.image = UIImage(named: "image1")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch  kind {
        case UICollectionView.elementKindSectionHeader :
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
            
            header.backgroundColor = UIColor(red: 0.46, green: 0.47, blue: 0.91, alpha: 1.00)
            return header
        default :
            assert(false, "No" )
        }
    }
    
    
}

extension NaverViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    
}

extension NaverViewController  {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard scrollView.contentOffset.y < 0 else {
            //가장 상단으로 스크롤됐을떄,
            collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0 )
            if headerHeightConstraint!.constant > 0 {
                headerHeightConstraint!.constant = 0
                changeNavigationBarHeight(height: 0)
                self.headerView.alpha = 0
            }
            return
        }
        
        guard scrollView.contentOffset.y <= -(heightWithSafeArea) else {
            // 상단으로 스크롤할 수 있을때,
            
            let insetTop = abs(scrollView.contentOffset.y)
            let nav = -navigationHeightWithStatusBarHeight + (heightWithSafeArea - insetTop )/2
            
            collectionView.contentInset = UIEdgeInsets(top: insetTop , left: 0, bottom: 0, right: 0 )
            headerHeightConstraint!.constant = insetTop + navigationHeightWithStatusBarHeight
            self.headerView.alpha = insetTop  / heightWithSafeArea + 0.2

            self.view.layoutIfNeeded()
            changeNavigationBarHeight(height : nav )
            return
        }
        
        // 가장 밑에있을때,
        let insetTop = abs(scrollView.contentOffset.y)
        headerHeightConstraint!.constant = insetTop + navigationHeightWithStatusBarHeight
        changeNavigationBarHeight(height: -navigationHeightWithStatusBarHeight)
        
        
        
    }
    
    func changeNavigationBarHeight(height : CGFloat ) {
        self.navigationController?.additionalSafeAreaInsets = UIEdgeInsets(top: min(0,height), left: 0, bottom: 0, right: 0   )
    }
}




