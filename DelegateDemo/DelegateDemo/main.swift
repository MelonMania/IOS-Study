protocol AdvancedLifeSupport{ // UITextFieldDelgate 역할
    func performCPR()
}

class EmergencyCallHandler{. // UITextField 역할
    var delegate : AdvancedLifeSupport?
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
    
}


struct Medic : AdvancedLifeSupport{ // 이거포함 밑에 있는 클래스들은 ViewController 역할
    
    init(handler : EmergencyCallHandler) { // handler와 연결하여 내가 delegate라는걸 명시 >> 핸들러 근무자와 연결하는 근무자가 나다 이런 의미
        handler.delegate = self
    }
    
    func performCPR() {
        print("Okay i will go there")
    }
}

class Doctor: AdvancedLifeSupport {
    init(handler : EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("to do CPR")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("we are Surgeon")
    }
}

let Emilio = EmergencyCallHandler()
let wj = Surgeon(handler: Emilio)

Emilio.medicalEmergency()
