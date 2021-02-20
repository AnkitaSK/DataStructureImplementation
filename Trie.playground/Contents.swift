print("Trie")

let trie1 = Trie<String>()
trie1.insert("Cute")
print("Contains - when whole string is present (when termination node is encountered)")
print(trie1.contains("Tu"))
print(trie1.contains("Cu")) // will return false since the termination node is not called
print(trie1.contains("Cute"))

print("remove")
let trie = Trie<String>()
trie.insert("cut")
trie.insert("cute")
//print("*** before removing ***")
//assert(trie.contains("cut"))
//print("\"cut\" is in the trie")
//assert(trie.contains("cute"))
//print("\"cute\" is in the trie")

print("*** after removing ***")
trie.remove("cut")
print(trie.contains("cut"))
//assert(!trie.contains("cut"))
assert(trie.contains("cute"))
print("\"cute\" is still in the trie")

print("Prefix data")
let trieForPrefix = Trie<String>()
trieForPrefix.insert("car")
trieForPrefix.insert("card")
trieForPrefix.insert("care")
trieForPrefix.insert("cared")
trieForPrefix.insert("carbs")
trieForPrefix.insert("caraspace")
trieForPrefix.insert("cargo")

print("trie collection starts with \"car\"")
let collection = trieForPrefix.collections(startingWith: "car")
print(collection)


print("trie collection starts with \"care\"")
let collection2 = trieForPrefix.collections(startingWith: "care")
print(collection2)
