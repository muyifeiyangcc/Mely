import Foundation

struct UserteYT4uBeg4ObJP: Identifiable, Codable, Equatable {
  let id: String
  var uZp7Lm2cR: String
  var uQd8Nv5tK: String
  var uEs1Fw9Hb: String? = nil
  var uPk6Tr3Yv: String? = nil
  var uIq4Uz7Mn: Bool = false
  var uDg2Jy5Wx: Int = 0
  var uBh9Ca1Zs: [String] = []
  var uFm7Xr8Lp: [String] = []
  var uFn3Te6Qb: [String] = []
  var uLc5Vw2Kd: [String] = []
  var uUv8Hp4Nj: [String] = []

  enum CodingKeys: String, CodingKey {
    case uAx93kL0Q = "u_Ax93kL0Q"
    case uZp7Lm2cR = "u_Zp7Lm2cR"
    case uQd8Nv5tK = "u_Qd8Nv5tK"
    case uEs1Fw9Hb = "u_Es1Fw9Hb"
    case uPk6Tr3Yv = "u_Pk6Tr3Yv"
    case uIq4Uz7Mn = "u_Iq4Uz7Mn"
    case uDg2Jy5Wx = "u_Dg2Jy5Wx"
    case uBh9Ca1Zs = "u_Bh9Ca1Zs"
    case uFm7Xr8Lp = "u_Fm7Xr8Lp"
    case uFn3Te6Qb = "u_Fn3Te6Qb"
    case uLc5Vw2Kd = "u_Lc5Vw2Kd"
    case uUv8Hp4Nj = "u_Uv8Hp4Nj"
  }

  init(
    _ uAx93kL0Q: String,
    _ uZp7Lm2cR: String,
    _ uQd8Nv5tK: String,
    _ uEs1Fw9Hb: String? = nil,
    _ uPk6Tr3Yv: String? = nil,
    _ uIq4Uz7Mn: Bool = false,
    _ uDg2Jy5Wx: Int = 0,
    _ uBh9Ca1Zs: [String] = [],
    _ uFm7Xr8Lp: [String] = [],
    _ uFn3Te6Qb: [String] = [],
    _ uLc5Vw2Kd: [String] = [],
    _ uUv8Hp4Nj: [String] = []
  ) {
    self.id = uAx93kL0Q
    self.uZp7Lm2cR = uZp7Lm2cR
    self.uQd8Nv5tK = uQd8Nv5tK
    self.uEs1Fw9Hb = uEs1Fw9Hb
    self.uPk6Tr3Yv = uPk6Tr3Yv
    self.uIq4Uz7Mn = uIq4Uz7Mn
    self.uDg2Jy5Wx = uDg2Jy5Wx
    self.uBh9Ca1Zs = uBh9Ca1Zs
    self.uFm7Xr8Lp = uFm7Xr8Lp
    self.uFn3Te6Qb = uFn3Te6Qb
    self.uLc5Vw2Kd = uLc5Vw2Kd
    self.uUv8Hp4Nj = uUv8Hp4Nj
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .uAx93kL0Q)
    uZp7Lm2cR = try c.decode(String.self, forKey: .uZp7Lm2cR)
    uQd8Nv5tK = try c.decode(String.self, forKey: .uQd8Nv5tK)
    uEs1Fw9Hb = try c.decodeIfPresent(String.self, forKey: .uEs1Fw9Hb)
    uPk6Tr3Yv = try c.decodeIfPresent(String.self, forKey: .uPk6Tr3Yv)
    uIq4Uz7Mn = try c.decodeIfPresent(Bool.self, forKey: .uIq4Uz7Mn) ?? false
    uDg2Jy5Wx = try c.decodeIfPresent(Int.self, forKey: .uDg2Jy5Wx) ?? 0
    uBh9Ca1Zs = try c.decodeIfPresent([String].self, forKey: .uBh9Ca1Zs) ?? []
    uFm7Xr8Lp = try c.decodeIfPresent([String].self, forKey: .uFm7Xr8Lp) ?? []
    uFn3Te6Qb = try c.decodeIfPresent([String].self, forKey: .uFn3Te6Qb) ?? []
    uLc5Vw2Kd = try c.decodeIfPresent([String].self, forKey: .uLc5Vw2Kd) ?? []
    uUv8Hp4Nj = try c.decodeIfPresent([String].self, forKey: .uUv8Hp4Nj) ?? []
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .uAx93kL0Q)
    try c.encode(uZp7Lm2cR, forKey: .uZp7Lm2cR)
    try c.encode(uQd8Nv5tK, forKey: .uQd8Nv5tK)
    try c.encodeIfPresent(uEs1Fw9Hb, forKey: .uEs1Fw9Hb)
    try c.encodeIfPresent(uPk6Tr3Yv, forKey: .uPk6Tr3Yv)
    try c.encode(uIq4Uz7Mn, forKey: .uIq4Uz7Mn)
    try c.encode(uDg2Jy5Wx, forKey: .uDg2Jy5Wx)
    try c.encode(uBh9Ca1Zs, forKey: .uBh9Ca1Zs)
    try c.encode(uFm7Xr8Lp, forKey: .uFm7Xr8Lp)
    try c.encode(uFn3Te6Qb, forKey: .uFn3Te6Qb)
    try c.encode(uLc5Vw2Kd, forKey: .uLc5Vw2Kd)
    try c.encode(uUv8Hp4Nj, forKey: .uUv8Hp4Nj)
  }
}

struct Convs8RlUjf8GEZRmYA: Identifiable, Codable, Equatable {
  let id: String
  let cPu3Ks1Zx: [String]
  var cLm6Er8Cv: String?
  var cUc2Yp5Hd: [String: Int]

  enum CodingKeys: String, CodingKey {
    case cAf9Qw7Le = "c_Af9Qw7Le"
    case cPu3Ks1Zx = "c_Pu3Ks1Zx"
    case cLm6Er8Cv = "c_Lm6Er8Cv"
    case cUc2Yp5Hd = "c_Uc2Yp5Hd"
  }

  init(
    _ cAf9Qw7Le: String,
    _ cPu3Ks1Zx: [String],
    _ cLm6Er8Cv: String? = nil,
    _ cUc2Yp5Hd: [String: Int] = [:]
  ) {
    self.id = cAf9Qw7Le
    self.cPu3Ks1Zx = cPu3Ks1Zx
    self.cLm6Er8Cv = cLm6Er8Cv
    self.cUc2Yp5Hd = cUc2Yp5Hd
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .cAf9Qw7Le)
    cPu3Ks1Zx = try c.decode([String].self, forKey: .cPu3Ks1Zx)
    cLm6Er8Cv = try c.decodeIfPresent(String.self, forKey: .cLm6Er8Cv)
    cUc2Yp5Hd = try c.decodeIfPresent([String: Int].self, forKey: .cUc2Yp5Hd) ?? [:]
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .cAf9Qw7Le)
    try c.encode(cPu3Ks1Zx, forKey: .cPu3Ks1Zx)
    try c.encodeIfPresent(cLm6Er8Cv, forKey: .cLm6Er8Cv)
    try c.encode(cUc2Yp5Hd, forKey: .cUc2Yp5Hd)
  }
}

struct MSgOumAbwJ0MP1dZO: Identifiable, Codable, Equatable {
  enum MessageType: String, Codable, Equatable {
    case text
    case emoji
    case voice
    case image
  }

  let id: String
  let mCv4Ne9Hr: String
  let mUd6Ts3Kw: String
  let mTx2Fp8Vc: String
  let mTy9Gh1Qb: MessageType
  var mIm5Wr7Dz: String?
  var mAu3Nk6Ps: String?
  var mAd8Ls2Vq: Int?
  let mCt7He4Jn: Date

  enum CodingKeys: String, CodingKey {
    case mAx1Qz7Lp = "m_Ax1Qz7Lp"
    case mCv4Ne9Hr = "m_Cv4Ne9Hr"
    case mUd6Ts3Kw = "m_Ud6Ts3Kw"
    case mTx2Fp8Vc = "m_Tx2Fp8Vc"
    case mTy9Gh1Qb = "m_Ty9Gh1Qb"
    case mIm5Wr7Dz = "m_Im5Wr7Dz"
    case mAu3Nk6Ps = "m_Au3Nk6Ps"
    case mAd8Ls2Vq = "m_Ad8Ls2Vq"
    case mCt7He4Jn = "m_Ct7He4Jn"
  }

  init(
    _ mAx1Qz7Lp: String,
    _ mCv4Ne9Hr: String,
    _ mUd6Ts3Kw: String,
    _ mTx2Fp8Vc: String,
    _ mTy9Gh1Qb: MessageType = .text,
    _ mIm5Wr7Dz: String? = nil,
    _ mAu3Nk6Ps: String? = nil,
    _ mAd8Ls2Vq: Int? = nil,
    _ mCt7He4Jn: Date
  ) {
    self.id = mAx1Qz7Lp
    self.mCv4Ne9Hr = mCv4Ne9Hr
    self.mUd6Ts3Kw = mUd6Ts3Kw
    self.mTx2Fp8Vc = mTx2Fp8Vc
    self.mTy9Gh1Qb = mTy9Gh1Qb
    self.mIm5Wr7Dz = mIm5Wr7Dz
    self.mAu3Nk6Ps = mAu3Nk6Ps
    self.mAd8Ls2Vq = mAd8Ls2Vq
    self.mCt7He4Jn = mCt7He4Jn
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .mAx1Qz7Lp)
    mCv4Ne9Hr = try c.decode(String.self, forKey: .mCv4Ne9Hr)
    mUd6Ts3Kw = try c.decode(String.self, forKey: .mUd6Ts3Kw)
    mTx2Fp8Vc = try c.decode(String.self, forKey: .mTx2Fp8Vc)
    mTy9Gh1Qb = try c.decode(MessageType.self, forKey: .mTy9Gh1Qb)
    mIm5Wr7Dz = try c.decodeIfPresent(String.self, forKey: .mIm5Wr7Dz)
    mAu3Nk6Ps = try c.decodeIfPresent(String.self, forKey: .mAu3Nk6Ps)
    mAd8Ls2Vq = try c.decodeIfPresent(Int.self, forKey: .mAd8Ls2Vq)
    mCt7He4Jn = try c.decode(Date.self, forKey: .mCt7He4Jn)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .mAx1Qz7Lp)
    try c.encode(mCv4Ne9Hr, forKey: .mCv4Ne9Hr)
    try c.encode(mUd6Ts3Kw, forKey: .mUd6Ts3Kw)
    try c.encode(mTx2Fp8Vc, forKey: .mTx2Fp8Vc)
    try c.encode(mTy9Gh1Qb, forKey: .mTy9Gh1Qb)
    try c.encodeIfPresent(mIm5Wr7Dz, forKey: .mIm5Wr7Dz)
    try c.encodeIfPresent(mAu3Nk6Ps, forKey: .mAu3Nk6Ps)
    try c.encodeIfPresent(mAd8Ls2Vq, forKey: .mAd8Ls2Vq)
    try c.encode(mCt7He4Jn, forKey: .mCt7He4Jn)
  }

  var isText: Bool { mTy9Gh1Qb == .text }
  var isEmoji: Bool { mTy9Gh1Qb == .emoji }
  var isVoice: Bool { mTy9Gh1Qb == .voice }
  var isImage: Bool { mTy9Gh1Qb == .image }
}

struct DancozZ6LtwXHtlqPu: Identifiable, Codable, Equatable {
  let id: String
  let dUr4Mp7Ks: String
  let dTt6Lf2Vb: String
  let dIn1Xy8Ck: String?
  var dIj5Rs9Hp: Bool
  let dDf7Wq4Zn: String
  let dPc2Hg6Lm: Int
  let dDe8Av3Jr: String

  enum CodingKeys: String, CodingKey {
    case dAc9Qe3Tw = "d_Ac9Qe3Tw"
    case dUr4Mp7Ks = "d_Ur4Mp7Ks"
    case dTt6Lf2Vb = "d_Tt6Lf2Vb"
    case dIn1Xy8Ck = "d_In1Xy8Ck"
    case dIj5Rs9Hp = "d_Ij5Rs9Hp"
    case dDf7Wq4Zn = "d_Df7Wq4Zn"
    case dPc2Hg6Lm = "d_Pc2Hg6Lm"
    case dDe8Av3Jr = "d_De8Av3Jr"
  }

  init(
    _ dAc9Qe3Tw: String,
    _ dUr4Mp7Ks: String,
    _ dTt6Lf2Vb: String,
    _ dIn1Xy8Ck: String?,
    _ dIj5Rs9Hp: Bool,
    _ dDf7Wq4Zn: String,
    _ dPc2Hg6Lm: Int,
    _ dDe8Av3Jr: String
  ) {
    self.id = dAc9Qe3Tw
    self.dUr4Mp7Ks = dUr4Mp7Ks
    self.dTt6Lf2Vb = dTt6Lf2Vb
    self.dIn1Xy8Ck = dIn1Xy8Ck
    self.dIj5Rs9Hp = dIj5Rs9Hp
    self.dDf7Wq4Zn = dDf7Wq4Zn
    self.dPc2Hg6Lm = dPc2Hg6Lm
    self.dDe8Av3Jr = dDe8Av3Jr
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .dAc9Qe3Tw)
    dUr4Mp7Ks = try c.decodeIfPresent(String.self, forKey: .dUr4Mp7Ks) ?? "u1"
    dTt6Lf2Vb = try c.decode(String.self, forKey: .dTt6Lf2Vb)
    dIn1Xy8Ck = try c.decodeIfPresent(String.self, forKey: .dIn1Xy8Ck)
    dIj5Rs9Hp = try c.decode(Bool.self, forKey: .dIj5Rs9Hp)
    dDf7Wq4Zn = try c.decode(String.self, forKey: .dDf7Wq4Zn)
    dPc2Hg6Lm = try c.decode(Int.self, forKey: .dPc2Hg6Lm)
    dDe8Av3Jr = try c.decode(String.self, forKey: .dDe8Av3Jr)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .dAc9Qe3Tw)
    try c.encode(dUr4Mp7Ks, forKey: .dUr4Mp7Ks)
    try c.encode(dTt6Lf2Vb, forKey: .dTt6Lf2Vb)
    try c.encodeIfPresent(dIn1Xy8Ck, forKey: .dIn1Xy8Ck)
    try c.encode(dIj5Rs9Hp, forKey: .dIj5Rs9Hp)
    try c.encode(dDf7Wq4Zn, forKey: .dDf7Wq4Zn)
    try c.encode(dPc2Hg6Lm, forKey: .dPc2Hg6Lm)
    try c.encode(dDe8Av3Jr, forKey: .dDe8Av3Jr)
  }
}

struct Chalvdngt3SE6MdwaZYu: Identifiable, Codable, Equatable {
  let id: String
  let vCh4Ne7Lp: String
  let vUv6Fr1Qd: String
  let vTn3Hw8Zc: String?
  let vVn7Px5Lm: String?
  var vLc1Gy9Ht: Int
  let vIl8Ks4Bw: Bool
  let vUd5Rp2Xy: Int?

  enum CodingKeys: String, CodingKey {
    case vAv9Qk2Ts = "v_Av9Qk2Ts"
    case vCh4Ne7Lp = "v_Ch4Ne7Lp"
    case vUv6Fr1Qd = "v_Uv6Fr1Qd"
    case vTn3Hw8Zc = "v_Tn3Hw8Zc"
    case vVn7Px5Lm = "v_Vn7Px5Lm"
    case vLc1Gy9Ht = "v_Lc1Gy9Ht"
    case vIl8Ks4Bw = "v_Il8Ks4Bw"
    case vUd5Rp2Xy = "v_Ud5Rp2Xy"
  }

  init(
    _ vAv9Qk2Ts: String,
    _ vCh4Ne7Lp: String,
    _ vUv6Fr1Qd: String,
    _ vTn3Hw8Zc: String?,
    _ vVn7Px5Lm: String? = nil,
    _ vLc1Gy9Ht: Int,
    _ vIl8Ks4Bw: Bool,
    _ vUd5Rp2Xy: Int?
  ) {
    self.id = vAv9Qk2Ts
    self.vCh4Ne7Lp = vCh4Ne7Lp
    self.vUv6Fr1Qd = vUv6Fr1Qd
    self.vTn3Hw8Zc = vTn3Hw8Zc
    self.vVn7Px5Lm = vVn7Px5Lm
    self.vLc1Gy9Ht = vLc1Gy9Ht
    self.vIl8Ks4Bw = vIl8Ks4Bw
    self.vUd5Rp2Xy = vUd5Rp2Xy
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .vAv9Qk2Ts)
    vCh4Ne7Lp = try c.decode(String.self, forKey: .vCh4Ne7Lp)
    vUv6Fr1Qd = try c.decodeIfPresent(String.self, forKey: .vUv6Fr1Qd) ?? "u6"
    vTn3Hw8Zc = try c.decodeIfPresent(String.self, forKey: .vTn3Hw8Zc)
    vVn7Px5Lm = try c.decodeIfPresent(String.self, forKey: .vVn7Px5Lm)
    vLc1Gy9Ht = try c.decode(Int.self, forKey: .vLc1Gy9Ht)
    vIl8Ks4Bw = try c.decode(Bool.self, forKey: .vIl8Ks4Bw)
    vUd5Rp2Xy = try c.decodeIfPresent(Int.self, forKey: .vUd5Rp2Xy)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .vAv9Qk2Ts)
    try c.encode(vCh4Ne7Lp, forKey: .vCh4Ne7Lp)
    try c.encode(vUv6Fr1Qd, forKey: .vUv6Fr1Qd)
    try c.encodeIfPresent(vTn3Hw8Zc, forKey: .vTn3Hw8Zc)
    try c.encodeIfPresent(vVn7Px5Lm, forKey: .vVn7Px5Lm)
    try c.encode(vLc1Gy9Ht, forKey: .vLc1Gy9Ht)
    try c.encode(vIl8Ks4Bw, forKey: .vIl8Ks4Bw)
    try c.encodeIfPresent(vUd5Rp2Xy, forKey: .vUd5Rp2Xy)
  }

  var likeCountFormatted: String {
    if vLc1Gy9Ht >= 10_000 {
      let w = Double(vLc1Gy9Ht) / 10_000
      return String(format: "%.1fW", w)
    }
    return "\(vLc1Gy9Ht)"
  }

}

struct CPolpIKsl1mUtFVfy: Identifiable, Codable, Equatable {
  let id: String
  let pUp4Mx7Cs: String
  let pIn6Fw1Zd: String
  var pDs2Hv8Qp: String
  var pTg7Rx5Bn: [String]
  var pLc3Gy9Wk: Int
  var pCc8Jt4Vm: Int
  let pCt1Nz6Hp: Date

  enum CodingKeys: String, CodingKey {
    case pAp9Qz3Lk = "p_Ap9Qz3Lk"
    case pUp4Mx7Cs = "p_Up4Mx7Cs"
    case pIn6Fw1Zd = "p_In6Fw1Zd"
    case pDs2Hv8Qp = "p_Ds2Hv8Qp"
    case pTg7Rx5Bn = "p_Tg7Rx5Bn"
    case pLc3Gy9Wk = "p_Lc3Gy9Wk"
    case pCc8Jt4Vm = "p_Cc8Jt4Vm"
    case pCt1Nz6Hp = "p_Ct1Nz6Hp"
  }

  init(
    _ pAp9Qz3Lk: String,
    _ pUp4Mx7Cs: String,
    _ pIn6Fw1Zd: String,
    _ pDs2Hv8Qp: String,
    _ pTg7Rx5Bn: [String],
    _ pLc3Gy9Wk: Int,
    _ pCc8Jt4Vm: Int,
    _ pCt1Nz6Hp: Date
  ) {
    self.id = pAp9Qz3Lk
    self.pUp4Mx7Cs = pUp4Mx7Cs
    self.pIn6Fw1Zd = pIn6Fw1Zd
    self.pDs2Hv8Qp = pDs2Hv8Qp
    self.pTg7Rx5Bn = pTg7Rx5Bn
    self.pLc3Gy9Wk = pLc3Gy9Wk
    self.pCc8Jt4Vm = pCc8Jt4Vm
    self.pCt1Nz6Hp = pCt1Nz6Hp
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .pAp9Qz3Lk)
    pUp4Mx7Cs = try c.decode(String.self, forKey: .pUp4Mx7Cs)
    pIn6Fw1Zd = try c.decode(String.self, forKey: .pIn6Fw1Zd)
    pDs2Hv8Qp = try c.decode(String.self, forKey: .pDs2Hv8Qp)
    pTg7Rx5Bn = try c.decode([String].self, forKey: .pTg7Rx5Bn)
    pLc3Gy9Wk = try c.decodeIfPresent(Int.self, forKey: .pLc3Gy9Wk) ?? 0
    pCc8Jt4Vm = try c.decodeIfPresent(Int.self, forKey: .pCc8Jt4Vm) ?? 0
    pCt1Nz6Hp = try c.decode(Date.self, forKey: .pCt1Nz6Hp)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .pAp9Qz3Lk)
    try c.encode(pUp4Mx7Cs, forKey: .pUp4Mx7Cs)
    try c.encode(pIn6Fw1Zd, forKey: .pIn6Fw1Zd)
    try c.encode(pDs2Hv8Qp, forKey: .pDs2Hv8Qp)
    try c.encode(pTg7Rx5Bn, forKey: .pTg7Rx5Bn)
    try c.encode(pLc3Gy9Wk, forKey: .pLc3Gy9Wk)
    try c.encode(pCc8Jt4Vm, forKey: .pCc8Jt4Vm)
    try c.encode(pCt1Nz6Hp, forKey: .pCt1Nz6Hp)
  }

  var dateString: String {
    let f = DateFormatter()
    f.dateFormat = "MM-dd"
    return f.string(from: pCt1Nz6Hp)
  }
}

struct CommunityCommentModel: Identifiable, Codable, Equatable {
  let id: String
  let cmPo4Ne7Lk: String
  let cmUc6Fr1Qx: String
  let cmTx3Hv8Pd: String
  let cmCt7Jz5Wn: Date

  enum CodingKeys: String, CodingKey {
    case cmAc9Qm2Ts = "cm_Ac9Qm2Ts"
    case cmPo4Ne7Lk = "cm_Po4Ne7Lk"
    case cmUc6Fr1Qx = "cm_Uc6Fr1Qx"
    case cmTx3Hv8Pd = "cm_Tx3Hv8Pd"
    case cmCt7Jz5Wn = "cm_Ct7Jz5Wn"
  }

  init(
    _ cmAc9Qm2Ts: String,
    _ cmPo4Ne7Lk: String,
    _ cmUc6Fr1Qx: String,
    _ cmTx3Hv8Pd: String,
    _ cmCt7Jz5Wn: Date
  ) {
    self.id = cmAc9Qm2Ts
    self.cmPo4Ne7Lk = cmPo4Ne7Lk
    self.cmUc6Fr1Qx = cmUc6Fr1Qx
    self.cmTx3Hv8Pd = cmTx3Hv8Pd
    self.cmCt7Jz5Wn = cmCt7Jz5Wn
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    id = try c.decode(String.self, forKey: .cmAc9Qm2Ts)
    cmPo4Ne7Lk = try c.decode(String.self, forKey: .cmPo4Ne7Lk)
    cmUc6Fr1Qx = try c.decode(String.self, forKey: .cmUc6Fr1Qx)
    cmTx3Hv8Pd = try c.decode(String.self, forKey: .cmTx3Hv8Pd)
    cmCt7Jz5Wn = try c.decode(Date.self, forKey: .cmCt7Jz5Wn)
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(id, forKey: .cmAc9Qm2Ts)
    try c.encode(cmPo4Ne7Lk, forKey: .cmPo4Ne7Lk)
    try c.encode(cmUc6Fr1Qx, forKey: .cmUc6Fr1Qx)
    try c.encode(cmTx3Hv8Pd, forKey: .cmTx3Hv8Pd)
    try c.encode(cmCt7Jz5Wn, forKey: .cmCt7Jz5Wn)
  }

  var dateString: String {
    let f = DateFormatter()
    f.dateFormat = "MM-dd"
    return f.string(from: cmCt7Jz5Wn)
  }
}

struct AdatJc1Zwhy2Od8kjZ: Codable, Equatable {
  var adUr9Mz3Qc: [UserteYT4uBeg4ObJP]
  var adCh2Hx7Wn: [DancozZ6LtwXHtlqPu]
  var adCv5Jt8Lp: [Chalvdngt3SE6MdwaZYu]
  var adPs6Gk1Rv: [CPolpIKsl1mUtFVfy]
  var adCm3Bc9Nx: [CommunityCommentModel]
  var adCo7Df2Qs: [Convs8RlUjf8GEZRmYA]
  var adMs8Lw4Ty: [MSgOumAbwJ0MP1dZO]
  var adCu1Zp6Hm: String?
  var adQk4Nr9Vx: String? = nil
  var adHa2Yt5Jb: Bool = false

  enum CodingKeys: String, CodingKey {
    case adUr9Mz3Qc = "ad_Ur9Mz3Qc"
    case adCh2Hx7Wn = "ad_Ch2Hx7Wn"
    case adCv5Jt8Lp = "ad_Cv5Jt8Lp"
    case adPs6Gk1Rv = "ad_Ps6Gk1Rv"
    case adCm3Bc9Nx = "ad_Cm3Bc9Nx"
    case adCo7Df2Qs = "ad_Co7Df2Qs"
    case adMs8Lw4Ty = "ad_Ms8Lw4Ty"
    case adCu1Zp6Hm = "ad_Cu1Zp6Hm"
    case adQk4Nr9Vx = "ad_Qk4Nr9Vx"
    case adHa2Yt5Jb = "ad_Ha2Yt5Jb"
    case legacyUsers = "users"
    case legacyChallenges = "challenges"
    case legacyChallengeVideos = "challengeVideos"
    case legacyCommunityPosts = "communityPosts"
    case legacyCommunityComments = "communityComments"
    case legacyConversations = "conversations"
    case legacyMessages = "messages"
    case legacyCurrentUserId = "currentUserId"
    case legacyQuickLoginUserId = "quickLoginUserId"
    case legacyHasAcceptedEULA = "hasAcceptedEULA"
  }

  init(
    _ adUr9Mz3Qc: [UserteYT4uBeg4ObJP],
    _ adCh2Hx7Wn: [DancozZ6LtwXHtlqPu],
    _ adCv5Jt8Lp: [Chalvdngt3SE6MdwaZYu],
    _ adPs6Gk1Rv: [CPolpIKsl1mUtFVfy],
    _ adCm3Bc9Nx: [CommunityCommentModel],
    _ adCo7Df2Qs: [Convs8RlUjf8GEZRmYA],
    _ adMs8Lw4Ty: [MSgOumAbwJ0MP1dZO],
    _ adCu1Zp6Hm: String?,
    _ adQk4Nr9Vx: String? = nil,
    _ adHa2Yt5Jb: Bool = false
  ) {
    self.adUr9Mz3Qc = adUr9Mz3Qc
    self.adCh2Hx7Wn = adCh2Hx7Wn
    self.adCv5Jt8Lp = adCv5Jt8Lp
    self.adPs6Gk1Rv = adPs6Gk1Rv
    self.adCm3Bc9Nx = adCm3Bc9Nx
    self.adCo7Df2Qs = adCo7Df2Qs
    self.adMs8Lw4Ty = adMs8Lw4Ty
    self.adCu1Zp6Hm = adCu1Zp6Hm
    self.adQk4Nr9Vx = adQk4Nr9Vx
    self.adHa2Yt5Jb = adHa2Yt5Jb
  }

  init(from decoder: Decoder) throws {
    let c = try decoder.container(keyedBy: CodingKeys.self)
    if let v = try? c.decode([UserteYT4uBeg4ObJP].self, forKey: .adUr9Mz3Qc) {
      adUr9Mz3Qc = v
    } else {
      adUr9Mz3Qc = try c.decode([UserteYT4uBeg4ObJP].self, forKey: .legacyUsers)
    }
    adCh2Hx7Wn =
      (try? c.decodeIfPresent([DancozZ6LtwXHtlqPu].self, forKey: .adCh2Hx7Wn))
      ?? (try? c.decodeIfPresent([DancozZ6LtwXHtlqPu].self, forKey: .legacyChallenges)) ?? []
    adCv5Jt8Lp =
      (try? c.decodeIfPresent([Chalvdngt3SE6MdwaZYu].self, forKey: .adCv5Jt8Lp))
      ?? (try? c.decodeIfPresent([Chalvdngt3SE6MdwaZYu].self, forKey: .legacyChallengeVideos)) ?? []
    adPs6Gk1Rv =
      (try? c.decodeIfPresent([CPolpIKsl1mUtFVfy].self, forKey: .adPs6Gk1Rv))
      ?? (try? c.decodeIfPresent([CPolpIKsl1mUtFVfy].self, forKey: .legacyCommunityPosts)) ?? []
    adCm3Bc9Nx =
      (try? c.decodeIfPresent([CommunityCommentModel].self, forKey: .adCm3Bc9Nx))
      ?? (try? c.decodeIfPresent([CommunityCommentModel].self, forKey: .legacyCommunityComments))
      ?? []
    if let v = try? c.decode([Convs8RlUjf8GEZRmYA].self, forKey: .adCo7Df2Qs) {
      adCo7Df2Qs = v
    } else {
      adCo7Df2Qs = try c.decode([Convs8RlUjf8GEZRmYA].self, forKey: .legacyConversations)
    }
    if let v = try? c.decode([MSgOumAbwJ0MP1dZO].self, forKey: .adMs8Lw4Ty) {
      adMs8Lw4Ty = v
    } else {
      adMs8Lw4Ty = try c.decode([MSgOumAbwJ0MP1dZO].self, forKey: .legacyMessages)
    }
    adCu1Zp6Hm =
      (try? c.decodeIfPresent(String.self, forKey: .adCu1Zp6Hm))
      ?? (try? c.decodeIfPresent(String.self, forKey: .legacyCurrentUserId))
    adQk4Nr9Vx =
      (try? c.decodeIfPresent(String.self, forKey: .adQk4Nr9Vx))
      ?? (try? c.decodeIfPresent(String.self, forKey: .legacyQuickLoginUserId))
    if let v = try? c.decode(Bool.self, forKey: .adHa2Yt5Jb) {
      adHa2Yt5Jb = v
    } else {
      adHa2Yt5Jb =
        (try? c.decodeIfPresent(Bool.self, forKey: .legacyHasAcceptedEULA)) ?? false
    }
  }

  func encode(to encoder: Encoder) throws {
    var c = encoder.container(keyedBy: CodingKeys.self)
    try c.encode(adUr9Mz3Qc, forKey: .adUr9Mz3Qc)
    try c.encode(adCh2Hx7Wn, forKey: .adCh2Hx7Wn)
    try c.encode(adCv5Jt8Lp, forKey: .adCv5Jt8Lp)
    try c.encode(adPs6Gk1Rv, forKey: .adPs6Gk1Rv)
    try c.encode(adCm3Bc9Nx, forKey: .adCm3Bc9Nx)
    try c.encode(adCo7Df2Qs, forKey: .adCo7Df2Qs)
    try c.encode(adMs8Lw4Ty, forKey: .adMs8Lw4Ty)
    try c.encodeIfPresent(adCu1Zp6Hm, forKey: .adCu1Zp6Hm)
    try c.encodeIfPresent(adQk4Nr9Vx, forKey: .adQk4Nr9Vx)
    try c.encode(adHa2Yt5Jb, forKey: .adHa2Yt5Jb)
  }
}
