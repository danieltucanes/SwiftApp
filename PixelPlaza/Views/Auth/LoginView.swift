//
//  LoginView.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import SwiftUI

struct LoginView: View {
    @State private var correo: String = ""
    @State private var password: String = ""
    @State private var navigateToSignIn = false
    @State private var isLoggedIn = false // Estado para controlar navegación a StoreView

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo con color de superficie
                (colorScheme == .dark ? Color(.systemBackground) : Color(.systemBackground))
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    // Logo
                    Image("logo") // Asegúrate de tener esta imagen en Assets.xcassets
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)

                    // Texto de bienvenida
                    Text("Bienvenido")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.primary)

                    Text("Inicia sesión ahora")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primary.opacity(0.8))

                    // Campos de texto
                    CustomTextField3(label: "Correo", text: $correo, isSecure: false, keyboardType: .emailAddress)
                    CustomTextField3(label: "Contraseña", text: $password, isSecure: true)

                    // Botón de inicio de sesión
                    Button(action: {
                        // Aquí podrías validar correo y contraseña
                        if !correo.isEmpty && !password.isEmpty {
                            // Simula login exitoso
                            isLoggedIn = true
                        }
                        // Agrega validaciones o alertas si deseas
                    }) {
                        Text("Iniciar sesión")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 8)

                    // Navegación oculta hacia StoreView
                    NavigationLink(destination: StoreView(), isActive: $isLoggedIn) {
                        EmptyView()
                    }
                    .hidden()

                    // Texto "Olvidé mi contraseña"
                    Text("Olvidé mi contraseña")
                        .font(.system(size: 16))
                        .foregroundColor(Color.primary.opacity(0.8))
                        .padding(.top, 8)

                    // Texto continuar con
                    Text("O continuar con")
                        .font(.system(size: 14))
                        .foregroundColor(Color.primary.opacity(0.7))
                        .padding(.top, 8)

                    // Botones sociales
                    HStack(spacing: 40) {
                        Button(action: {
                            // Login Google
                        }) {
                            Image("google_icon")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }

                        Button(action: {
                            // Login Facebook
                        }) {
                            Image("facebook_icon")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    }
                    .padding(.top, 8)

                    Spacer()

                    // Registro
                    HStack(spacing: 16) {
                        NavigationLink(destination: RegisterView(), isActive: $navigateToSignIn) {
                            Button("Registrarme") {
                                navigateToSignIn = true
                            }
                            .buttonStyle(SecondaryButtonStyle())
                        }
                    }
                }
                .padding(16)
            }
        }
    }
}

struct CustomTextField3: View {
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
    LoginView()
}
