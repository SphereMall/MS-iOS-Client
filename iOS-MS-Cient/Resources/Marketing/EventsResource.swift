//
//  EventsResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/27/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

public class EventsResource<T: Decodable>: Resource<EventsSM> {
    
    public override func getURI() -> String {
        return "events"
    }
}
