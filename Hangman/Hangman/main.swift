//
//  main.swift
//  Hangman2
//
//  Created by Sam Roman on 7/15/19.
//  Copyright © 2019 Sam Roman. All rights reserved.
//
//re did project from scratch. Instead of using multiple functions with multiple for loops in each then calling on them in another function, I used one while loop with nested for and switch case loops.


import Foundation

let hangManArtStick = """
_________
|         |
|
|
|
|
|
"""
let hangManArtHead =  """
_________
|         |
|         0
|
|
|
"""
let hangManArtBody = """
_________
|         |
|         0
|         |
|
|
|
"""
let hangManArms = """
_________
|         |
|         0
|        /|\\
|
|
|
"""
let hangManLeftLeg = """
_________
|         |
|         0
|        /|\\
|          \\
|
|
"""
let hangManFullBody = """
_________
|         |
|         0
|        /|\\
|        / \\
|
|
"""

let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

var randomWord = ""
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]


print("Welcome to Hangman ! Guess the right word and the man lives....guess wrong and he dies 😱. Press ENTER to continue if you dare..." )

var userResponse1 = readLine()

//picks a random word for the round
if let random = allTheWords.randomElement() {
    randomWord = random
    
}

var randomCharacterArray = Array(randomWord)
var arrayRandomWord = [String]()
for c in randomCharacterArray {
    arrayRandomWord.append(String(c))
}


var userGuessWord = Array(repeatElement("-", count: arrayRandomWord.count))
var guessedLetters: [String] = []
var guessesLeft: Int = 6
//while loop to continue running while guesses are left
gameloop:while guessesLeft > 0 {
    print("\(guessesLeft) Guesses left!")
    
    print("please enter a letter")
    print(userGuessWord)
    
    let userGuess = readLine()
    guard let userGuessUnwrapped = userGuess else {
        break
    }
    guard userGuessUnwrapped.count == 1 else{
        
        print("One letter at a time please")
        continue gameloop
    }
    guard alphabet.contains(userGuessUnwrapped) else {
        print("That wasnt a letter, try again. His life depends on it.")
        continue gameloop
    }//if guess is wrong -
    if !arrayRandomWord.contains(userGuessUnwrapped) {
        guessedLetters.append(userGuessUnwrapped)
        print("Wrong letter...try again")
        guessesLeft -= 1
        switch guessesLeft {
            
        case 0:
            print(hangManFullBody)
        case 1:
            print(hangManLeftLeg)
        case 2:
            print(hangManArms)
        case 3:
            print(hangManArtBody)
        case 4:
            print(hangManArtHead)
        case 5:
            print(hangManArtStick)
            
        default:
            print("um")
        }
        //right guess
    } else if arrayRandomWord.contains(userGuessUnwrapped) {
        
        for i in 0...arrayRandomWord.count-1 {
            if arrayRandomWord[i] == userGuessUnwrapped {
                userGuessWord[i] = userGuessUnwrapped
                print("Correct! Keep going!")
                print(userGuessWord)
                if userGuessWord == arrayRandomWord {
                    print("He lives!!! 🎉 \(arrayRandomWord) is the right word")
                    break gameloop
                }
            }
        }
    }
    
}
if guessesLeft == 0 {
    print("You could not save the poor man 💀 ! The right word was \(randomWord)")
}


