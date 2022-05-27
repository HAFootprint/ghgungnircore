//
//  GHDeviceManager.swift
//  ghgungnircore
//
//  Created by Javier Carapia on 22/11/21.
//

#if os(iOS)
import UIKit
#endif

import CoreTelephony

public struct GHDeviceManager {
    public static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "No Version."
    
    public static func getCarrier() -> String {
        let networkInfo = CTTelephonyNetworkInfo()
        let carrier = networkInfo.subscriberCellularProvider

        return carrier?.carrierName ?? "No carrier detect"
    }
    
    public static func getIpAddress() -> String {
        var address : String?

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return "No ip detect" }
        guard let firstAddr = ifaddr else { return "No ip detect" }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if  name == "en0" {

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        
        freeifaddrs(ifaddr)

        return address ?? "No ip detect"
    }
    
    public static func getDeviceName() -> String {
        UIDevice.modelName
    }

    public static func getDeviceId() -> String {
        UIDevice.current.identifierForVendor?.uuidString ?? .empty
    }

    public static func getOperatingSystemVersion() -> String {
        UIDevice.current.systemVersion
    }
}
