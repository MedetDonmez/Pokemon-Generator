//
//  PokemonManager.swift
//  Pokemon Generator
//
//  Created by Medet Dönmez on 5.09.2022.
//

import Foundation
import UIKit

//Creating our protocol to use delegate method.
protocol PokemonDelegateProtocol {
    func updateName() -> String
    func updateImage() -> UIImage
}

//Pokemon manager struct that choose our pokemon by the chosen type.
struct PokemonManager {
    
    //element arrays that have pokemon images which are belong them.
    let elementsArray = ["water","fire","grass","electric","psychic","poison"]
    let fire = [#imageLiteral(resourceName: "Fire-5"), #imageLiteral(resourceName: "Fire-2"), #imageLiteral(resourceName: "Fire-3"), #imageLiteral(resourceName: "Fire-1"), #imageLiteral(resourceName: "Fire-4"), #imageLiteral(resourceName: "Fire-6")]
    let water = [#imageLiteral(resourceName: "water-2"), #imageLiteral(resourceName: "water-3"), #imageLiteral(resourceName: "water-1"), #imageLiteral(resourceName: "water-6"), #imageLiteral(resourceName: "water-5"), #imageLiteral(resourceName: "water-4")]
    let grass = [#imageLiteral(resourceName: "grass-5"), #imageLiteral(resourceName: "grass-2"), #imageLiteral(resourceName: "grass-3"), #imageLiteral(resourceName: "grass-4"), #imageLiteral(resourceName: "grass-1"), #imageLiteral(resourceName: "grass-6")]
    let electric = [#imageLiteral(resourceName: "electric-3"), #imageLiteral(resourceName: "electric-5"), #imageLiteral(resourceName: "electric-4"), #imageLiteral(resourceName: "electric-1"), #imageLiteral(resourceName: "electric-6"), #imageLiteral(resourceName: "electric-2")]
    let psychic = [#imageLiteral(resourceName: "psychic-1"), #imageLiteral(resourceName: "psychic-2"), #imageLiteral(resourceName: "psychic-3"), #imageLiteral(resourceName: "psychic-6"), #imageLiteral(resourceName: "psychic-5"), #imageLiteral(resourceName: "psychic-4")]
    let poison = [#imageLiteral(resourceName: "poison-6"), #imageLiteral(resourceName: "poison-3"), #imageLiteral(resourceName: "poison-5"), #imageLiteral(resourceName: "poison-4"), #imageLiteral(resourceName: "poison-2"), #imageLiteral(resourceName: "poison-1")]
    
    // Generating random number to have random pokemon.
    let PokemonNumber = Int.random(in: 0...5)
    
    //Function to find image of pokemon by the given pokemon type and number.
    func findImage(type: String) -> UIImage{
        
        var generatedPokemon = #imageLiteral(resourceName: "poison-3")
        switch type {
        case "water":
            generatedPokemon = water[PokemonNumber]
        case "fire":
            generatedPokemon = fire[PokemonNumber]
        case "grass":
            generatedPokemon = grass[PokemonNumber]
        case "electric":
            generatedPokemon = electric[PokemonNumber]
        case "psychic":
            generatedPokemon = psychic[PokemonNumber]
        case "poison":
            generatedPokemon = poison[PokemonNumber]
        default:
            generatedPokemon = water[PokemonNumber]
            
        }
        //returns pokemon image as UIImage type.
        return generatedPokemon
    }
    
}
