//
//  ContentView.swift
//  Resizable Header
//
//  Created by Kavsoft on 21/03/20.
//  Copyright © 2020 Kavsoft. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var index = 0
    @State var show = false
    
    var body : some View{
        
        VStack(spacing: 0){
            
            appBar(index: self.$index,show: self.$show)
            
            ZStack{
                
                Chats(show: self.$show).opacity(self.index == 0 ? 1 : 0)
                
                Status().opacity(self.index == 1 ? 1 : 0)
                
                Calls().opacity(self.index == 2 ? 1 : 0)
            }

            
        }.edgesIgnoringSafeArea(.top)
    }
}

struct appBar : View {
    
    @Binding var index : Int
    @Binding var show : Bool
    
    var body : some View{
        
        VStack(spacing: 25){
            
            if self.show{
                
                HStack{
                    
                    Text("WhatsApp")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("menu")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.white)
                        
                    }.padding(.leading)
                }
            }
            
            HStack{
                
                Button(action: {
                    
                    self.index = 0
                    
                }) {
                    
                    VStack{
                        
                        Text("Chats")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 0 ? .bold : .none)
                        
                        Capsule().fill(self.index == 0 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 1
                    
                }) {
                    
                    VStack{
                        
                        Text("Status")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 1 ? .bold : .none)
                        
                        Capsule().fill(self.index == 1 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
                Button(action: {
                    
                    self.index = 2
                    
                }) {
                    
                    VStack{
                        
                        Text("Calls")
                            .foregroundColor(.white)
                            .fontWeight(self.index == 2 ? .bold : .none)
                        
                        Capsule().fill(self.index == 2 ? Color.white : Color.clear)
                        .frame(height: 4)
                    }
                }
                
            }.padding(.bottom, 10)
            
            
        }.padding(.horizontal)
        .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
        .background(Color("Color"))
    }
}

struct Chats : View {
    
    @Binding var show : Bool
    
    var body : some View{
        
        List(0...25,id: \.self){i in
            
            if i == 0{
                
                CellView()
                .onAppear {
                       
                    withAnimation {
                        
                        self.show = true
                    }
                    
                }
                .onDisappear {
                    
                    withAnimation {
                        
                        self.show = false
                    }
                }
            }
            else{
                
               CellView()
            }
            
        }
    }
}

struct CellView : View {
    
    var body : some View{
        
        HStack{
            
            Image("profile1")
            .resizable()
            .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Nesim")
                
                Text("Chat").font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}

struct Status : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Status")
            }
        }
    }
}

struct Calls : View {
    
    var body : some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Text("Calls")
            }
        }
    }
}

class Host : UIHostingController<ContentView>{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        
        return .lightContent
    }
}

