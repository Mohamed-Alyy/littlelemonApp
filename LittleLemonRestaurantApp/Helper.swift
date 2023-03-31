//
//  K.swift
//  LittleLemonRestaurantApp
//
//  Created by Mohamed Ali on 20/02/2023.
//

import Foundation
import SwiftUI
import CoreData
class Helper {

    static let shared = PersistenceController()
    
    //MARK: - Sample
    static let kSampleImage = UIImage(systemName: "person")
    
    static var sampleDish: Dish {
       let newDish = Dish(context: shared.container.viewContext)
       newDish.title = "test"
       newDish.price = "price"

       return newDish
    }

   static var profilePhoto : UIImage {
        var profileImage: UIImage?
        if let photo = UserDefaults.standard.string(forKey: Helper.kProfileImage){
            let image = Helper.imageFromString(image: photo)
            profileImage = image
        }else{
            profileImage = kSampleImage
        }
        return profileImage!
    }
    
    //MARK: - State Properties
    @State static var kPindingString = ""
    
 
    
    
    //MARK: - Formate Properties
    static let tfHeight: CGFloat = 55
    static let tfBgColor: Color = .gray.opacity(0.2)
    static let tfCornerRadius: CGFloat = 10
    
    
    //MARK: - User Deafult Keys Properties
    static let kFirstName = "kFirstName"
    static let kLasttName = "kLasttName"
    static let kEmail = "kEmail"
    static let kProfileImage = "kProfileImage"
    static let kIsLoggedIn = "kIsLoggedIn"
    
    
    //MARK: - Url Properties
    static let Url = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
    
    
    //MARK: - Functions
    static func buildSortDescriptor()->[NSSortDescriptor]{
        [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    static func buildPredicate(searchText: String)-> NSPredicate {
        return searchText.isEmpty ? NSPredicate(value: true) :NSPredicate(format: "title CONTAINS [cd] %@", searchText)
    }
    
    
    
    static func getMenuData (from basUrl: String , context: NSManagedObjectContext){
        PersistenceController().clear()
     
        
        let session = URLSession(configuration: .default)
        let url = URL(string: basUrl)
        let task = session.dataTask(with: url!) { data, response, error in
            if  error != nil {
                print(error!)
            }else{
                if let myData = data {
                    
                    let decoder = JSONDecoder()
                    let decodedData = try? decoder.decode(MenuList.self, from: myData)
                    let menuList = decodedData
                   
                    for menu in menuList!.menu {
                        let newDish = Dish(context: context)
                        newDish.title = menu.title
                        newDish.price = menu.price
                        newDish.image = menu.image
                        newDish.descrip = menu.description

                        try? context.save()
                      //  print("object  \(String(describing: newDish.title)) saved")
                    }
                    
                }
            }
            
        }
        task.resume()
        
    }// function end
  
    
    
    static func imageToString (image: UIImage , completion:(_ imageString: String?)-> Void) {
            
            let photoData = image.jpegData(compressionQuality: 1)
            let imageString: String = (photoData?.base64EncodedString())!
         //   let imageEncoding = String(data: photoData!, encoding: String.Encoding(rawValue: 0))
            
            completion(imageString)
        }
        
    
   static func imageFromString (image: String) -> UIImage {
            var photo: UIImage?
            
       if let decodedimage =  NSData(base64Encoded: image, options: NSData.Base64DecodingOptions(rawValue: 0)){
           photo = UIImage(data: decodedimage as Data)
       }
            return photo!
        }
}
