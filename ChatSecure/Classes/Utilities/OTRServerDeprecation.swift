//
//  OTRServerDeprecation.swift
//  ChatSecure
//
//  Created by N-Pex on 2017-04-20.
//  Copyright © 2017 Chris Ballinger. All rights reserved.
//

import Foundation

open class OTRServerDeprecation: NSObject {
    open var name:String
    open var domain:String
    open var shutdownDate:Date?
    
    public init(name:String, domain:String, shutdownDate:Date?) {
        self.name = name
        self.domain = domain
        self.shutdownDate = shutdownDate
    }
    
    static let dukgo = OTRServerDeprecation(name:"Dukgo", domain:"dukgo.com", shutdownDate:Date(timeIntervalSince1970: TimeInterval(integerLiteral: 1494288000)))
    static let calyx = OTRServerDeprecation(name:"Calyx", domain:"jabber.calyxinstitute.org", shutdownDate:Date(timeIntervalSince1970: TimeInterval(integerLiteral: 1494288000)))
    static let allDeprecatedServers:[String:OTRServerDeprecation] = [
        dukgo.domain:dukgo,
        calyx.domain:calyx
    ]
    
    open static func isDeprecated(server: String) -> Bool {
        return deprecationInfo(withServer: server) != nil
    }
    
    open static func deprecationInfo(withServer server:String) -> OTRServerDeprecation? {
        return allDeprecatedServers[server.lowercased()];
    }
}
