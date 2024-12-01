//
//  OutfitSuggestion.swift
//  vibeFit
//
//  Created by Rohan Chaudhry on 12/1/24.
//  This suggests the outfit based on weather and user's vibe input 

import Foundation

// Possible vibes
enum Vibe: String {
    case casual = "Casual"
    case business = "Business"
    case sporty = "Sporty"
    case party = "Party"
    case chill = "Chill"
}

struct OutfitSuggestion {
    
    // Suggests an outfit based on weather and vibe
    static func getOutfitSuggestion(weatherCondition: String, temperature: Double, vibe: Vibe) -> String {
        var outfit = ""
        
        // Weather-based outfit
        if weatherCondition == "Clear" {
            if temperature > 20 {
                outfit += "Light T-shirt, Shorts, Sneakers"
            } else {
                outfit += "Long Sleeve Shirt, Jeans, Boots"
            }
        } else if weatherCondition == "Rain" {
            outfit += "Raincoat, Waterproof Boots, Umbrella"
        } else if weatherCondition == "Cloudy" {
            outfit += "Sweater, Jacket, Jeans"
        }

        // Adjust based on the vibe
        switch vibe {
        case .casual:
            outfit += " - Casual Style"
        case .business:
            outfit += " - Smart Casual Style"
        case .sporty:
            outfit += " - Sporty & Comfortable"
        case .party:
            outfit += " - Party Ready!"
        case .chill:
            outfit += " - Relaxed Vibes"
        }
        
        return "Suggested Outfit: \(outfit)"
    }
}

