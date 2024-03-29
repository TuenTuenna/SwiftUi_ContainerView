//
//  ContentView.swift
//  ContainerTutorial
//
//  Created by Jeff Jeong on 2022/07/22.
//

import SwiftUI

/// 헤더 컨테이너
///
/// 컨테이너 뷰이다
///
/// When they eat food, a sloth's `energyLevel` increases by the food's `energy`.
struct HeaderContainer<Content: View> : View {
    let content : Content
    
    let title : String
    
    let bgColor : Color
    
    /// Description
    /// - Parameters:
    ///   - headerTitle: headerTitle description
    ///   - bgColor: bgColor description
    ///   - content: content description
    init(
        headerTitle : String = "헤더입니다",
        bgColor : Color = Color.gray,
        @ViewBuilder content : () -> Content
    ){
        self.title = headerTitle
        self.bgColor = bgColor
        self.content = content()
    }
    
    
    var body : some View {
        VStack() {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(bgColor.opacity(0.4))
                .frame(height: 120)
                .overlay(content: { Text(title) })
            
            self.content
            
        }.padding()
    }
    
}


struct ContentView: View {
    var body: some View {
        
        
//        HeaderContainer(content: {
//            Text("본문")
//                .padding()
//        })
    
        HeaderContainer(
            headerTitle : "오늘도 빡코딩!",
            bgColor: Color.yellow){
            Text("본문")
                .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
