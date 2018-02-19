1. Create new entity

        let student = Student(json: ["name" : "Anand"])
        student?.save()

2. Fetch entity

        let allEmployeees = Employee.get(withPredicate: nil)

3. Delete entity

        Employee.delete(withPredicate: nil)
