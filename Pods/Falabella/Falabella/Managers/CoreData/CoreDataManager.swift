//
//  CoreDataManager.swift
//  MVPTableTest
//
//  Created by Karine Karapetyan on 29-04-22.
//

import CoreData

public enum AuthStatus {
    case failed(_ errorMessage: String)
    case success
}

class CoreDataManager {
     static let shared = CoreDataManager()


    private lazy var persistentContainer: NSPersistentContainer? = {
       let modelURL = Bundle(for: Falabella.self).url(forResource: "UserData", withExtension: "momd")

       var container: NSPersistentContainer
       
       guard let model = modelURL.flatMap(NSManagedObjectModel.init) else {
         print("Fail to load the trigger model!")
         return nil
       }
       
       container = NSPersistentContainer(name: "UserData", managedObjectModel: model)
       container.loadPersistentStores(completionHandler: { (storeDescription, error) in
         if let error = error as NSError? {
           print("Unresolved error \(error), \(error.userInfo)")
         }
       })
       
       return container
     }()
     
     private var managedObjectContext: NSManagedObjectContext?
     
     public init?() {
       managedObjectContext = persistentContainer?.viewContext
       
       guard managedObjectContext != nil else {
         print("Cann't get right managed object context.")
         return nil
       }
     }


    ///Save context
    func saveContext () {
        let context = persistentContainer?.viewContext
        if ((context?.hasChanges) != nil) {
               do {
                   try context?.save()
               } catch {
                   // Replace this implementation with code to handle the error appropriately.
                   // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                   let nserror = error as NSError
                   fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
               }
           }
       }

    
    ///Creat new record if doesn't exist
    func creatUserdetails(name: String, email: String, password: String, didResult: @escaping (AuthStatus) -> ())  {

        //Check if email already exist
        let fetchRequest = fetchUserdetails(withEmail: email, password: "")
        if let _ = fetchRequest {
            didResult(AuthStatus.failed(Constant.Strings.accountExist))

        } else {
            // insert new account if doesn't exist
            let context = persistentContainer?.viewContext
            guard let context = context else { return }
            let userdetails = NSEntityDescription.insertNewObject(forEntityName: "Userdetails", into: context) as! Userdetails

            userdetails.name = name
            userdetails.email = email
            userdetails.password = password

            do {
                try context.save()
                didResult(AuthStatus.success)

            } catch let createError{
                print("Failed to creat: \(createError)")
                didResult(AuthStatus.failed(Constant.Strings.failedSignup))

            }
        }

    }

    ///Fetch records
    func fetchUserdetails() -> [Userdetails]? {
        let context = persistentContainer?.viewContext
        let fetchRequest = NSFetchRequest<Userdetails>(entityName: "Userdetails")

        do {
            let details = try context?.fetch(fetchRequest)
            return details
        } catch let fetchError {
            print("Failed to fetch companies: \(fetchError)")
        }
        return nil
    }

    ///Fetch records with email and password
    func fetchUserdetails(withEmail email: String, password: String?) -> Userdetails? {

        let context = persistentContainer?.viewContext
        let fetchRequest = NSFetchRequest<Userdetails>(entityName: "Userdetails")
        fetchRequest.fetchLimit = 1

        if let pass = password, !pass.isEmpty {
            fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, pass)
        } else {
            fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        }

        do {
            let details = try context?.fetch(fetchRequest)
            return details?.first

        } catch let fetchError {
            print("Failed to fetch companies: \(fetchError)")
        }
        return nil
    }

    ///Update records
    func updateUserdetails(userdetails: Userdetails) {

        let context = persistentContainer?.viewContext

        do {
            try context?.save()

        } catch let createError {
            print("Failed to update: \(createError)")
        }
    }

    ///Delete records
    func deleteUserdetails(userdetails: Userdetails) {

        let context = persistentContainer?.viewContext
        context?.delete(userdetails)

        do {
            try context?.save()

        } catch let saveError {
            print("Failed to delete: \(saveError)")
        }
    }
}
