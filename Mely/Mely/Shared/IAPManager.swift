//
//  IAPManager.swift
//  Mely
//
//  Created by yangyang on 2026/3/3.
//

import Foundation
import StoreKit

// 当前项目中在 WalletScreen 使用到的全部 productIdentifier（保持顺序以便按下标索引）
let walletProductIds: [String] = [
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

/// 通用内购错误
enum IAPError: LocalizedError {
  case paymentsDisabled
  case productsNotLoaded
  case productNotFound
  case requestFailed(Error)
  case transactionFailed(Error?)
  case cancelled
  case unknown

  var errorDescription: String? {
    switch self {
    case .paymentsDisabled:
      return "In-app purchases are not supported on this device or account."
    case .productsNotLoaded:
      return "Product information has not yet finished loading."
    case .productNotFound:
      return "No matching product found"
    case .requestFailed(let error):
      return "Product request failed: \(error.localizedDescription)"
    case .transactionFailed(let error):
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

/// 通用 IAP 管理器（StoreKit1）
/// - 负责：加载商品 / 发起购买 / 处理交易回调 / 恢复购买
final class IAPManager: NSObject {

  static let shared = IAPManager()

  /// 所有要支持的商品 ID 集合（多项目复用时由外层传入）
  private var allProductIds: Set<String> = []

  /// 已加载成功的商品，Key 为 productIdentifier
  private(set) var products: [String: SKProduct] = [:]

  private var productsRequest: SKProductsRequest?

  /// 加载商品完成回调
  private var productsCompletion: ((Result<[SKProduct], IAPError>) -> Void)?

  /// 单次购买回调：Key 为 productIdentifier
  private var purchaseCompletions: [String: (Result<SKPaymentTransaction, IAPError>) -> Void] = [:]

  private override init() {
    super.init()
    // 注册交易队列观察者
    SKPaymentQueue.default().add(self)
  }

  deinit {
    SKPaymentQueue.default().remove(self)
  }

  /// 是否允许内购
  func canMakePayments() -> Bool {
    SKPaymentQueue.canMakePayments()
  }

  /// 应用启动时调用的默认初始化入口
  /// - Note: 将具体的商品 ID 配置封装在 IAPManager 内部，对外只暴露一个 initialize()
  func initialize() {
    // 若设备或当前账号不支持内购，直接返回
    guard canMakePayments() else {
      print("[IAP] 内购不可用（设备或账号未开启）")
      return
    }

    // // 当前项目中在 WalletScreen 使用到的全部 productIdentifier
    // let productIds: Set<String> = [
    //   "lvbsvhxcgcrvesor",  // 400 coins
    //   "dxismgcwewhrtezo",  // 800 coins
    //   "khtxlcejaxmqcsra",  // 2450 coins
    //   "yadwwvxspgxwlndb",  // 5150 coins
    //   "qnrcuelbtiuflyky",  // 7400 coins
    //   "ymohxnvpkqxutvab",  // 10800 coins
    //   "jvrukwualnwutfl",   // 19800 coins
    //   "cqhzrsgfuufsxixh",  // 29400 coins
    //   "wqxplrklrlcdlki",   // 44500 coins
    //   "lqfgfgdyhxfwvmga",  // 63700 coins
    // ]

    configure(with: Set(walletProductIds)) { result in
      switch result {
      case .success(let products):
        let ids = products.map { $0.productIdentifier }
        print("[IAP] 已加载商品: \(ids)")
      case .failure(let error):
        print("[IAP] 加载商品失败: \(error.localizedDescription)")
      }
    }
  }

  /// 初始化 / 刷新支持的商品 ID，并向 App Store 请求商品信息
  /// - Parameters:
  ///   - productIds: App Store Connect 中配置的所有商品 ID
  ///   - completion: 成功返回 SKProduct 列表，失败返回错误
  func configure(
    with productIds: Set<String>,
    completion: @escaping (Result<[SKProduct], IAPError>) -> Void
  ) {

    allProductIds = productIds
    productsRequest?.cancel()
    products.removeAll()
    productsCompletion = completion

    guard !productIds.isEmpty else {
      completion(.success([]))
      return
    }

    let request = SKProductsRequest(productIdentifiers: productIds)
    request.delegate = self
    productsRequest = request
    request.start()
  }

  /// 根据 productIdentifier 获取已加载的 SKProduct（可能为 nil）
  func product(for productId: String) -> SKProduct? {
    products[productId]
  }

  /// 发起购买（外层只需要关心 productId）
  func purchase(
    productId: String,
    completion: @escaping (Result<SKPaymentTransaction, IAPError>) -> Void
  ) {

    guard canMakePayments() else {
      completion(.failure(.paymentsDisabled))
      return
    }

    // 记录回调（同一个 productId 多次购买时，后一次会覆盖前一次）
    purchaseCompletions[productId] = completion

    if let product = products[productId] {
      // 已经拿到 SKProduct，使用推荐方式
      let payment = SKPayment(product: product)
      SKPaymentQueue.default().add(payment)
    } else {
      // 商品信息尚未加载到，也可以直接用 productIdentifier 购买（StoreKit1 支持）
      let payment = SKMutablePayment()
      payment.productIdentifier = productId
      SKPaymentQueue.default().add(payment)
    }
  }

  /// 购买钻石入口：内部处理加钻石与全局状态刷新，外部只关注结果
  /// - Parameters:
  ///   - productId: 对应的内购商品 ID
  ///   - diamonds: 该商品应增加的钻石数量
  ///   - appDataStore: 全局 AppDataStore，用于 adddiaITm0FyiVkVf6j6 并触发 UI 刷新
  ///   - completion: 成功返回增加的钻石数量，失败返回错误
  func purchaseDiamonds(
    productId: String,
    diamonds: Int,
    appDataStore: MelystoreWpvugHy89HDWLR,
    completion: @escaping (Result<Int, IAPError>) -> Void
  ) {
    purchase(productId: productId) { result in
      switch result {
      case .success:
        // 支付成功：统一在此处发放钻石并刷新用户资料
        appDataStore.adddiaITm0FyiVkVf6j6(diamonds)
        completion(.success(diamonds))

      case .failure(let error):
        completion(.failure(error))
      }
    }
  }

  /// 恢复购买（一般用于非消耗型商品；你的金币是 Consumable，可以不用）
  func restorePurchases() {
    SKPaymentQueue.default().restoreCompletedTransactions()
  }
}

// MARK: - SKProductsRequestDelegate

extension IAPManager: SKProductsRequestDelegate {
  func productsRequest(
    _ request: SKProductsRequest,
    didReceive response: SKProductsResponse
  ) {

    var resultProducts: [SKProduct] = []
    for product in response.products {
      products[product.productIdentifier] = product
      resultProducts.append(product)
    }

    // 也可以根据 response.invalidProductIdentifiers 做一些日志记录
    productsCompletion?(.success(resultProducts))
    productsCompletion = nil
    productsRequest = nil
  }

  func request(_ request: SKRequest, didFailWithError error: Error) {
    productsCompletion?(.failure(.requestFailed(error)))
    productsCompletion = nil
    productsRequest = nil
  }
}

// MARK: - SKPaymentTransactionObserver

extension IAPManager: SKPaymentTransactionObserver {
  func paymentQueue(
    _ queue: SKPaymentQueue,
    updatedTransactions transactions: [SKPaymentTransaction]
  ) {

    for transaction in transactions {
      let productId = transaction.payment.productIdentifier

      switch transaction.transactionState {
      case .purchasing:
        // 购买中，可根据需要显示 loading
        break

      case .purchased:
        // 支付成功
        if let completion = purchaseCompletions[productId] {
          completion(.success(transaction))
          purchaseCompletions[productId] = nil
        }
        queue.finishTransaction(transaction)

      case .failed:
        let skError = (transaction.error as? SKError)
        // 用户取消也会走 failed，这里区分取消与其他错误
        let mappedError: IAPError
        if let skError, skError.code == .paymentCancelled {
          mappedError = .cancelled
        } else {
          mappedError = .transactionFailed(skError)
        }
        if let completion = purchaseCompletions[productId] {
          completion(.failure(mappedError))
          purchaseCompletions[productId] = nil
        }
        queue.finishTransaction(transaction)

      case .restored:
        // 恢复购买（一般用于非消耗型）
        queue.finishTransaction(transaction)

      case .deferred:
        // 审核中/待家长同意，可提示“订单正在等待审核”
        break

      @unknown default:
        if let completion = purchaseCompletions[productId] {
          completion(.failure(.unknown))
          purchaseCompletions[productId] = nil
        }
        queue.finishTransaction(transaction)
      }
    }
  }
}
