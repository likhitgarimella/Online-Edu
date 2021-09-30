//
//  Comments.swift
//  Online Edu
//
//  Created by Likhit Garimella on 01/10/21.
//

import Foundation
import SwiftUI
import AVKit

struct Comments: UIViewControllerRepresentable {
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<Comments>) -> CommentsViewController {
        // let vc = CommentsViewController()
        // return vc
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CommentsVC")
        return vc as! CommentsViewController
    }
    
    func updateUIViewController(_ uiViewController: CommentsViewController, context: UIViewControllerRepresentableContext<Comments>) {
        
    }
    
}

/*
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
}*/
    // #42
