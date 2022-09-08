//
//  ViewController.swift
//  Pokemon Generator
//
//  Created by Medet Dönmez on 5.09.2022.
//

import UIKit


class MainViewController: UIViewController{
    
    var delegate:PokemonDelegateProtocol?
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nicknameText: UILabel!
    
    override func viewDidLoad() {
        
        //we call the function updater() here to update image and nickname at every load.
        updater()
        super.viewDidLoad()
    }
    
    //updater function that updates image of pokemon and nickname.
    func updater(){
        nicknameText.text = delegate?.updateName() ?? "???????????"
        pokemonImage.image = delegate?.updateImage()
    }
    
    //Segue section to connect our viewControllers.
    @IBAction func generatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGenerate", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGenerate"{
        }
    }
}



