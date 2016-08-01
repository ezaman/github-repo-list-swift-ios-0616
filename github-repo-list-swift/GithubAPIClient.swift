//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    
    //it is a class function so that we can pull it out at any point in time
    class func getRepositoriesWithCompletion(completionBlock:(NSArray) -> ()) {
        
        let tempArray = []
        
        let urlString="\(githubAPIURL)/repositories?client_id=\(githubClientID)&client_secrets=\(githubClientSecret)"
        
        let session = NSURLSession.sharedSession()
        
        //data, error, response. Data is usually HTML or JSON,response in HTTP code, 200s means you're ok, 300s means youre ok but permissions are off.
        if let url = NSURL(string: urlString) {
            var dataTask = session.dataTaskWithURL(url){data,response,error in
                print(data)
                print(response)
                print(error)
                
                var array = []
                do {if let jsonData = data {
                    array = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSArray
                    print(array)
                    completionBlock(array)
                    
                    }
                }catch {
                        print(error)
                    }
                    
            }
            dataTask.resume()
        }
     
        
    }
    
}

