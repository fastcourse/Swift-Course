
var savedata1 = UserDefaults.standard

//toLoad
let contact_us = savedata1.string(forKey: "contact_us") ?? ""

//ToSave
UserDefaults.standard.set(self.contact_us, forKey: "contact_us")

//example : https://github.com/Shashikant86/CoreDataDemo/blob/master/CoreDataDemo/ViewController.swift

//check if value exists allready
@IBAction func BtnAdd2Favorite(_ sender: UIButton) {
        if(!checkContact(userName: txt_receiver_uname.text!)){
       // AddContact()
          UserDefaults.standard.set("@Adem", forKey: "username")
        }else{
            Alert(message: "Contact exits allready")
        }
    }

//my idea
func checkContact(userName:String) -> Bool {
        var exists = false
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Contacts")
        //request.predicate = NSPredicate(format: "age = %@", "12")
                request.returnsObjectsAsFaults = false

                do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject] {
                        let un = data.value(forKey: "username") as! String
                        print("uname = \(un)")
                        if (un == userName){
                            exists = true
                            return exists
                        }
                      // print(data.value(forKey: "username") as! String)
                    }
                    
                } catch {
                    
                    print("Failed")
                }
    
    return exists
    }
