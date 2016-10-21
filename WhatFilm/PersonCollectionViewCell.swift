//
//  PersonCollectionViewCell.swift
//  WhatFilm
//
//  Created by Julien Ducret on 06/10/2016.
//  Copyright © 2016 Julien Ducret. All rights reserved.
//

import UIKit

final class PersonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlet properties
    
    @IBOutlet weak var roleLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileInitialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - UICollectionViewCell life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUI()
    }
    
    fileprivate func setupUI(){
        self.roleLabel.apply(style: .bodyTinyBold)
        self.profileImageView.backgroundColor = UIColor(commonColor: .offBlack).withAlphaComponent(0.2)
        self.profileImageView.layer.cornerRadius = 40.0
        self.profileImageView.layer.masksToBounds = true
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileInitialsLabel.apply(style: .placeholder)
        self.nameLabel.apply(style: .bodyTiny)
    }
    
    // MARK: - Data handling
    
    func populate(with person: Person) {
        self.roleLabel.text = person.role
        self.profileImageView.image = nil
        if let profilePath = person.profilePath {
            self.profileImageView.setImage(fromTMDbPath: profilePath, withSize: .medium)
            self.profileInitialsLabel.text = nil
        } else {
            self.profileInitialsLabel.text = person.initials.uppercased()
        }
        self.nameLabel.text = person.name
    }
}

extension PersonCollectionViewCell: NibLoadableView { }

extension PersonCollectionViewCell: ReusableView { }