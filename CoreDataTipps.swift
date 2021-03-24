
var savedata1 = UserDefaults.standard

//toLoad
let contact_us = savedata1.string(forKey: "contact_us") ?? ""


//ToSave
UserDefaults.standard.set(self.contact_us, forKey: "contact_us")
// or use this func to add value
AddCompanyAsContact()


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

//add value to core data
func AddCompanyAsContact() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Contacts", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)

        newUser.setValue("0" , forKey: "id") // dont have
        newUser.setValue(group_x , forKey: "username")
        newUser.setValue("Group" , forKey: "fullname")
        
        newUser.setValue("0_.png" , forKey: "img")
        newUser.setValue(NSDate() as Date , forKey: "date")
        
        do {
            try context.save()
            print("seccessfuly saved -----")
        } catch {
            print("Failed saving xxxxxx")
        }
        
    }
