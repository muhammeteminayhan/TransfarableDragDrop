//
//  Extensions.swift
//  TransfarableDragDrop
//
//  Created by Muhammet Emin Ayhan on 7.10.2024.
//

import SwiftUI
import UniformTypeIdentifiers

extension Task: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .task)
    }
}

extension UTType {
    static var task: UTType {
        UTType(exportedAs: "com.swiftuicodes.transferable")
    }
}
