//
//  File.swift
//  
//
//  Created by Oliver Binns on 14/10/2021.
//
import Foundation

extension Array where Element: Equatable {
    func removingDuplicates() -> [Element] {
        reduce(into: [Element]()) { array, element in
            if !array.contains(element) {
                array.append(element)
            }
        }
    }
}

extension Array {
    func sorted<T: Comparable>(on keyPath: KeyPath<Element, T>) -> Self {
        sorted { lhs, rhs in
            lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
}
