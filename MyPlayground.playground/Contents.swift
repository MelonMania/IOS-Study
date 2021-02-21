// Define the User struct here
    struct User{
        var name : String
        var email : String?
        var followers : Int
        var isActive : Bool
        
        func logStatus(){
            if(self.isActive == true){
                print("\(name) is working hard")
            }
            else{
                print("\(name) has left earth")
            }
        }
        
        init(name : String, email : String, followers : Int, isActive : Bool){
            self.name = name
            self.email = email
            self.followers = followers
            self.isActive = isActive
        }
    
    }

    // Initialise a User struct here




    // Diagnostic code - do not change this code
    print("\nDiagnostic code (i.e., Challenge Hint):")
    var musk = User(name: "Elon", email: "elon@tesla.com", followers: 2001, isActive: true)
    musk.logStatus()
    print("Contacting \(musk.name) on \(musk.email!) ...")
    print("\(musk.name) has \(musk.followers) followers")
    // sometime later
    musk.isActive = false
    musk.logStatus()
    
