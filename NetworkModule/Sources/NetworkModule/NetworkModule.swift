// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation
import Network

public final class NetworkModule {
    
    public static func getFactory() -> INetworkFactory {
        return NetworkFactory()
    }
}
