//
//  BackgroundProvidingClass.swift
//  SwiftDepInj
//
//  Created by Айбек on 17.12.2023.
//

import Foundation
import UIKit

class backgroundProvidingClass : BackgroundProviderProtocol {
    var backProp: UIColor {
        let backColors : [UIColor] = [.red, .brown, .blue, .green, .magenta, .orange]
        return backColors.randomElement()!
    }
    
    
    
}
