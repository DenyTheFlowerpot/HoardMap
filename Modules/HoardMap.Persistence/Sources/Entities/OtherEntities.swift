//
//  OtherEntities.swift
//  HoardMap.Persistence
//
//  Created by Theodor Gheghea on 07.01.2026.
//

public enum ItemState: String, CaseIterable, Identifiable {
    case BrandNew = "Brand New"
    case Used = "Used"
    case NeedsRepair = "Needs Repair"
    case Dead = "Dead"
    case NotApplicable = "Not Applicable"
    
    public var id: String { self.rawValue }
}
