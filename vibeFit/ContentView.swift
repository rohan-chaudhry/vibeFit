//
//  ContentView.swift
//  vibeFit
//
//  Created by Rohan Chaudhry on 12/1/24.
//
import SwiftUI

struct ContentView: View {
    @State private var temperatureFahrenheit: Double = 70.0  // Hardcoded temperature
    @State private var weatherCondition: String = "Clear"     // Hardcoded weather condition
    @State private var selectedVibe: Vibe = .casual           // Default vibe is set to casual
    @State private var vibeOptions: [Vibe] = [.casual, .business, .sporty, .party, .chill] // List of available vibes
    
    // A list of possible vibes excluding "Surprise Me"
    private let allVibes: [Vibe] = [.casual, .business, .sporty, .party, .chill]

    var body: some View {
        GeometryReader { geometry in
            VStack {
                // App name at the top
                Text("VibeFitApp")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 20)

                // Suggested outfit section
                VStack {
                    // Show the heading with the selected vibe
                    Text("Suggested \(selectedVibe.rawValue.capitalized) Outfit")
                        .font(.title2)
                        .padding(.top, 20)

                    // Get the outfit suggestion based on weather and vibe
                    let outfitSuggestion = OutfitSuggestion.getOutfitSuggestion(weatherCondition: weatherCondition, temperature: temperatureFahrenheit, vibe: selectedVibe)
                    Text(outfitSuggestion)
                        .font(.title3)
                        .padding()
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .padding(.bottom, 20)
                }
                .frame(maxHeight: .infinity)
                .background(Color.gray.opacity(0.1)) // Light background for bottom section

                // Spacer to separate sections
                Spacer()

                // Weather info and Vibe options at the bottom
                VStack {
                    // Display the weather info (Hardcoded 70°F and Clear weather)
                    VStack(spacing: 10) {
                        Text("Current Temperature: \(temperatureFahrenheit, specifier: "%.1f")°F")
                            .font(.title)
                        Text("Condition: \(weatherCondition)")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 10)
                    
                    // Vibe Selector (Grid with 2 rows of 3 buttons)
                    Text("Select Vibe:")
                        .font(.title2)
                        .padding(.top, 20)

                    // LazyVGrid for two rows of three buttons
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        // Vibe buttons for each vibe
                        ForEach(vibeOptions, id: \.self) { vibe in
                            Button(action: {
                                selectedVibe = vibe
                            }) {
                                Text(vibe.rawValue.capitalized)
                                    .font(.system(size: 14, weight: .medium))  // Adjust font size and weight
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity, maxHeight: 50)  // Ensure enough space
                                    .background(selectedVibe == vibe ? Color.blue : Color.gray)
                                    .cornerRadius(10)
                                    .lineLimit(1)  // Ensure no text truncation
                                    .minimumScaleFactor(0.5) // Allow for text scaling if necessary
                            }
                        }

                        // "Surprise Me" button to pick a random vibe
                        Button(action: {
                            selectRandomVibe()
                        }) {
                            Text("Surprise")
                                .font(.system(size: 14, weight: .medium))  // Adjust font size and weight
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .background(Color.purple)
                                .cornerRadius(10)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    .padding(.horizontal, 10)
                    Spacer()
                }
            }
            .padding(geometry.size.width * 0.1) // Add 10% padding around the entire screen
            .background(Color.white) // Background color for the entire screen
            .edgesIgnoringSafeArea(.all) // Ensure content spans edge-to-edge
        }
    }

    // Function to select a random vibe from the predefined vibes
    private func selectRandomVibe() {
        // Pick a random vibe from the available options
        let randomVibe = allVibes.randomElement() ?? .casual
        selectedVibe = randomVibe
    }
}
