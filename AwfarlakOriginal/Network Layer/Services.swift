//
//  Services.swift
//  Tigari
//
//  Created by Mustafa on 2/16/20.
//  Copyright © 2020 amirahmed. All rights reserved.
//

import UIKit
import Alamofire


class Services {
    
    // MARK: - Register

    class func register(name: String, mail: String,phone : String,password : String, callback: @escaping (Register) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.registerURL
      let parameters = ["name": name,"mail" : mail,"phone" : phone, "password": password]
        //  let headers = ["Content-Type":"application/json"]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: Register ) in
          callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    
    // MARK: - Login

    class func login(email: String, password: String, callback: @escaping (Login) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.loginURL
        let parameters = ["mail": email, "password": password]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: Login) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Forget Password

       class func forgetPassword(email: String, callback: @escaping (ForgetPassword) -> Void, failureHandler: @escaping (Error) -> Void) {
           let url = URLs.forgetPasswordURL
           let parameters = ["mail": email]
           Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: ForgetPassword) in
               callback(response)
           }) { (error) in
               failureHandler(error)
           }
       }
    
    // MARK: - All Categories

    class func getAllCategories( callback: @escaping (Categories) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.getAllCategories
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: Categories) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Sub Categories

    class func getSubCategories(idCategory: String, callback: @escaping (SubCategories) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.getSubCategories)/\(idCategory)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: SubCategories) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - All Product Of Sub Categories

    class func getAllProductOfSubCategories(idSubCategory: String,idUser: String,pageNumber : Int, callback: @escaping (Products) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.getAllProductOfSubCategories)/\(idSubCategory)/\(idUser)/\(pageNumber)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: Products) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Add Favorite Product

      class func addFavoriteProduct(idUser: String,idProduct : String, callback: @escaping (AddAndDeleteFavoriteProduct) -> Void, failureHandler: @escaping (Error) -> Void) {
          let url = "\(URLs.addFavoriteProduct)/\(idUser)/\(idProduct)"
          Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: AddAndDeleteFavoriteProduct) in
              callback(response)
          }) { (error) in
              failureHandler(error)
          }
      }
    
    // MARK: - Delete  Favorite Product

    class func deleteFavoriteProduct(idUser: String,idProduct : String, callback: @escaping (AddAndDeleteFavoriteProduct) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.deleteFavoriteProduct)/\(idUser)/\(idProduct)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: AddAndDeleteFavoriteProduct) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Favorite Product

       class func getFavoriteProduct(idUser: String, callback: @escaping (FavoriteProducts) -> Void, failureHandler: @escaping (Error) -> Void) {
           let url = "\(URLs.getFavoriteProduct)/\(idUser)"
           Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: FavoriteProducts) in
               callback(response)
           }) { (error) in
               failureHandler(error)
           }
       }
    
    // MARK: - Product Details

    class func getProductDetails(idProduct: String, callback: @escaping (ProductDetails) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.productDetails)/\(idProduct)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: ProductDetails) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Add Rate

    class func addRate(idUser: String,idProduct: String,rateNumber: Int ,callback: @escaping (AddRateToProduct) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.addRate)/\(idUser)/\(idProduct)/\(rateNumber)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: AddRateToProduct) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - All Comments Of Product

    class func getComments(idProduct: String,pageNumber: Int ,callback: @escaping (ProductComments) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.getComments)/\(idProduct)/\(pageNumber)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: ProductComments) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Add Comments

       class func addComments(comment: String, idProduct: String,idUser: String, callback: @escaping (AddComments) -> Void, failureHandler: @escaping (Error) -> Void) {
           let url = URLs.addComments
           let parameters = ["usercomment": comment, "product_id": idProduct , "id_user": idUser ]
           Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: AddComments) in
               callback(response)
           }) { (error) in
               failureHandler(error)
           }
       }
    
    // MARK: - Edit Profile

    class func editProfile(name: String, email: String,phone: String,idUser: String, callback: @escaping (EditProfile) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.editProfile
        let parameters = ["name": name, "mail": email ,"phone": phone, "id_user": idUser ]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: EditProfile) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Get Data Of User

    class func getDataOfUser(idUser: String ,callback: @escaping (ViewProfile) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.viewProfile)/\(idUser)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: ViewProfile) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Change Password

    class func changePassword(oldPassword: String, newPassword: String,reNewPassword: String,idUser: String, callback: @escaping (ChangePassword) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.changePassword
        let parameters = ["old_password": oldPassword, "new_password": newPassword ,"re_new_password": reNewPassword, "id_user": idUser ]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: ChangePassword) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - View Question

       class func getQuestion(callback: @escaping (FaQuestion) -> Void, failureHandler: @escaping (Error) -> Void) {
           let url = URLs.faq
           Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: nil, headers:nil, callBack: { (response: FaQuestion) in
               callback(response)
           }) { (error) in
               failureHandler(error)
           }
       }
    
    // MARK: - Send Order

    class func sendOrder(AllProduct: String, yourName: String,address: String,mobile : String ,idRegion : Int ,payment : Int,idUser: String, callback: @escaping (SendOrder) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = URLs.sendOrder
        let parameters = ["products": AllProduct, "name": yourName ,"address": address,"mobile": mobile, "id_region": idRegion ,"payment": payment, "id_user": idUser ] as [String : Any]
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.post, parameters: parameters, headers:nil, callBack: { (response: SendOrder) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    // MARK: - Get Search

    class func getSearchResult(searchWord: String ,idUser: String ,callback: @escaping (Search) -> Void, failureHandler: @escaping (Error) -> Void) {
        let url = "\(URLs.search)/\(searchWord)/\(idUser)"
        Service.request(url: url, dateFormate: nil, method: HTTPMethod.get, parameters: nil, headers:nil, callBack: { (response: Search) in
            callback(response)
        }) { (error) in
            failureHandler(error)
        }
    }
    
    
    
}
















