//
//  VibeView.swift
//  vibeFit
//
//  Created by Rohan Chaudhry on 12/1/24.
//

import SwiftUI

struct VibeView: View {
    @Binding var selectedVibe: Vibe
    
    var body: some View {
        List {
            ForEach([Vibe.casual, .business, .sporty, .party, .chill], id: \.self) { vibe in
                Button(action: {
                    selectedVibe = vibe
                }) {
                    Text(vibe.rawValue)
                        .padding()
                        .foregroundColor(.blue)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .navigationTitle("Select Your Vibe")
    }
}

