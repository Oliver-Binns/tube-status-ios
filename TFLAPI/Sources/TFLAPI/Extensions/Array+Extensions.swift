//
//  File.swift
//  
//
//  Created by Laptop 3 on 14/10/2021.
//
import Foundation

extension Array where Element: Identifiable {
    func removingDuplicates() -> [Element] {
        reduce(into: [Element.ID: Element]()) { dictionary, element in
            dictionary[element.id] = element
        }.values.map { $0 as Element }
    }
}

extension Array {
    func sorted<T: Comparable>(on keyPath: KeyPath<Element, T>) -> Self {
        sorted { lhs, rhs in
            lhs[keyPath: keyPath] < rhs[keyPath: keyPath]
        }
    }
}
