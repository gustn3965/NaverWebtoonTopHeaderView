//
//  HeaderView.swift
//  DaumTopHeaderView
//
//  Created by hyunsu on 2020/10/27.
//

import UIKit

class HeaderView : UIView  {
    let image = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage("image1")
    }
    init(image : String ) {
        super.init(frame: .zero)
        setImage(image)
    }
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        setImage("image1")
    }
    func setImage(_ imageNamed : String ) {
        image.image = UIImage(named: imageNamed)
        self.addSubview(image)
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [image.topAnchor.constraint(equalTo: self.topAnchor),
             image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
             image.leftAnchor.constraint(equalTo: self.leftAnchor),
             image.rightAnchor.constraint(equalTo: self.rightAnchor)])
    }
}
