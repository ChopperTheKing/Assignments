//
//  MyCollectionViewCell.swift
//  Mars
//
//  Created by Ronnie Kissos on 8/26/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func configure(with image: UIImage) {
        
        imageView.image = image
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    func configure(with image: UIImage, isRobot: Bool) {
        // Configure the cell with the provided image
        
        if isRobot {
            // Update the cell's appearance to indicate the robot's presence
            self.backgroundColor = UIColor.blue // For example, set a blue background color
        } else {
            // Reset the cell's appearance to the default state
            self.backgroundColor = UIColor.white // Set to your default background color
        }
    }
    
}
