//
//  StringExtension.swift
//  ContactsPro
//
//  Created by Pulkit Aggarwal on 26/12/18.
//  Copyright © 2018 Maxx. All rights reserved.
//

import Foundation

extension String
{
    func removeSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}
