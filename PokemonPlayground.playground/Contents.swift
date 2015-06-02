//: Pokemon Battle Simulator

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
  
  /* how to automatically append to array from here?
  func appendToArray(Pokemon) {
    
  }
  */
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

var pikachu = Pokemon(characterName: "Pikachu", characterHealth: 35, characterAttack: 55, characterDefense: 40)

var jigglypuff = Jigglypuff(characterName: "Jigglypuff", characterHealth: 115, characterAttack: 45, characterDefense: 20)

var wigglytuff = Jigglypuff(characterName: "Wigglytuff", characterHealth: 140, characterAttack: 70, characterDefense: 45)

var abra = Abra(characterName: "Abra", characterHealth: 25, characterAttack: 20, characterDefense: 15)

var kadabra = Abra(characterName: "Kadabra", characterHealth: 40, characterAttack: 35, characterDefense: 30)

var alakazam = Abra(characterName: "Alakazam", characterHealth: 55, characterAttack: 50, characterDefense: 45)

var tentacool = Tentacool(characterName: "Tentacool", characterHealth: 40, characterAttack: 40, characterDefense: 35)

var turtwig = Turtwig(characterName: "Turtwig", characterHealth: 55, characterAttack: 68, characterDefense: 64)

var grotle = Turtwig(characterName: "Grotle", characterHealth: 75, characterAttack: 89, characterDefense: 85)

var torterra = Torterra(characterName: "Torterra", characterHealth: 95, characterAttack: 109, characterDefense: 105)

func battle(pokemonA: Pokemon, pokemonB: Pokemon){
  let pokemonAAttack = pokemonA.attack
  let pokemonBAttack = pokemonB.attack
  let pokemonADefense = pokemonA.defense
  let pokemonBDefense = pokemonB.defense
  var pokemonAHealth = pokemonA.health
  var pokemonBHealth = pokemonB.health
  
  let randomNum = arc4random_uniform(2)
  
  var battleContinues: Bool = true
  
  if (pokemonA.health <= 0 || pokemonB.health <= 0) {
    battleContinues = false
    if (pokemonA.health <= 0) {
      println("\(pokemonA.name) has died. \(pokemonB.name) is the winner.")
    } else if (pokemonB.health <= 0) {
      battleContinues = false
      println("\(pokemonB.name) has died. \(pokemonA.name) is the winner.")
    }
  }
  
  func attack(attacker: Pokemon, defender: Pokemon) {
    println("\(attacker.name) strikes first")
    var impact: Int = attacker.attack - defender.defense
    if (impact > 0) {
      var newDefenderHealth = defender.health - impact
      defender.health = newDefenderHealth
      if (newDefenderHealth <= 0) {
        battleContinues = false
        println("\(defender.name) has died.")
      }
    } else if (impact <= 0) {
      println("\(attacker.name) is too weak to put a dent in \(defender.name). \(attacker.name) has died.")
      battleContinues = false
    }
  }
  
  while (battleContinues) {
    if (randomNum == 0) {
      attack(pokemonA, pokemonB)
      
    } else if (randomNum == 1) {
      attack(pokemonB, pokemonA)
    }
  }
}

battle(grotle, jigglypuff)


var pokemonPen: [Pokemon] = [pikachu, jigglypuff, wigglytuff, abra, kadabra, alakazam, tentacool, turtwig, grotle, torterra]

var playersRemaining = UInt32(pokemonPen.count)

var rand1: Int!
var rand2: Int!

func generateTwoRandomNumbers(){
  do {
  rand1 = Int(arc4random_uniform(playersRemaining))
  rand2 = Int(arc4random_uniform(playersRemaining))
  } while (rand1 == rand2)
}

generateTwoRandomNumbers()



func tournament(contenderA: Pokemon, contenderB: Pokemon) {
  println("\(contenderA.name) will fight \(contenderB.name).")
  battle(contenderA, contenderB)
}

tournament(pokemonPen[rand1], pokemonPen[rand2])














