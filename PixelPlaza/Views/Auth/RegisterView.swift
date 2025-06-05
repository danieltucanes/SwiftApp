//
//  RegisterView.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var nombre: String = ""
        @State private var correo: String = ""
        @State private var password: String = ""
        @State private var confirmPassword: String = ""
        @State private var navigateToSignUp = false
        @Environment(\.colorScheme) var colorScheme

        var body: some View {
            NavigationStack {
                ZStack {
                    (colorScheme == .dark ? Color(.systemBackground) : Color(.systemBackground))
                        .ignoresSafeArea()

                    VStack(spacing: 20) {
                        Spacer()
                        
                        Image("user")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 110, height: 110)

                        Text("Llena el siguiente formulario con tus datos personales. Crea una contraseña y registra una cuenta de correo electrónico")
                            .font(.body)
                            .foregroundColor(Color.primary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 16)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true) // <- CLAVE

                        Spacer()


                        CustomTextField2(label: "Nombre completo", text: $nombre)
                        CustomTextField2(label: "Correo", text: $correo, keyboardType: .emailAddress)
                        CustomTextField2(label: "Contraseña", text: $password, isSecure: true)
                        CustomTextField2(label: "Confirmar contraseña", text: $confirmPassword, isSecure: true)

                        Spacer()

                        NavigationLink(destination: LoginView(), isActive: $navigateToSignUp) {
                            Button("Registrarme") {
                                navigateToSignUp = true
                            }
                            .buttonStyle(SecondaryButtonStyle())
                        }
                        Spacer()
                    }
                    .padding(20)
                }
            }
        }
}


struct CustomTextField2: View {
    let label: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.secondary)

            if isSecure {
                SecureField(label, text: $text)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
                    .keyboardType(keyboardType)
            } else {
                TextField(label, text: $text)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
                    .keyboardType(keyboardType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    RegisterView()
}