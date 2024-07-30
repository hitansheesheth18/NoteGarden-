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
        VStack{
          
            
            Image("file")
             
               
            
            Text("Note Garden")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
          
            
    
            Text("FOR SHARING   THOUGHTS AND   INCREASING PRODUCTIVITY")
                .font(.largeTitle)
                .fontWeight(.thin)
            HStack(spacing:10){
            Text("      Name:")
                    .font(.title)
                    .fontWeight(.thin)
                    
                TextField("", text: $name)
                    .font(.title)
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

           
        
        }
        
    }
}

#Preview {
    ContentView()
}
