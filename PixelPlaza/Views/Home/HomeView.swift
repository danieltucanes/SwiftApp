//
//  HomeView.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import SwiftUI

struct HomeView: View {
    @State private var navigateToStore = false
    @State private var navigateToSignUp = false
    @State private var navigateToCredits = false

       var body: some View {
           NavigationStack {
               ZStack {
                   Image("inicio")
                       .resizable()
                       .scaledToFill()
                       .ignoresSafeArea()

                   VStack(spacing: 16) {
                       Spacer()

                       Text("PixelPlaza")
                           .font(.system(size: 32, weight: .bold))
                           .foregroundColor(.white)

                        NavigationLink(destination: AboutView(), isActive: $navigateToCredits) {
                            Button(action: {
                                navigateToCredits = true
                            }) {
                                Image("logo")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            }
                        }

                       Text("Boutique")
                           .font(.title2)
                           .foregroundColor(.white)
                           .bold()

                       Spacer()

                       HStack(spacing: 16) {
                           NavigationLink(destination: StoreView(), isActive: $navigateToStore) {
                               Button("Ingresar") {
                                   navigateToStore = true
                               }
                               .buttonStyle(PrimaryButtonStyle())
                           }

                           NavigationLink(destination: LoginView(), isActive: $navigateToSignUp) {
                               Button("Registrarme") {
                                   navigateToSignUp = true
                               }
                               .buttonStyle(SecondaryButtonStyle())
                           }
                       }
                       
                       .padding(.horizontal, 16)
                   }
                   .padding(16)
               }
           }
       }
   }
   

   struct PrimaryButtonStyle: ButtonStyle {
       func makeBody(configuration: Configuration) -> some View {
           configuration.label
               .frame(maxWidth: .infinity, minHeight: 50)
               .background(Color.accentColor)
               .foregroundColor(.white)
               .cornerRadius(8)
               .opacity(configuration.isPressed ? 0.7 : 1.0)
       }
   }

   struct SecondaryButtonStyle: ButtonStyle {
       func makeBody(configuration: Configuration) -> some View {
           configuration.label
               .frame(maxWidth: .infinity, minHeight: 50)
               .background(Color.purple)
               .foregroundColor(.white)
               .cornerRadius(8)
               .opacity(configuration.isPressed ? 0.7 : 1.0)
       }
   }



#Preview {
    
         HomeView()
             .preferredColorScheme(.dark)
     
}