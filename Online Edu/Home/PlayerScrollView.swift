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
            
            let currentIndex = Int(scrollView.contentOffset.y / UIScreen.main.bounds.height)
            var index = 0
            
            if currentIndex != index {
                
                index = currentIndex
                for i in 0..<view.data.count {
                    view.data[i].player.seek(to: .zero)
                    view.data[i].player.play()
                }
                view.data[index].player.play()
                view.data[index].player.actionAtItemEnd = .none
                
                NotificationCenter.default.addObserver(forName: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: view.data[index].player.currentItem, queue: .main) { _ in
                    self.view.data[index].replay = true
                }
                
            }
            
        }
        
    }
    
}   // #82
