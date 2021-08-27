//
//  Reusable.swift
//  EfPlayer
//
//  Created by user on 26.08.2021.
//

import Foundation
import UIKit

protocol ReusableProtocol {}

extension ReusableProtocol {
    static var identifier: String {
        String(describing: self)
    }
    
    static var nib: UINib {
        UINib(nibName: self.identifier, bundle: Bundle.main)
    }
}
extension UIView: ReusableProtocol {}
extension UIViewController: ReusableProtocol {}
