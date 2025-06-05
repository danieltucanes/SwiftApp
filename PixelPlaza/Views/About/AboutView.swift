//
//  AboutView.swift
//  PixelPlaza
//
//  Created by Telematica on 29/05/25.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)

                Text("PixelPlaza")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 10)

                Text("Aplicación desarrollada como microproyecto para la asignatura de Plataformas Móviles - Universidad del Cauca.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Estudiantes:")
                        .font(.headline)
                    Text("• Juan Carlos Maquillo - Encargado de revisar la correcta implementación de la navegabilidad\n• Daniel Tucanes - Encargado de las vistas de login, home y register\n• Steven Chanchi - Encargado de las vistas store y de detail")
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Funcionalidades principales:")
                        .font(.headline)
                    Text("• Navegación entre pantallas\n• Formularios de registro e inicio de sesión\n• Tienda con productos cargados desde JSON\n• Búsqueda y filtrado\n• Visualización detallada de productos")
                }

                Text("© 2025 - Todos los derechos reservados")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.top, 20)
            }
            .padding()
        }
        .navigationTitle("Creditos")
    }
}

#Preview {
    AboutView()
}
