//
//  ToastClient+Live.swift
//  FoodRecipeApp
//

import Combine
import ComposableArchitecture
import Foundation

extension ToastClient: DependencyKey {
    static var liveValue: ToastClient {
        let manager = ToastManager()
        return Self(
            observe: {
                await manager.toastsStream()
            },
            addToQueue: { toast in
                await manager.addToast(toast)
            },
            dismiss: {
                await manager.dismissToast()
            })
    }

    static var previewValue: ToastClient { liveValue }
}

extension ToastClient {
    fileprivate actor ToastManager {
        @Dependency(\.logger["ToastManager"]) var logger
        private var toastQueue = [Toast]()
        private let toastSubject = CurrentValueSubject<Toast?, Never>(nil)

        func toastsStream() -> AsyncStream<Toast?> {
            return AsyncStream { continuation in
                let cancellable =
                    toastSubject
                    .sink { continuation.yield($0) }
                continuation.onTermination = { continuation in
                    cancellable.cancel()
                }
            }
        }

        func addToast(_ toast: Toast) {
            toastQueue.append(toast)
            sendNextToastIfNeeded()
            logger.info("addToast :: Add \(toast.debugDescription) to queue")
        }

        func dismissToast() {
            logger.info("dismissToast :: Dismiss toast")
            toastSubject.send(nil)
            sendNextToastIfNeeded()
        }

        private func sendNextToastIfNeeded() {
            guard toastSubject.value == nil, !toastQueue.isEmpty else {
                return
            }
            let nextToast = toastQueue.removeFirst()
            toastSubject.send(nextToast)
            logger.info("sendNextToastIfNeeded :: Show \(nextToast.debugDescription)")
        }
    }
}
