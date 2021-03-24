
var savedata1 = UserDefaults.standard

//toLoad
let contact_us = savedata1.string(forKey: "contact_us") ?? ""

//ToSave
UserDefaults.standard.set(self.contact_us, forKey: "contact_us")




