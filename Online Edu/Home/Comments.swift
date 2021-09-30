//
//  Comments.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/10/21.
//

import Foundation
import SwiftUI
import AVKit

struct Comments: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Press to dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
        .font(.title)
        .padding()
        .background(Color.black)
        .foregroundColor(Color.white)
    }
}   // #24
