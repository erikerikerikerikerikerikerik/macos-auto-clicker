//
//  AppearanceSettingsTabView.swift
//  auto-clicker
//
//  Created by Ben Tindall on 30/03/2022.
//

import SwiftUI
import Defaults

struct AppearanceSettingsTabView: View {
    @Default(.appearanceSelectedTheme) private var activeTheme

    var body: some View {
        Form {
            LazyVGrid(columns: [.init(.adaptive(minimum: 70, maximum: 70))], spacing: 2) {
                ForEach(Colour.allCases) { colour in
                    Button(action: {
                        self.activeTheme.currentColour = colour
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(colour.normalised)
                                .frame(width: 45, height: 45)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(colour.normalised.darker, lineWidth: 4)
                                )

                            if colour == self.activeTheme.currentColour {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 24))
                            }
                        }
                        .padding(.bottom, 15)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 15)
        }
    }
}

struct AppearanceSettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceSettingsTabView()
    }
}
