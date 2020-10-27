//
//  Cell.swift
//  DaumTopHeaderView
//
//  Created by hyunsu on 2020/10/27.
//

import UIKit

class ScrollViewCell : UICollectionViewCell {
    
    var imageView =  UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        setUp()
    }
    func setUp(){
        self.imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
             imageView.topAnchor.constraint(equalTo: topAnchor),
             imageView.bottomAnchor.constraint(equalTo: bottomAnchor)]
        )  }
}

