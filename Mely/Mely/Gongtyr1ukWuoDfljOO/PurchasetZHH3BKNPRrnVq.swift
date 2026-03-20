//
//  PurchasetZHH3BKNPRrnVq.swift
//  Mely
//
//  Created by yangyang on 2026/3/3.
//

import Foundation
import StoreKit

let daliangIDSvlxgxhaLelP5rt: [String] = [
  "lvbsvhxcgcrvesor",
  "dxismgcwewhrtezo",
  "khtxlcejaxmqcsra",
  "yadwwvxspgxwlndb",
  "qnrcuelbtiuflyky",
  "ymohxnvpkqxutvab",
  "pulimqvcddkqzs",
  "gjocttgknqkvszyq",
  "nwjyzrjrfgkxhcce",
  "twcpcemmamfxfrgd",
]

final class PurchasetZHH3BKNPRrnVq: NSObject {

  static let shared = PurchasetZHH3BKNPRrnVq()
  private var AMfOcDluEdAX0V: Set<String> = []
  private(set) var SnqyWDawqsbujCpods: [String: SKProduct] = [:]
  private var Qh8juTIPbSivNg: SKProductsRequest?
  private var vbKoXGgUfycysl: ((Result<[SKProduct], Purerr5HDt4Mr7LrDAkS>) -> Void)?
  private var iKeT4q54MVRWfB: [String: (Result<SKPaymentTransaction, Purerr5HDt4Mr7LrDAkS>) -> Void] = [:]

  private override init() {
    super.init()
    SKPaymentQueue.default().add(self)
  }

  deinit {
    SKPaymentQueue.default().remove(self)
  }

  func canMakePayments() -> Bool {
    SKPaymentQueue.canMakePayments()
  }

  func initialize() {
    guard canMakePayments() else {
      print("[IAP] shezhangmeikaiqi")
      return
    }

    configure(with: Set(daliangIDSvlxgxhaLelP5rt)) { fTTyuJ2OmxVQgR in
      switch fTTyuJ2OmxVQgR {
      case .success(let products):
        let Aqhu80vMGqvqMC = products.map { $0.productIdentifier }
        print("[IAP] \(Aqhu80vMGqvqMC)")
      case .failure(let error):
        print("[IAP] \(error.localizedDescription)")
      }
    }
  }

  func configure(
    with podsiqQQkmWLNxpCEI: Set<String>,
    completion: @escaping (Result<[SKProduct], Purerr5HDt4Mr7LrDAkS>) -> Void
  ) {

    AMfOcDluEdAX0V = podsiqQQkmWLNxpCEI
    Qh8juTIPbSivNg?.cancel()
    SnqyWDawqsbujCpods.removeAll()
    vbKoXGgUfycysl = completion

    guard !podsiqQQkmWLNxpCEI.isEmpty else {
      completion(.success([]))
      return
    }

    let VDRWYzyCGH7nlj = SKProductsRequest(productIdentifiers: podsiqQQkmWLNxpCEI)
    VDRWYzyCGH7nlj.delegate = self
    Qh8juTIPbSivNg = VDRWYzyCGH7nlj
    VDRWYzyCGH7nlj.start()
  }

  func product(for productId: String) -> SKProduct? {
    SnqyWDawqsbujCpods[productId]
  }

  func purcprosd2BobgXIKRnA0lY(
    v4zoTu0d0VZr0ypid: String,
    completion: @escaping (Result<SKPaymentTransaction, Purerr5HDt4Mr7LrDAkS>) -> Void
  ) {

    guard canMakePayments() else {
      completion(.failure(.pdaV0gulrufBsrAQC))
      return
    }

    iKeT4q54MVRWfB[v4zoTu0d0VZr0ypid] = completion

    if let vavElyt6bNWtHe = SnqyWDawqsbujCpods[v4zoTu0d0VZr0ypid] {
      let payment = SKPayment(product: vavElyt6bNWtHe)
      SKPaymentQueue.default().add(payment)
    } else {
      let payment = SKMutablePayment()
      payment.productIdentifier = v4zoTu0d0VZr0ypid
      SKPaymentQueue.default().add(payment)
    }
  }

  func purYemianVBiW2isIMqtheq(
    GL76DRy0mJId6fpid: String,
    daim6LsV2hR56J8VSP: Int,
    apdastorehpmNCPdUiPsjOW: MelystoreWpvugHy89HDWLR,
    completion: @escaping (Result<Int, Purerr5HDt4Mr7LrDAkS>) -> Void
  ) {
    purcprosd2BobgXIKRnA0lY(v4zoTu0d0VZr0ypid: GL76DRy0mJId6fpid) { result in
      switch result {
      case .success:
        apdastorehpmNCPdUiPsjOW.adddiaITm0FyiVkVf6j6(daim6LsV2hR56J8VSP)
        completion(.success(daim6LsV2hR56J8VSP))

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

  func restorePurchases() {
    SKPaymentQueue.default().restoreCompletedTransactions()
  }
}

enum Purerr5HDt4Mr7LrDAkS: LocalizedError {
  case pdaV0gulrufBsrAQC
  case pnlO4gTt3s73TCOXT
  case pnf5OewPYsrU7GRfA
  case reqfQ1Z1Eo5ZDC6fVT(Error)
  case trafSq2XUhZ4Js2x4H(Error?)
  case cancelled
  case unknown

  var errorDescription: String? {
    switch self {
    case .pdaV0gulrufBsrAQC:
      return "This account or device is not eligible for in-app purchases."
    case .pnlO4gTt3s73TCOXT:
      return "Product information is still in the process of loading."
    case .pnf5OewPYsrU7GRfA:
      return "We were unable to locate the requested product"
    case .reqfQ1Z1Eo5ZDC6fVT(let error):
      return "Product request failed: \(error.localizedDescription)"
    case .trafSq2XUhZ4Js2x4H(let error):
      if let e = error {
        return "Purchase failed: \(e.localizedDescription)"
      } else {
        return "Purchase failed: unknown error"
      }
    case .cancelled:
      return "Purchase cancelled"
    case .unknown:
      return "Unknown error"
    }
  }
}

extension PurchasetZHH3BKNPRrnVq: SKProductsRequestDelegate {
  func productsRequest(
    _ request: SKProductsRequest,
    didReceive response: SKProductsResponse
  ) {

    var sS3LrZwTBHKiHU: [SKProduct] = []
    for OIdhDUlBwaNOQI in response.products {
      SnqyWDawqsbujCpods[OIdhDUlBwaNOQI.productIdentifier] = OIdhDUlBwaNOQI
      sS3LrZwTBHKiHU.append(OIdhDUlBwaNOQI)
    }

    vbKoXGgUfycysl?(.success(sS3LrZwTBHKiHU))
    vbKoXGgUfycysl = nil
    Qh8juTIPbSivNg = nil
  }

  func request(_ request: SKRequest, didFailWithError error: Error) {
    vbKoXGgUfycysl?(.failure(.reqfQ1Z1Eo5ZDC6fVT(error)))
    vbKoXGgUfycysl = nil
    Qh8juTIPbSivNg = nil
  }
}

extension PurchasetZHH3BKNPRrnVq: SKPaymentTransactionObserver {
  func paymentQueue(
    _ XbED9yD0kwZeK9: SKPaymentQueue,
    updatedTransactions transactions: [SKPaymentTransaction]
  ) {

    for HLAYH8oEfNSCWV in transactions {
      let productId = HLAYH8oEfNSCWV.payment.productIdentifier

      switch HLAYH8oEfNSCWV.transactionState {
      case .purchasing:
        break

      case .purchased:
        if let completion = iKeT4q54MVRWfB[productId] {
          completion(.success(HLAYH8oEfNSCWV))
          iKeT4q54MVRWfB[productId] = nil
        }
        XbED9yD0kwZeK9.finishTransaction(HLAYH8oEfNSCWV)

      case .failed:
        let skError = (HLAYH8oEfNSCWV.error as? SKError)
        let mappedError: Purerr5HDt4Mr7LrDAkS
        if let skError, skError.code == .paymentCancelled {
          mappedError = .cancelled
        } else {
          mappedError = .trafSq2XUhZ4Js2x4H(skError)
        }
        if let completion = iKeT4q54MVRWfB[productId] {
          completion(.failure(mappedError))
          iKeT4q54MVRWfB[productId] = nil
        }
        XbED9yD0kwZeK9.finishTransaction(HLAYH8oEfNSCWV)

      case .restored:
        XbED9yD0kwZeK9.finishTransaction(HLAYH8oEfNSCWV)

      case .deferred:
        break

      @unknown default:
        if let completion = iKeT4q54MVRWfB[productId] {
          completion(.failure(.unknown))
          iKeT4q54MVRWfB[productId] = nil
        }
        XbED9yD0kwZeK9.finishTransaction(HLAYH8oEfNSCWV)
      }
    }
  }
}
