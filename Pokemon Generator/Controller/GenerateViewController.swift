//
//  GenerateViewController.swift
//  Pokemon Generator
//
//  Created by Medet Dönmez on 5.09.2022.
//

import UIKit

class GenerateViewController: UIViewController {
    @IBOutlet weak var elementPicker: UIPickerView!
    @IBOutlet weak var nicknameTextField: UITextField!
    
    //Creating base variables
    let pokemonManager = PokemonManager()
    var element = ""
    var image = #imageLiteral(resourceName: "Background")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //To manage our element picker and nicknameText we call their delegate as self.
        elementPicker.dataSource = self
        elementPicker.delegate = self
        nicknameTextField.delegate = self
        
    }
    
    @IBAction func goPressed(_ sender: UIButton) {
        
        nicknameTextField.endEditing(true)
        self.performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome",
           
           //we connect viewcontrollers and use delegate method here
           let homeViewController = segue.destination as? MainViewController {
            homeViewController.delegate = self
        }
    }
}

//MARK: - PokemonDelegate

extension GenerateViewController: PokemonDelegateProtocol{
    
    //updates nickname by the written word to the textField
    func updateName() -> String {
        return nicknameTextField.text ?? "?????"
    }
    
    //updates pokemon Image by the chosen type.
    func updateImage() -> UIImage {
        return pokemonManager.findImage(type: element)
    }
    
}

//MARK: - UIPickerViewDelegate

//Managing our picker view here by using protocols.

extension GenerateViewController: UIPickerViewDelegate{
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pokemonManager.elementsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedElement = pokemonManager.elementsArray[row]
        
        //Setting the "element" to the selectedElement to use it to choose image.
        element = selectedElement
    }
}

extension GenerateViewController: UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pokemonManager.elementsArray.count
    }
}

//MARK: - UITextFieldDelegate

//Managing our UITextField by using protocols.

extension GenerateViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nicknameTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }
        else {
            textField.placeholder = "Write a nickname"
            return false
        }
    }
}


