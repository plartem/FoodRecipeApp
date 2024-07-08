// swift-format-ignore-file
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal enum AuthProvider {
    internal static let apple = ImageAsset(name: "AuthProvider/apple")
    internal static let facebook = ImageAsset(name: "AuthProvider/facebook")
    internal static let google = ImageAsset(name: "AuthProvider/google")
  }
  internal enum Button {
    internal static let disabledOverlayColor = ColorAsset(name: "Button/DisabledOverlayColor")
    internal enum Normal {
      internal static let background = ColorAsset(name: "Button/Normal/Background")
      internal static let border = ColorAsset(name: "Button/Normal/Border")
      internal static let color = ColorAsset(name: "Button/Normal/Color")
    }
    internal enum NormalIcon {
      internal static let background = ColorAsset(name: "Button/NormalIcon/Background")
      internal static let border = ColorAsset(name: "Button/NormalIcon/Border")
      internal static let color = ColorAsset(name: "Button/NormalIcon/Color")
    }
    internal enum Primary {
      internal static let background = ColorAsset(name: "Button/Primary/Background")
      internal static let border = ColorAsset(name: "Button/Primary/Border")
      internal static let color = ColorAsset(name: "Button/Primary/Color")
    }
    internal enum PrimaryIcon {
      internal static let background = ColorAsset(name: "Button/PrimaryIcon/Background")
      internal static let border = ColorAsset(name: "Button/PrimaryIcon/Border")
      internal static let color = ColorAsset(name: "Button/PrimaryIcon/Color")
    }
    internal enum PrimaryIconCircle {
      internal static let background = ColorAsset(name: "Button/PrimaryIconCircle/Background")
      internal static let border = ColorAsset(name: "Button/PrimaryIconCircle/Border")
      internal static let color = ColorAsset(name: "Button/PrimaryIconCircle/Color")
    }
    internal enum Secondary {
      internal static let background = ColorAsset(name: "Button/Secondary/Background")
      internal static let border = ColorAsset(name: "Button/Secondary/Border")
      internal static let color = ColorAsset(name: "Button/Secondary/Color")
    }
  }
  internal static let dividerColor = ColorAsset(name: "DividerColor")
  internal enum Picker {
    internal static let background = ColorAsset(name: "Picker/Background")
    internal static let border = ColorAsset(name: "Picker/Border")
    internal static let selectedBorder = ColorAsset(name: "Picker/SelectedBorder")
  }
  internal static let primaryBackground = ColorAsset(name: "PrimaryBackground")
  internal static let primaryColor = ColorAsset(name: "PrimaryColor")
  internal static let recipeCardBorder = ColorAsset(name: "RecipeCardBorder")
  internal static let secondaryBackground = ColorAsset(name: "SecondaryBackground")
  internal static let secondaryColor = ColorAsset(name: "SecondaryColor")
  internal static let tertiaryColor = ColorAsset(name: "TertiaryColor")
  internal enum Toast {
    internal enum Error {
      internal static let background = ColorAsset(name: "Toast/Error/Background")
      internal static let foreground = ColorAsset(name: "Toast/Error/Foreground")
    }
    internal enum Success {
      internal static let background = ColorAsset(name: "Toast/Success/Background")
      internal static let foreground = ColorAsset(name: "Toast/Success/Foreground")
    }
  }
  internal enum Toggle {
    internal static let checkmarkColor = ColorAsset(name: "Toggle/CheckmarkColor")
    internal static let rectColor = ColorAsset(name: "Toggle/RectColor")
  }
  internal enum CountryFlag {
    internal static let ad = ImageAsset(name: "CountryFlag/ad")
    internal static let ae = ImageAsset(name: "CountryFlag/ae")
    internal static let af = ImageAsset(name: "CountryFlag/af")
    internal static let ag = ImageAsset(name: "CountryFlag/ag")
    internal static let ai = ImageAsset(name: "CountryFlag/ai")
    internal static let al = ImageAsset(name: "CountryFlag/al")
    internal static let am = ImageAsset(name: "CountryFlag/am")
    internal static let ao = ImageAsset(name: "CountryFlag/ao")
    internal static let aq = ImageAsset(name: "CountryFlag/aq")
    internal static let ar = ImageAsset(name: "CountryFlag/ar")
    internal static let `as` = ImageAsset(name: "CountryFlag/as")
    internal static let at = ImageAsset(name: "CountryFlag/at")
    internal static let au = ImageAsset(name: "CountryFlag/au")
    internal static let aw = ImageAsset(name: "CountryFlag/aw")
    internal static let ax = ImageAsset(name: "CountryFlag/ax")
    internal static let az = ImageAsset(name: "CountryFlag/az")
    internal static let ba = ImageAsset(name: "CountryFlag/ba")
    internal static let bb = ImageAsset(name: "CountryFlag/bb")
    internal static let bd = ImageAsset(name: "CountryFlag/bd")
    internal static let be = ImageAsset(name: "CountryFlag/be")
    internal static let bf = ImageAsset(name: "CountryFlag/bf")
    internal static let bg = ImageAsset(name: "CountryFlag/bg")
    internal static let bh = ImageAsset(name: "CountryFlag/bh")
    internal static let bi = ImageAsset(name: "CountryFlag/bi")
    internal static let bj = ImageAsset(name: "CountryFlag/bj")
    internal static let bl = ImageAsset(name: "CountryFlag/bl")
    internal static let bm = ImageAsset(name: "CountryFlag/bm")
    internal static let bn = ImageAsset(name: "CountryFlag/bn")
    internal static let bo = ImageAsset(name: "CountryFlag/bo")
    internal static let bq = ImageAsset(name: "CountryFlag/bq")
    internal static let br = ImageAsset(name: "CountryFlag/br")
    internal static let bs = ImageAsset(name: "CountryFlag/bs")
    internal static let bt = ImageAsset(name: "CountryFlag/bt")
    internal static let bv = ImageAsset(name: "CountryFlag/bv")
    internal static let bw = ImageAsset(name: "CountryFlag/bw")
    internal static let by = ImageAsset(name: "CountryFlag/by")
    internal static let bz = ImageAsset(name: "CountryFlag/bz")
    internal static let ca = ImageAsset(name: "CountryFlag/ca")
    internal static let cc = ImageAsset(name: "CountryFlag/cc")
    internal static let cd = ImageAsset(name: "CountryFlag/cd")
    internal static let cf = ImageAsset(name: "CountryFlag/cf")
    internal static let cg = ImageAsset(name: "CountryFlag/cg")
    internal static let ch = ImageAsset(name: "CountryFlag/ch")
    internal static let ci = ImageAsset(name: "CountryFlag/ci")
    internal static let ck = ImageAsset(name: "CountryFlag/ck")
    internal static let cl = ImageAsset(name: "CountryFlag/cl")
    internal static let cm = ImageAsset(name: "CountryFlag/cm")
    internal static let cn = ImageAsset(name: "CountryFlag/cn")
    internal static let co = ImageAsset(name: "CountryFlag/co")
    internal static let cr = ImageAsset(name: "CountryFlag/cr")
    internal static let cu = ImageAsset(name: "CountryFlag/cu")
    internal static let cv = ImageAsset(name: "CountryFlag/cv")
    internal static let cw = ImageAsset(name: "CountryFlag/cw")
    internal static let cx = ImageAsset(name: "CountryFlag/cx")
    internal static let cy = ImageAsset(name: "CountryFlag/cy")
    internal static let cz = ImageAsset(name: "CountryFlag/cz")
    internal static let de = ImageAsset(name: "CountryFlag/de")
    internal static let dj = ImageAsset(name: "CountryFlag/dj")
    internal static let dk = ImageAsset(name: "CountryFlag/dk")
    internal static let dm = ImageAsset(name: "CountryFlag/dm")
    internal static let `do` = ImageAsset(name: "CountryFlag/do")
    internal static let dz = ImageAsset(name: "CountryFlag/dz")
    internal static let ec = ImageAsset(name: "CountryFlag/ec")
    internal static let ee = ImageAsset(name: "CountryFlag/ee")
    internal static let eg = ImageAsset(name: "CountryFlag/eg")
    internal static let eh = ImageAsset(name: "CountryFlag/eh")
    internal static let er = ImageAsset(name: "CountryFlag/er")
    internal static let es = ImageAsset(name: "CountryFlag/es")
    internal static let et = ImageAsset(name: "CountryFlag/et")
    internal static let eu = ImageAsset(name: "CountryFlag/eu")
    internal static let fi = ImageAsset(name: "CountryFlag/fi")
    internal static let fj = ImageAsset(name: "CountryFlag/fj")
    internal static let fk = ImageAsset(name: "CountryFlag/fk")
    internal static let fm = ImageAsset(name: "CountryFlag/fm")
    internal static let fo = ImageAsset(name: "CountryFlag/fo")
    internal static let fr = ImageAsset(name: "CountryFlag/fr")
    internal static let ga = ImageAsset(name: "CountryFlag/ga")
    internal static let gbEng = ImageAsset(name: "CountryFlag/gb-eng")
    internal static let gbNir = ImageAsset(name: "CountryFlag/gb-nir")
    internal static let gbSct = ImageAsset(name: "CountryFlag/gb-sct")
    internal static let gbWls = ImageAsset(name: "CountryFlag/gb-wls")
    internal static let gb = ImageAsset(name: "CountryFlag/gb")
    internal static let gd = ImageAsset(name: "CountryFlag/gd")
    internal static let ge = ImageAsset(name: "CountryFlag/ge")
    internal static let gf = ImageAsset(name: "CountryFlag/gf")
    internal static let gg = ImageAsset(name: "CountryFlag/gg")
    internal static let gh = ImageAsset(name: "CountryFlag/gh")
    internal static let gi = ImageAsset(name: "CountryFlag/gi")
    internal static let gl = ImageAsset(name: "CountryFlag/gl")
    internal static let gm = ImageAsset(name: "CountryFlag/gm")
    internal static let gn = ImageAsset(name: "CountryFlag/gn")
    internal static let gp = ImageAsset(name: "CountryFlag/gp")
    internal static let gq = ImageAsset(name: "CountryFlag/gq")
    internal static let gr = ImageAsset(name: "CountryFlag/gr")
    internal static let gs = ImageAsset(name: "CountryFlag/gs")
    internal static let gt = ImageAsset(name: "CountryFlag/gt")
    internal static let gu = ImageAsset(name: "CountryFlag/gu")
    internal static let gw = ImageAsset(name: "CountryFlag/gw")
    internal static let gy = ImageAsset(name: "CountryFlag/gy")
    internal static let hk = ImageAsset(name: "CountryFlag/hk")
    internal static let hm = ImageAsset(name: "CountryFlag/hm")
    internal static let hn = ImageAsset(name: "CountryFlag/hn")
    internal static let hr = ImageAsset(name: "CountryFlag/hr")
    internal static let ht = ImageAsset(name: "CountryFlag/ht")
    internal static let hu = ImageAsset(name: "CountryFlag/hu")
    internal static let id = ImageAsset(name: "CountryFlag/id")
    internal static let ie = ImageAsset(name: "CountryFlag/ie")
    internal static let il = ImageAsset(name: "CountryFlag/il")
    internal static let im = ImageAsset(name: "CountryFlag/im")
    internal static let `in` = ImageAsset(name: "CountryFlag/in")
    internal static let io = ImageAsset(name: "CountryFlag/io")
    internal static let iq = ImageAsset(name: "CountryFlag/iq")
    internal static let ir = ImageAsset(name: "CountryFlag/ir")
    internal static let `is` = ImageAsset(name: "CountryFlag/is")
    internal static let it = ImageAsset(name: "CountryFlag/it")
    internal static let je = ImageAsset(name: "CountryFlag/je")
    internal static let jm = ImageAsset(name: "CountryFlag/jm")
    internal static let jo = ImageAsset(name: "CountryFlag/jo")
    internal static let jp = ImageAsset(name: "CountryFlag/jp")
    internal static let ke = ImageAsset(name: "CountryFlag/ke")
    internal static let kg = ImageAsset(name: "CountryFlag/kg")
    internal static let kh = ImageAsset(name: "CountryFlag/kh")
    internal static let ki = ImageAsset(name: "CountryFlag/ki")
    internal static let km = ImageAsset(name: "CountryFlag/km")
    internal static let kn = ImageAsset(name: "CountryFlag/kn")
    internal static let kp = ImageAsset(name: "CountryFlag/kp")
    internal static let kr = ImageAsset(name: "CountryFlag/kr")
    internal static let kw = ImageAsset(name: "CountryFlag/kw")
    internal static let ky = ImageAsset(name: "CountryFlag/ky")
    internal static let kz = ImageAsset(name: "CountryFlag/kz")
    internal static let la = ImageAsset(name: "CountryFlag/la")
    internal static let lb = ImageAsset(name: "CountryFlag/lb")
    internal static let lc = ImageAsset(name: "CountryFlag/lc")
    internal static let li = ImageAsset(name: "CountryFlag/li")
    internal static let lk = ImageAsset(name: "CountryFlag/lk")
    internal static let lr = ImageAsset(name: "CountryFlag/lr")
    internal static let ls = ImageAsset(name: "CountryFlag/ls")
    internal static let lt = ImageAsset(name: "CountryFlag/lt")
    internal static let lu = ImageAsset(name: "CountryFlag/lu")
    internal static let lv = ImageAsset(name: "CountryFlag/lv")
    internal static let ly = ImageAsset(name: "CountryFlag/ly")
    internal static let ma = ImageAsset(name: "CountryFlag/ma")
    internal static let mc = ImageAsset(name: "CountryFlag/mc")
    internal static let md = ImageAsset(name: "CountryFlag/md")
    internal static let me = ImageAsset(name: "CountryFlag/me")
    internal static let mf = ImageAsset(name: "CountryFlag/mf")
    internal static let mg = ImageAsset(name: "CountryFlag/mg")
    internal static let mh = ImageAsset(name: "CountryFlag/mh")
    internal static let mk = ImageAsset(name: "CountryFlag/mk")
    internal static let ml = ImageAsset(name: "CountryFlag/ml")
    internal static let mm = ImageAsset(name: "CountryFlag/mm")
    internal static let mn = ImageAsset(name: "CountryFlag/mn")
    internal static let mo = ImageAsset(name: "CountryFlag/mo")
    internal static let mp = ImageAsset(name: "CountryFlag/mp")
    internal static let mq = ImageAsset(name: "CountryFlag/mq")
    internal static let mr = ImageAsset(name: "CountryFlag/mr")
    internal static let ms = ImageAsset(name: "CountryFlag/ms")
    internal static let mt = ImageAsset(name: "CountryFlag/mt")
    internal static let mu = ImageAsset(name: "CountryFlag/mu")
    internal static let mv = ImageAsset(name: "CountryFlag/mv")
    internal static let mw = ImageAsset(name: "CountryFlag/mw")
    internal static let mx = ImageAsset(name: "CountryFlag/mx")
    internal static let my = ImageAsset(name: "CountryFlag/my")
    internal static let mz = ImageAsset(name: "CountryFlag/mz")
    internal static let na = ImageAsset(name: "CountryFlag/na")
    internal static let nc = ImageAsset(name: "CountryFlag/nc")
    internal static let ne = ImageAsset(name: "CountryFlag/ne")
    internal static let nf = ImageAsset(name: "CountryFlag/nf")
    internal static let ng = ImageAsset(name: "CountryFlag/ng")
    internal static let ni = ImageAsset(name: "CountryFlag/ni")
    internal static let nl = ImageAsset(name: "CountryFlag/nl")
    internal static let no = ImageAsset(name: "CountryFlag/no")
    internal static let np = ImageAsset(name: "CountryFlag/np")
    internal static let nr = ImageAsset(name: "CountryFlag/nr")
    internal static let nu = ImageAsset(name: "CountryFlag/nu")
    internal static let nz = ImageAsset(name: "CountryFlag/nz")
    internal static let om = ImageAsset(name: "CountryFlag/om")
    internal static let pa = ImageAsset(name: "CountryFlag/pa")
    internal static let pe = ImageAsset(name: "CountryFlag/pe")
    internal static let pf = ImageAsset(name: "CountryFlag/pf")
    internal static let pg = ImageAsset(name: "CountryFlag/pg")
    internal static let ph = ImageAsset(name: "CountryFlag/ph")
    internal static let pk = ImageAsset(name: "CountryFlag/pk")
    internal static let pl = ImageAsset(name: "CountryFlag/pl")
    internal static let pm = ImageAsset(name: "CountryFlag/pm")
    internal static let pn = ImageAsset(name: "CountryFlag/pn")
    internal static let pr = ImageAsset(name: "CountryFlag/pr")
    internal static let ps = ImageAsset(name: "CountryFlag/ps")
    internal static let pt = ImageAsset(name: "CountryFlag/pt")
    internal static let pw = ImageAsset(name: "CountryFlag/pw")
    internal static let py = ImageAsset(name: "CountryFlag/py")
    internal static let qa = ImageAsset(name: "CountryFlag/qa")
    internal static let re = ImageAsset(name: "CountryFlag/re")
    internal static let ro = ImageAsset(name: "CountryFlag/ro")
    internal static let rs = ImageAsset(name: "CountryFlag/rs")
    internal static let ru = ImageAsset(name: "CountryFlag/ru")
    internal static let rw = ImageAsset(name: "CountryFlag/rw")
    internal static let sa = ImageAsset(name: "CountryFlag/sa")
    internal static let sb = ImageAsset(name: "CountryFlag/sb")
    internal static let sc = ImageAsset(name: "CountryFlag/sc")
    internal static let sd = ImageAsset(name: "CountryFlag/sd")
    internal static let se = ImageAsset(name: "CountryFlag/se")
    internal static let sg = ImageAsset(name: "CountryFlag/sg")
    internal static let sh = ImageAsset(name: "CountryFlag/sh")
    internal static let si = ImageAsset(name: "CountryFlag/si")
    internal static let sj = ImageAsset(name: "CountryFlag/sj")
    internal static let sk = ImageAsset(name: "CountryFlag/sk")
    internal static let sl = ImageAsset(name: "CountryFlag/sl")
    internal static let sm = ImageAsset(name: "CountryFlag/sm")
    internal static let sn = ImageAsset(name: "CountryFlag/sn")
    internal static let so = ImageAsset(name: "CountryFlag/so")
    internal static let sr = ImageAsset(name: "CountryFlag/sr")
    internal static let ss = ImageAsset(name: "CountryFlag/ss")
    internal static let st = ImageAsset(name: "CountryFlag/st")
    internal static let sv = ImageAsset(name: "CountryFlag/sv")
    internal static let sx = ImageAsset(name: "CountryFlag/sx")
    internal static let sy = ImageAsset(name: "CountryFlag/sy")
    internal static let sz = ImageAsset(name: "CountryFlag/sz")
    internal static let tc = ImageAsset(name: "CountryFlag/tc")
    internal static let td = ImageAsset(name: "CountryFlag/td")
    internal static let tf = ImageAsset(name: "CountryFlag/tf")
    internal static let tg = ImageAsset(name: "CountryFlag/tg")
    internal static let th = ImageAsset(name: "CountryFlag/th")
    internal static let tj = ImageAsset(name: "CountryFlag/tj")
    internal static let tk = ImageAsset(name: "CountryFlag/tk")
    internal static let tl = ImageAsset(name: "CountryFlag/tl")
    internal static let tm = ImageAsset(name: "CountryFlag/tm")
    internal static let tn = ImageAsset(name: "CountryFlag/tn")
    internal static let to = ImageAsset(name: "CountryFlag/to")
    internal static let tr = ImageAsset(name: "CountryFlag/tr")
    internal static let tt = ImageAsset(name: "CountryFlag/tt")
    internal static let tv = ImageAsset(name: "CountryFlag/tv")
    internal static let tw = ImageAsset(name: "CountryFlag/tw")
    internal static let tz = ImageAsset(name: "CountryFlag/tz")
    internal static let ua = ImageAsset(name: "CountryFlag/ua")
    internal static let ug = ImageAsset(name: "CountryFlag/ug")
    internal static let um = ImageAsset(name: "CountryFlag/um")
    internal static let us = ImageAsset(name: "CountryFlag/us")
    internal static let uy = ImageAsset(name: "CountryFlag/uy")
    internal static let uz = ImageAsset(name: "CountryFlag/uz")
    internal static let va = ImageAsset(name: "CountryFlag/va")
    internal static let vc = ImageAsset(name: "CountryFlag/vc")
    internal static let ve = ImageAsset(name: "CountryFlag/ve")
    internal static let vg = ImageAsset(name: "CountryFlag/vg")
    internal static let vi = ImageAsset(name: "CountryFlag/vi")
    internal static let vn = ImageAsset(name: "CountryFlag/vn")
    internal static let vu = ImageAsset(name: "CountryFlag/vu")
    internal static let wf = ImageAsset(name: "CountryFlag/wf")
    internal static let ws = ImageAsset(name: "CountryFlag/ws")
    internal static let xk = ImageAsset(name: "CountryFlag/xk")
    internal static let ye = ImageAsset(name: "CountryFlag/ye")
    internal static let yt = ImageAsset(name: "CountryFlag/yt")
    internal static let za = ImageAsset(name: "CountryFlag/za")
    internal static let zm = ImageAsset(name: "CountryFlag/zm")
    internal static let zw = ImageAsset(name: "CountryFlag/zw")
  }
  internal static let defaultProfileImage = ImageAsset(name: "DefaultProfileImage")
  internal static let welcomeBackground = ImageAsset(name: "WelcomeBackground")
  internal static let welcomeLogo = ImageAsset(name: "WelcomeLogo")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal let name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal private(set) lazy var swiftUIColor: SwiftUI.Color = {
    SwiftUI.Color(asset: self)
  }()
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Color {
  init(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }
}
#endif

internal struct ImageAsset {
  internal let name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  internal var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
internal extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
