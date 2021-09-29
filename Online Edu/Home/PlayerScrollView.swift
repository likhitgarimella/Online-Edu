//
//  PlayerScrollView.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/09/21.
//

import Foundation
import SwiftUI

struct PlayerScrollView: UIViewRepresentable {
    
    @Binding var data: [Video]
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let view = UIScrollView()
        let childView = UIHostingController(rootView: PlayerView(data: self.$data))
        
        childView.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        view.addSubview(childView.view)
        
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.isPagingEnabled = true
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
    }
    
}   // #38
