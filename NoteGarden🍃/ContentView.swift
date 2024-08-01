//
//  ContentView.swift
//  NoteGarden🍃
//
//  Created by Scholar on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var age = ""
    var body: some View {
        
        VStack {
            Spacer()
            NavigationStack{
                   VStack{
                        Image("image")
                          
                           .padding()
                          
                        
                        Text("FOR SHARING   THOUGHTS AND   INCREASING PRODUCTIVITY")
                           .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .font(.largeTitle)
                            .fontWeight(.thin)
                            .padding(0.0)
                        
                        HStack(spacing:10){
                            Text("      Name:")
                                .font(.title)
                                .fontWeight(.thin)
                            
                            TextField("", text: $name)
                                .font(.title)
                                .fontWeight(.thin)
                                .border(Color.gray, width: 1)
                                .padding()
                            
                            
                        }
                        
                        HStack{
                            Text("          Age:")
                                .font(.title)
                                .fontWeight(.thin)
                            TextField("", text: $age)
                                .font(.title)
                                .fontWeight(.thin)
                                .border(Color.gray, width:1)
                                .padding()
                        }
                        
                        
                        NavigationLink(destination: CameraView()) {
                            Image("button")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .clipShape(Rectangle())
                            
                        }
                        
                       Color(.cream)
                    }
                    .background(Color.cream)
                    .edgesIgnoringSafeArea(.all)
                   
                }        
                .padding(20)
                
            
        }
        .background(Color.cream)
        
    }
    
}

#Preview {
    ContentView()
}
