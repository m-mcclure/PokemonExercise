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
  }*/
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

var pokemonPen: [Pokemon]!
pokemonPen = [Pokemon]()

var pikachu = Pokemon(characterName: "Pikachu", characterHealth: 35, characterAttack: 55, characterDefense: 40)
pokemonPen.append(pikachu)

var jigglypuff = Jigglypuff(characterName: "Jigglypuff", characterHealth: 115, characterAttack: 45, characterDefense: 20)
pokemonPen.append(jigglypuff)

var wigglytuff = Jigglypuff(characterName: "Wigglytuff", characterHealth: 140, characterAttack: 70, characterDefense: 45)
pokemonPen.append(wigglytuff)

var abra = Abra(characterName: "Abra", characterHealth: 25, characterAttack: 20, characterDefense: 15)
pokemonPen.append(abra)

var kadabra = Abra(characterName: "Kadabra", characterHealth: 40, characterAttack: 35, characterDefense: 30)
pokemonPen.append(kadabra)

var alakazam = Abra(characterName: "Alakazam", characterHealth: 55, characterAttack: 50, characterDefense: 45)
pokemonPen.append(alakazam)

var tentacool = Tentacool(characterName: "Tentacool", characterHealth: 40, characterAttack: 40, characterDefense: 35)
pokemonPen.append(tentacool)

var turtwig = Turtwig(characterName: "Turtwig", characterHealth: 55, characterAttack: 68, characterDefense: 64)
pokemonPen.append(turtwig)

var grotle = Turtwig(characterName: "Grotle", characterHealth: 75, characterAttack: 89, characterDefense: 85)
pokemonPen.append(grotle)

var torterra = Torterra(characterName: "Torterra", characterHealth: 95, characterAttack: 109, characterDefense: 105)
pokemonPen.append(torterra)

pokemonPen.count

var finalMessage: String = ""

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
        pokemonPen.append(attacker)
        battleContinues = false
        finalMessage = "\(defender.name) has died. \(attacker.name) is the winner."
      }
    } else if (impact <= 0) {
      finalMessage = "\(attacker.name) has died. \(defender.name) is the winner."
      pokemonPen.append(defender)
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

//battle(grotle, jigglypuff)

var playersRemaining = UInt32(pokemonPen.count)

var rand1: Int!
var rand2: Int!

func generateTwoRandomNumbers(){
  do {
  rand1 = Int(arc4random_uniform(playersRemaining))
  rand2 = Int(arc4random_uniform(playersRemaining))
  } while (rand1 == rand2)
}

func tournament(contenderA: Pokemon, contenderB: Pokemon) {
  let pokemonA = contenderA
  let pokemonB = contenderB
  println("\(contenderA.name) will fight \(contenderB.name).")
  pokemonPen.removeAtIndex(rand1)
  pokemonPen.removeAtIndex(rand2)
  battle(pokemonA, pokemonB)
  println(finalMessage)
}

var i = 10

  generateTwoRandomNumbers()
  tournament(pokemonPen[rand1], pokemonPen[rand2])
  pokemonPen.count

/* how to create loop that will continue tournament process until one player remains?
*/
















