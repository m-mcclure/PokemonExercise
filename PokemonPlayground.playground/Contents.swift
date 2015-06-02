//: Playground - noun: a place where people can play

import UIKit

class Pokemon {
  var name: String = "name"
  var health: Int = 0
  var attack: Int = 0
  var defense: Int = 0
  
  init (characterName: String, characterHealth: Int, characterAttack: Int, characterDefense: Int){
    self.name = characterName
    self.health = characterHealth
    self.attack = characterAttack
    self.defense = characterDefense
  }
}

class Jigglypuff : Pokemon {
  let type1 = "normal"
  let type2 = "fairy"
}

class Abra : Pokemon {
  let type1 = "psychic"
}

class Tentacool : Pokemon {
  let type1 = "water"
  let type2 = "poison"
}

class Turtwig : Pokemon {
  let type1 = "grass"
}

class Torterra : Turtwig {
  let type2 = "ground"
}

let pikachu = Pokemon(characterName: "Pikachu", characterHealth: 35, characterAttack: 55, characterDefense: 40)

let jigglypuff = Jigglypuff(characterName: "Jigglypuff", characterHealth: 115, characterAttack: 45, characterDefense: 20)

let wigglytuff = Jigglypuff(characterName: "Wigglytuff", characterHealth: 140, characterAttack: 70, characterDefense: 45)

let abra = Abra(characterName: "Abra", characterHealth: 25, characterAttack: 20, characterDefense: 15)

let kadabra = Abra(characterName: "Kadabra", characterHealth: 40, characterAttack: 35, characterDefense: 30)

let alakazam = Abra(characterName: "Alakazam", characterHealth: 55, characterAttack: 50, characterDefense: 45)

let tentacool = Tentacool(characterName: "Tentacool", characterHealth: 40, characterAttack: 40, characterDefense: 35)

let turtwig = Turtwig(characterName: "Turtwig", characterHealth: 55, characterAttack: 68, characterDefense: 64)

let grotle = Turtwig(characterName: "Grotle", characterHealth: 75, characterAttack: 89, characterDefense: 85)

let torterra = Torterra(characterName: "Torterra", characterHealth: 95, characterAttack: 109, characterDefense: 105)












