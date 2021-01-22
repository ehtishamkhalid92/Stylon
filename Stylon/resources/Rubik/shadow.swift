
//
//  shadow.swift
//  Stylon
//
//  Created by Muhammad Usman on 26/05/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func shadowView() {
      self.layer.shadowOpacity = 1
      self.layer.shadowRadius = 1
      self.layer.cornerRadius = 6
        self.layer.borderWidth = 2
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
      self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    func redShadowView() {
      self.layer.shadowOpacity = 1
      self.layer.shadowRadius = 1
      self.layer.cornerRadius = 6
        self.layer.borderWidth = 2
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
      self.layer.borderColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    }
    
    func greenShadowView() {
      self.layer.shadowOpacity = 1
      self.layer.shadowRadius = 1
      self.layer.cornerRadius = 6
        self.layer.borderWidth = 2
        self.layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
      self.layer.borderColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
    }
}

extension RangeReplaceableCollection {
    @discardableResult
    mutating func removeFirst(where predicate: @escaping (Element) throws -> Bool) rethrows -> Element? {
        guard let index = try firstIndex(where: predicate) else { return nil }
        return remove(at: index)
    }
}
