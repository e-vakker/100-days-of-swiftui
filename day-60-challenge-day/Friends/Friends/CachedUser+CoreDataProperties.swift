//
//  CachedUser+CoreDataProperties.swift
//  Friends
//
//  Created by Jevgeni Vakker on 11.08.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    public var WrappedId: String {
        id ?? "User doesn't have id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown"
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown"
    }
    
    public var wrappedRegistered: String {
        registered ?? "Unknown"
    }
    
    public var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)
    
    func update(with user: User, context: NSManagedObjectContext) {
        id = user.id
        isActive = user.isActive
        name = user.name
        age = Int16(user.age)
        company = user.company
        email = user.email
        address = user.address
        about = user.about
        registered = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            if let date = dateFormatter.date(from: user.registered) {
                dateFormatter.dateFormat = "MMM dd, yyyy"
                return dateFormatter.string(from: date)
            } else {
                return user.registered
            }
        }()
        tags = {
            user.tags.joined(separator: ",")
        }()
        
        // adding friends
        for friend in user.friends {
            let cachedFriend = CachedFriend(context: context)
            cachedFriend.id = friend.id
            cachedFriend.name = friend.name
            addToFriends(cachedFriend)
        }
    }

}

extension CachedUser : Identifiable {

}
