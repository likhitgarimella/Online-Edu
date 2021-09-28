//
//  Home.swift
//  Online Edu
//
//  Created by Likhit Garimella on 29/09/21.
//

import Foundation
import SwiftUI

struct Home: View {
    
    @State var top = 0
    
    var body: some View {
        ZStack {
            VStack {
                /// top menu
                HStack(spacing: 20) {
                    Button {
                        self.top = 0
                    } label: {
                        Text("Follow")
                            .foregroundColor(self.top == 0 ? .white : Color.white.opacity(0.5))
                            .fontWeight(self.top == 0 ? .bold : .none)
                            .padding(.vertical)
                    }
                    Button {
                        self.top = 1
                    } label: {
                        Text("For You")
                            .foregroundColor(self.top == 1 ? .white : Color.white.opacity(0.5))
                            .fontWeight(self.top == 1 ? .bold : .none)
                            .padding(.vertical)
                    }
                }
                .padding(.top, 40)
                Spacer()
                
                /// right menu
                HStack {
                    Spacer()
                    VStack(spacing: 30) {
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "person.crop.circle")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                                .foregroundColor(.white)
                        })
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "suit.heart.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("100K")
                                    .foregroundColor(.white)
                            }
                        })
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "message.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("2000")
                                    .foregroundColor(.white)
                            }
                        })
                        Button(action: {
                            
                        }, label: {
                            VStack {
                                Image(systemName: "arrowshape.turn.up.right.fill")
                                    .font(.title)
                                    .foregroundColor(.white)
                                Text("Share")
                                    .foregroundColor(.white)
                            }
                        })
                        
                    }
                    .padding(.bottom, 60)
                    .padding(.trailing)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 5)
            }
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
    
}   // #102
