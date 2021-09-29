//
//  PlayerScrollView.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/09/21.
//

import Foundation
import SwiftUI

struct PlayerScrollView: UIViewRepresentable {
    
    func makeCoordinator() -> Coordinator {
        return PlayerScrollView.Coordinator(view: self)
    }
    
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
        view.delegate = context.coordinator
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        uiView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        
        for i in 0..<uiView.subviews.count {
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * CGFloat(data.count))
        }
        
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        
        var view: PlayerScrollView
        
        init(view: PlayerScrollView) {
            self.view = view
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let index = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            print(index)
        }
        
    }
    
}   // #64
