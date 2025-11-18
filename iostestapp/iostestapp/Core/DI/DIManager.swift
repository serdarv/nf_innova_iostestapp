//    
//  DIManager.swift
//  iostestapp
//

import Foundation
import Swinject

final class DIManager {
    enum Service {
        case services

        var assembly: Assembly {
            switch self {
            case .services:
                return ServiceAssembly()
            }
        }

        static let allCases: [Service] = [.services]
    }

    static let shared = DIManager()
    private(set) var container: Container!
    private var assembler: Assembler!
    private var synchronizedResolver: Resolver!

    func setup() {
        container = Container()
        assembler = Assembler(Service.allCases.map { $0.assembly }, container: container)
        let resolver = assembler.resolver as? Container
        synchronizedResolver = resolver?.synchronize()
    }

    func resolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = synchronizedResolver.resolve(serviceType) else {
            fatalError("Service \(serviceType) can't be resolved!")
        }
        return service
    }
}
