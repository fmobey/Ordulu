//
//  EventsResponse.swift
//  ordulugorev
//
//  Created by Furkan Oğuz on 19.02.2022.
//

import Foundation

// MARK: - EventsResponse
struct EventsResponse: Codable {
    let embedded: EventsResponseEmbedded?
    let links: EventsResponseLinks?
    let page: Page?

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
        case links = "_links"
        case page
    }
}

// MARK: - EventsResponseEmbedded
struct EventsResponseEmbedded: Codable {
    let events: [Event]?
}

// MARK: - Event
struct Event: Codable {
    let name: String?
    let type: EventType?
    let id: String?
    let test: Bool?
    let url: String?
    let locale: Locale?
    let images: [Image]?
    let sales: Sales?
    let dates: Dates?
    let classifications: [Classification]?
    let outlets: [Outlet]?
    let seatmap: Seatmap?
    let links: EventLinks?
    let embedded: EventEmbedded?
    let promoter: Promoter?
    let promoters: [Promoter]?
    let info, pleaseNote: String?
    let priceRanges: [PriceRange]?
    let products: [Product]?
    let accessibility: Accessibility?
    let ticketLimit: TicketLimit?
    let ageRestrictions: AgeRestrictions?
    let ticketing: Ticketing?
    let doorsTimes: DoorsTimes?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, sales, dates, classifications, outlets, seatmap
        case links = "_links"
        case embedded = "_embedded"
        case promoter, promoters, info, pleaseNote, priceRanges, products, accessibility, ticketLimit, ageRestrictions, ticketing, doorsTimes
    }
}

// MARK: - Accessibility
struct Accessibility: Codable {
    let ticketLimit: Int?
    let info: String?
}

// MARK: - AgeRestrictions
struct AgeRestrictions: Codable {
    let legalAgeEnforced: Bool?
}

// MARK: - Classification
struct Classification: Codable {
    let primary: Bool?
    let segment, genre, subGenre, type: Genre?
    let subType: Genre?
    let family: Bool?
}

// MARK: - Genre
struct Genre: Codable {
    let id, name: String?
}

// MARK: - Dates
struct Dates: Codable {
    let start: Start?
    let status: Status?
    let spanMultipleDays: Bool?
    let timezone: String?
}

// MARK: - Start
struct Start: Codable {
    let localDate, localTime: String?
    let dateTime: String?
    let dateTBD, dateTBA, timeTBA, noSpecificTime: Bool?
}

// MARK: - Status
struct Status: Codable {
    let code: Code?
}

enum Code: String, Codable {
    case onsale = "onsale"
}

// MARK: - DoorsTimes
struct DoorsTimes: Codable {
    let localDate, localTime: String?
    let dateTime: String?
}

// MARK: - EventEmbedded
struct EventEmbedded: Codable {
    let venues: [Venue]?
    let attractions: [Attraction]?
}

// MARK: - Attraction
struct Attraction: Codable {
    let name: String?
    let type: AttractionType?
    let id: String?
    let test: Bool?
    let url: String?
    let locale: Locale?
    let externalLinks: ExternalLinks?
    let images: [Image]?
    let classifications: [Classification]?
    let upcomingEvents: [String: Int]?
    let links: AttractionLinks?
    let aliases: [String]?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, externalLinks, images, classifications, upcomingEvents
        case links = "_links"
        case aliases
    }
}

// MARK: - ExternalLinks
struct ExternalLinks: Codable {
    let twitter, wiki, facebook, instagram: [Facebook]?
    let homepage, youtube, itunes, lastfm: [Facebook]?
    let spotify: [Facebook]?
    let musicbrainz: [Musicbrainz]?
}

// MARK: - Facebook
struct Facebook: Codable {
    let url: String?
}

// MARK: - Musicbrainz
struct Musicbrainz: Codable {
    let id: String?
}

// MARK: - Image
struct Image: Codable {
    let ratio: Ratio?
    let url: String?
    let width, height: Int?
    let fallback: Bool?
    let attribution: String?
}

enum Ratio: String, Codable {
    case the16_9 = "16_9"
    case the3_1 = "3_1"
    case the3_2 = "3_2"
    case the4_3 = "4_3"
}

// MARK: - AttractionLinks
struct AttractionLinks: Codable {
    let linksSelf: First?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - First
struct First: Codable {
    let href: String?
}

enum Locale: String, Codable {
    case enUs = "en-us"
}

enum AttractionType: String, Codable {
    case attraction = "attraction"
}

// MARK: - Venue
struct Venue: Codable {
    let name: String?
    let type: VenueType?
    let id: String?
    let test: Bool?
    let locale: Locale?
    let postalCode, timezone: String?
    let city: City?
    let state: State?
    let country: Country?
    let address: Address?
    let location: Location?
    let dmas: [DMA]?
    let upcomingEvents: UpcomingEvents?
    let links: AttractionLinks?
    let url: String?
    let images: [Image]?
    let markets: [Genre]?
    let boxOfficeInfo: BoxOfficeInfo?
    let accessibleSeatingDetail: String?
    let generalInfo: GeneralInfo?
    let parkingDetail: String?
    let aliases: [String]?
    let social: Social?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, locale, postalCode, timezone, city, state, country, address, location, dmas, upcomingEvents
        case links = "_links"
        case url, images, markets, boxOfficeInfo, accessibleSeatingDetail, generalInfo, parkingDetail, aliases, social
    }
}

// MARK: - Address
struct Address: Codable {
    let line1: String?
}

// MARK: - BoxOfficeInfo
struct BoxOfficeInfo: Codable {
    let phoneNumberDetail, openHoursDetail, acceptedPaymentDetail, willCallDetail: String?
}

// MARK: - City
struct City: Codable {
    let name: String?
}

// MARK: - Country
struct Country: Codable {
    let name: CountryName?
    let countryCode: CountryCode?
}

enum CountryCode: String, Codable {
    case us = "US"
}

enum CountryName: String, Codable {
    case unitedStatesOfAmerica = "United States Of America"
}

// MARK: - DMA
struct DMA: Codable {
    let id: Int?
}

// MARK: - GeneralInfo
struct GeneralInfo: Codable {
    let generalRule, childRule: String?
}

// MARK: - Location
struct Location: Codable {
    let longitude, latitude: String?
}

// MARK: - Social
struct Social: Codable {
    let twitter: Twitter?
}

// MARK: - Twitter
struct Twitter: Codable {
    let handle: String?
}

// MARK: - State
struct State: Codable {
    let name, stateCode: String?
}

enum VenueType: String, Codable {
    case venue = "venue"
}

// MARK: - UpcomingEvents
struct UpcomingEvents: Codable {
    let total, tmr, ticketmaster: Int?

    enum CodingKeys: String, CodingKey {
        case total = "_total"
        case tmr, ticketmaster
    }
}

// MARK: - EventLinks
struct EventLinks: Codable {
    let linksSelf: First?
    let attractions, venues: [First]?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case attractions, venues
    }
}

// MARK: - Outlet
struct Outlet: Codable {
    let url: String?
    let type: String?
}

// MARK: - PriceRange
struct PriceRange: Codable {
    let type: PriceRangeType?
    let currency: Currency?
    let min, max: Double?
}

enum Currency: String, Codable {
    case usd = "USD"
}

enum PriceRangeType: String, Codable {
    case standard = "standard"
}

// MARK: - Product
struct Product: Codable {
    let name, id: String?
    let url: String?
    let type: ProductType?
    let classifications: [Classification]?
}

enum ProductType: String, Codable {
    case donation = "Donation"
    case parking = "Parking"
    case specialEntry = "Special Entry"
    case upsell = "Upsell"
}

// MARK: - Promoter
struct Promoter: Codable {
    let id: String?
    let name: PromoterName?
    let promoterDescription: Description?

    enum CodingKeys: String, CodingKey {
        case id, name
        case promoterDescription = "description"
    }
}

enum PromoterName: String, Codable {
    case feldMotorsports = "FELD MOTORSPORTS"
    case liveNationMusic = "LIVE NATION MUSIC"
    case nbaRegularSeason = "NBA REGULAR SEASON"
}

enum Description: String, Codable {
    case feldMotorsportsNtlUsa = "FELD MOTORSPORTS / NTL / USA"
    case liveNationMusicNtlUsa = "LIVE NATION MUSIC / NTL / USA"
    case nbaRegularSeasonNtlUsa = "NBA REGULAR SEASON / NTL / USA"
}

// MARK: - Sales
struct Sales: Codable {
    let salesPublic: Public?
    let presales: [Presale]?

    enum CodingKeys: String, CodingKey {
        case salesPublic = "public"
        case presales
    }
}

// MARK: - Presale
struct Presale: Codable {
    let startDateTime, endDateTime: String?
    let name: String?
}

// MARK: - Public
struct Public: Codable {
    let startDateTime: String?
    let startTBD, startTBA: Bool?
    let endDateTime: String?
}

// MARK: - Seatmap
struct Seatmap: Codable {
    let staticURL: String?

    enum CodingKeys: String, CodingKey {
        case staticURL = "staticUrl"
    }
}

// MARK: - TicketLimit
struct TicketLimit: Codable {
    let info: String?
}

// MARK: - Ticketing
struct Ticketing: Codable {
    let healthCheck: HealthCheck?
    let safeTix: SafeTix?
}

// MARK: - HealthCheck
struct HealthCheck: Codable {
    let summary, healthCheckDescription: String?
    let learnMoreURL: String?

    enum CodingKeys: String, CodingKey {
        case summary
        case healthCheckDescription = "description"
        case learnMoreURL = "learnMoreUrl"
    }
}

// MARK: - SafeTix
struct SafeTix: Codable {
    let enabled: Bool?
}

enum EventType: String, Codable {
    case event = "event"
}

// MARK: - EventsResponseLinks
struct EventsResponseLinks: Codable {
    let first, linksSelf, next, last: First?

    enum CodingKeys: String, CodingKey {
        case first
        case linksSelf = "self"
        case next, last
    }
}

// MARK: - Page
struct Page: Codable {
    let size, totalElements, totalPages, number: Int?
}
