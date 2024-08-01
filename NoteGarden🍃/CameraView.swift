//
//  CameraView.swift
//  NoteGarden🍃
//
//  Created by Scholar on 7/31/24.
//

import SwiftUI

struct CameraView: View {
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @State var selectedImage: UIImage?
    @State var isImagePickerShowing = false
    @StateObject private var vm = ViewModel()
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        ZStack{
            Color.cream
                .ignoresSafeArea()
            
            VStack(spacing:-55.0){
                
                
                Image(uiImage: selectedImage ?? UIImage(named: "camera2")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width:350.0, height:260.0)
                    .padding(.top, 250)
                
                HStack(spacing: 50) {
                    Button {
                        self.sourceType = .photoLibrary
                        isImagePickerShowing = true
                    } label: {
                        Image("button1")
                            .resizable()
                            .padding(.top, 20.0)
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                    
                    Button(action: {
                        self.sourceType = .camera
                        isImagePickerShowing = true
                    }) {
                        Image("button2")
                        
                            .resizable()
                            .padding(.top, 20.0)
                            .scaledToFit()
                            .frame(width: 140, height: 140) // Adjust the size as needed
                        
                    }
                }
                
                
                
                ZStack{
                    Image("paper")
                    
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        
                        .frame(width:550, height:600)
                    VStack(spacing:-20){
                        Text("\(vm.time)")
                            .font(.system(size: 70, weight: .thin, design: .rounded))
                            .alert("Timer done!", isPresented: $vm.showingAlert) {
                                Button("Continue", role: .cancel) {
                                    // Code
                                }
                            }
                            .padding()
                            .frame(width: width)
                        
                            .cornerRadius(20)
                        
                        
                        Slider(value: $vm.minutes, in: 1...20, step: 1)
                            .padding()
                            .disabled(vm.isActive)
                            .animation(.easeInOut, value: vm.minutes)
                            .frame(width: width)
                        
                        HStack(spacing:50) {
                            Button("Start") {
                                
                                vm.start(minutes: vm.minutes)
                                   
                                    
                            }
                            .disabled(vm.isActive)
                            
                            Button("Reset", action: vm.reset)
                                .tint(.black)
                        }
                        .padding(35)
                        .frame(width: width)
                    }
                   
                    
                    
                    .sheet(isPresented: $isImagePickerShowing) {
                        ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
                    }
                    
                    .onReceive(timer) { _ in
                        vm.updateCountdown()
                    }
                    
                }
            }
            .frame(height: 0.0)
        }
            

    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

