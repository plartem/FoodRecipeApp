//
//  Country.swift
//  FoodRecipeApp
//

import Foundation

// swiftlint:disable identifier_name file_length
enum Country: String, CaseIterable, Codable, Equatable, Identifiable {
    var id: Self { self }

    case ad = "AD"
    case ae = "AE"
    case af = "AF"
    case ag = "AG"
    case ai = "AI"
    case al = "AL"
    case am = "AM"
    case ao = "AO"
    case aq = "AQ"
    case ar = "AR"
    case `as` = "AS"
    case at = "AT"
    case au = "AU"
    case aw = "AW"
    case ax = "AX"
    case az = "AZ"
    case ba = "BA"
    case bb = "BB"
    case bd = "BD"
    case be = "BE"
    case bf = "BF"
    case bg = "BG"
    case bh = "BH"
    case bi = "BI"
    case bj = "BJ"
    case bl = "BL"
    case bm = "BM"
    case bn = "BN"
    case bo = "BO"
    case bq = "BQ"
    case br = "BR"
    case bs = "BS"
    case bt = "BT"
    case bv = "BV"
    case bw = "BW"
    case by = "BY"
    case bz = "BZ"
    case ca = "CA"
    case cc = "CC"
    case cd = "CD"
    case cf = "CF"
    case cg = "CG"
    case ch = "CH"
    case ci = "CI"
    case ck = "CK"
    case cl = "CL"
    case cm = "CM"
    case cn = "CN"
    case co = "CO"
    case cr = "CR"
    case cu = "CU"
    case cv = "CV"
    case cw = "CW"
    case cx = "CX"
    case cy = "CY"
    case cz = "CZ"
    case de = "DE"
    case dj = "DJ"
    case dk = "DK"
    case dm = "DM"
    case `do` = "DO"
    case dz = "DZ"
    case ec = "EC"
    case ee = "EE"
    case eg = "EG"
    case eh = "EH"
    case er = "ER"
    case es = "ES"
    case et = "ET"
    case fi = "FI"
    case fj = "FJ"
    case fk = "FK"
    case fm = "FM"
    case fo = "FO"
    case fr = "FR"
    case ga = "GA"
    case gb = "GB"
    case gd = "GD"
    case ge = "GE"
    case gf = "GF"
    case gg = "GG"
    case gh = "GH"
    case gi = "GI"
    case gl = "GL"
    case gm = "GM"
    case gn = "GN"
    case gp = "GP"
    case gq = "GQ"
    case gr = "GR"
    case gs = "GS"
    case gt = "GT"
    case gu = "GU"
    case gw = "GW"
    case gy = "GY"
    case hk = "HK"
    case hm = "HM"
    case hn = "HN"
    case hr = "HR"
    case ht = "HT"
    case hu = "HU"
    case id = "ID"
    case ie = "IE"
    case il = "IL"
    case im = "IM"
    case `in` = "IN"
    case io = "IO"
    case iq = "IQ"
    case ir = "IR"
    case `is` = "IS"
    case it = "IT"
    case je = "JE"
    case jm = "JM"
    case jo = "JO"
    case jp = "JP"
    case ke = "KE"
    case kg = "KG"
    case kh = "KH"
    case ki = "KI"
    case km = "KM"
    case kn = "KN"
    case kp = "KP"
    case kr = "KR"
    case kw = "KW"
    case ky = "KY"
    case kz = "KZ"
    case la = "LA"
    case lb = "LB"
    case lc = "LC"
    case li = "LI"
    case lk = "LK"
    case lr = "LR"
    case ls = "LS"
    case lt = "LT"
    case lu = "LU"
    case lv = "LV"
    case ly = "LY"
    case ma = "MA"
    case mc = "MC"
    case md = "MD"
    case me = "ME"
    case mf = "MF"
    case mg = "MG"
    case mh = "MH"
    case mk = "MK"
    case ml = "ML"
    case mm = "MM"
    case mn = "MN"
    case mo = "MO"
    case mp = "MP"
    case mq = "MQ"
    case mr = "MR"
    case ms = "MS"
    case mt = "MT"
    case mu = "MU"
    case mv = "MV"
    case mw = "MW"
    case mx = "MX"
    case my = "MY"
    case mz = "MZ"
    case na = "NA"
    case nc = "NC"
    case ne = "NE"
    case nf = "NF"
    case ng = "NG"
    case ni = "NI"
    case nl = "NL"
    case no = "NO"
    case np = "NP"
    case nr = "NR"
    case nu = "NU"
    case nz = "NZ"
    case om = "OM"
    case pa = "PA"
    case pe = "PE"
    case pf = "PF"
    case pg = "PG"
    case ph = "PH"
    case pk = "PK"
    case pl = "PL"
    case pm = "PM"
    case pn = "PN"
    case pr = "PR"
    case ps = "PS"
    case pt = "PT"
    case pw = "PW"
    case py = "PY"
    case qa = "QA"
    case re = "RE"
    case ro = "RO"
    case rs = "RS"
    case ru = "RU"
    case rw = "RW"
    case sa = "SA"
    case sb = "SB"
    case sc = "SC"
    case sd = "SD"
    case se = "SE"
    case sg = "SG"
    case sh = "SH"
    case si = "SI"
    case sj = "SJ"
    case sk = "SK"
    case sl = "SL"
    case sm = "SM"
    case sn = "SN"
    case so = "SO"
    case sr = "SR"
    case ss = "SS"
    case st = "ST"
    case sv = "SV"
    case sx = "SX"
    case sy = "SY"
    case sz = "SZ"
    case tc = "TC"
    case td = "TD"
    case tf = "TF"
    case tg = "TG"
    case th = "TH"
    case tj = "TJ"
    case tk = "TK"
    case tl = "TL"
    case tm = "TM"
    case tn = "TN"
    case to = "TO"
    case tr = "TR"
    case tt = "TT"
    case tv = "TV"
    case tw = "TW"
    case tz = "TZ"
    case ua = "UA"
    case ug = "UG"
    case um = "UM"
    case us = "US"
    case uy = "UY"
    case uz = "UZ"
    case va = "VA"
    case vc = "VC"
    case ve = "VE"
    case vg = "VG"
    case vi = "VI"
    case vn = "VN"
    case vu = "VU"
    case wf = "WF"
    case ws = "WS"
    case ye = "YE"
    case yt = "YT"
    case za = "ZA"
    case zm = "ZM"
    case zw = "ZW"
}

// MARK: - Full name

extension Country {
    var fullName: String {
        switch self {
        case .ad: L10n.Country.ad
        case .ae: L10n.Country.ae
        case .af: L10n.Country.af
        case .ag: L10n.Country.ag
        case .ai: L10n.Country.ai
        case .al: L10n.Country.al
        case .am: L10n.Country.am
        case .ao: L10n.Country.ao
        case .aq: L10n.Country.aq
        case .ar: L10n.Country.ar
        case .as: L10n.Country.as
        case .at: L10n.Country.at
        case .au: L10n.Country.au
        case .aw: L10n.Country.aw
        case .ax: L10n.Country.ax
        case .az: L10n.Country.az
        case .ba: L10n.Country.ba
        case .bb: L10n.Country.bb
        case .bd: L10n.Country.bd
        case .be: L10n.Country.be
        case .bf: L10n.Country.bf
        case .bg: L10n.Country.bg
        case .bh: L10n.Country.bh
        case .bi: L10n.Country.bi
        case .bj: L10n.Country.bj
        case .bl: L10n.Country.bl
        case .bm: L10n.Country.bm
        case .bn: L10n.Country.bn
        case .bo: L10n.Country.bo
        case .bq: L10n.Country.bq
        case .br: L10n.Country.br
        case .bs: L10n.Country.bs
        case .bt: L10n.Country.bt
        case .bv: L10n.Country.bv
        case .bw: L10n.Country.bw
        case .by: L10n.Country.by
        case .bz: L10n.Country.bz
        case .ca: L10n.Country.ca
        case .cc: L10n.Country.cc
        case .cd: L10n.Country.cd
        case .cf: L10n.Country.cf
        case .cg: L10n.Country.cg
        case .ch: L10n.Country.ch
        case .ci: L10n.Country.ci
        case .ck: L10n.Country.ck
        case .cl: L10n.Country.cl
        case .cm: L10n.Country.cm
        case .cn: L10n.Country.cn
        case .co: L10n.Country.co
        case .cr: L10n.Country.cr
        case .cu: L10n.Country.cu
        case .cv: L10n.Country.cv
        case .cw: L10n.Country.cw
        case .cx: L10n.Country.cx
        case .cy: L10n.Country.cy
        case .cz: L10n.Country.cz
        case .de: L10n.Country.de
        case .dj: L10n.Country.dj
        case .dk: L10n.Country.dk
        case .dm: L10n.Country.dm
        case .do: L10n.Country.do
        case .dz: L10n.Country.dz
        case .ec: L10n.Country.ec
        case .ee: L10n.Country.ee
        case .eg: L10n.Country.eg
        case .eh: L10n.Country.eh
        case .er: L10n.Country.er
        case .es: L10n.Country.es
        case .et: L10n.Country.et
        case .fi: L10n.Country.fi
        case .fj: L10n.Country.fj
        case .fk: L10n.Country.fk
        case .fm: L10n.Country.fm
        case .fo: L10n.Country.fo
        case .fr: L10n.Country.fr
        case .ga: L10n.Country.ga
        case .gb: L10n.Country.gb
        case .gd: L10n.Country.gd
        case .ge: L10n.Country.ge
        case .gf: L10n.Country.gf
        case .gg: L10n.Country.gg
        case .gh: L10n.Country.gh
        case .gi: L10n.Country.gi
        case .gl: L10n.Country.gl
        case .gm: L10n.Country.gm
        case .gn: L10n.Country.gn
        case .gp: L10n.Country.gp
        case .gq: L10n.Country.gq
        case .gr: L10n.Country.gr
        case .gs: L10n.Country.gs
        case .gt: L10n.Country.gt
        case .gu: L10n.Country.gu
        case .gw: L10n.Country.gw
        case .gy: L10n.Country.gy
        case .hk: L10n.Country.hk
        case .hm: L10n.Country.hm
        case .hn: L10n.Country.hn
        case .hr: L10n.Country.hr
        case .ht: L10n.Country.ht
        case .hu: L10n.Country.hu
        case .id: L10n.Country.id
        case .ie: L10n.Country.ie
        case .il: L10n.Country.il
        case .im: L10n.Country.im
        case .in: L10n.Country.in
        case .io: L10n.Country.io
        case .iq: L10n.Country.iq
        case .ir: L10n.Country.ir
        case .is: L10n.Country.is
        case .it: L10n.Country.it
        case .je: L10n.Country.je
        case .jm: L10n.Country.jm
        case .jo: L10n.Country.jo
        case .jp: L10n.Country.jp
        case .ke: L10n.Country.ke
        case .kg: L10n.Country.kg
        case .kh: L10n.Country.kh
        case .ki: L10n.Country.ki
        case .km: L10n.Country.km
        case .kn: L10n.Country.kn
        case .kp: L10n.Country.kp
        case .kr: L10n.Country.kr
        case .kw: L10n.Country.kw
        case .ky: L10n.Country.ky
        case .kz: L10n.Country.kz
        case .la: L10n.Country.la
        case .lb: L10n.Country.lb
        case .lc: L10n.Country.lc
        case .li: L10n.Country.li
        case .lk: L10n.Country.lk
        case .lr: L10n.Country.lr
        case .ls: L10n.Country.ls
        case .lt: L10n.Country.lt
        case .lu: L10n.Country.lu
        case .lv: L10n.Country.lv
        case .ly: L10n.Country.ly
        case .ma: L10n.Country.ma
        case .mc: L10n.Country.mc
        case .md: L10n.Country.md
        case .me: L10n.Country.me
        case .mf: L10n.Country.mf
        case .mg: L10n.Country.mg
        case .mh: L10n.Country.mh
        case .mk: L10n.Country.mk
        case .ml: L10n.Country.ml
        case .mm: L10n.Country.mm
        case .mn: L10n.Country.mn
        case .mo: L10n.Country.mo
        case .mp: L10n.Country.mp
        case .mq: L10n.Country.mq
        case .mr: L10n.Country.mr
        case .ms: L10n.Country.ms
        case .mt: L10n.Country.mt
        case .mu: L10n.Country.mu
        case .mv: L10n.Country.mv
        case .mw: L10n.Country.mw
        case .mx: L10n.Country.mx
        case .my: L10n.Country.my
        case .mz: L10n.Country.mz
        case .na: L10n.Country.na
        case .nc: L10n.Country.nc
        case .ne: L10n.Country.ne
        case .nf: L10n.Country.nf
        case .ng: L10n.Country.ng
        case .ni: L10n.Country.ni
        case .nl: L10n.Country.nl
        case .no: L10n.Country.no
        case .np: L10n.Country.np
        case .nr: L10n.Country.nr
        case .nu: L10n.Country.nu
        case .nz: L10n.Country.nz
        case .om: L10n.Country.om
        case .pa: L10n.Country.pa
        case .pe: L10n.Country.pe
        case .pf: L10n.Country.pf
        case .pg: L10n.Country.pg
        case .ph: L10n.Country.ph
        case .pk: L10n.Country.pk
        case .pl: L10n.Country.pl
        case .pm: L10n.Country.pm
        case .pn: L10n.Country.pn
        case .pr: L10n.Country.pr
        case .ps: L10n.Country.ps
        case .pt: L10n.Country.pt
        case .pw: L10n.Country.pw
        case .py: L10n.Country.py
        case .qa: L10n.Country.qa
        case .re: L10n.Country.re
        case .ro: L10n.Country.ro
        case .rs: L10n.Country.rs
        case .ru: L10n.Country.ru
        case .rw: L10n.Country.rw
        case .sa: L10n.Country.sa
        case .sb: L10n.Country.sb
        case .sc: L10n.Country.sc
        case .sd: L10n.Country.sd
        case .se: L10n.Country.se
        case .sg: L10n.Country.sg
        case .sh: L10n.Country.sh
        case .si: L10n.Country.si
        case .sj: L10n.Country.sj
        case .sk: L10n.Country.sk
        case .sl: L10n.Country.sl
        case .sm: L10n.Country.sm
        case .sn: L10n.Country.sn
        case .so: L10n.Country.so
        case .sr: L10n.Country.sr
        case .ss: L10n.Country.ss
        case .st: L10n.Country.st
        case .sv: L10n.Country.sv
        case .sx: L10n.Country.sx
        case .sy: L10n.Country.sy
        case .sz: L10n.Country.sz
        case .tc: L10n.Country.tc
        case .td: L10n.Country.td
        case .tf: L10n.Country.tf
        case .tg: L10n.Country.tg
        case .th: L10n.Country.th
        case .tj: L10n.Country.tj
        case .tk: L10n.Country.tk
        case .tl: L10n.Country.tl
        case .tm: L10n.Country.tm
        case .tn: L10n.Country.tn
        case .to: L10n.Country.to
        case .tr: L10n.Country.tr
        case .tt: L10n.Country.tt
        case .tv: L10n.Country.tv
        case .tw: L10n.Country.tw
        case .tz: L10n.Country.tz
        case .ua: L10n.Country.ua
        case .ug: L10n.Country.ug
        case .um: L10n.Country.um
        case .us: L10n.Country.us
        case .uy: L10n.Country.uy
        case .uz: L10n.Country.uz
        case .va: L10n.Country.va
        case .vc: L10n.Country.vc
        case .ve: L10n.Country.ve
        case .vg: L10n.Country.vg
        case .vi: L10n.Country.vi
        case .vn: L10n.Country.vn
        case .vu: L10n.Country.vu
        case .wf: L10n.Country.wf
        case .ws: L10n.Country.ws
        case .ye: L10n.Country.ye
        case .yt: L10n.Country.yt
        case .za: L10n.Country.za
        case .zm: L10n.Country.zm
        case .zw: L10n.Country.zw
        }
    }
}

// MARK: - Flag

extension Country {
    var flagAsset: ImageAsset {
        switch self {
        case .ad: Asset.CountryFlag.ad
        case .ae: Asset.CountryFlag.ae
        case .af: Asset.CountryFlag.af
        case .ag: Asset.CountryFlag.ag
        case .ai: Asset.CountryFlag.ai
        case .al: Asset.CountryFlag.al
        case .am: Asset.CountryFlag.am
        case .ao: Asset.CountryFlag.ao
        case .aq: Asset.CountryFlag.aq
        case .ar: Asset.CountryFlag.ar
        case .as: Asset.CountryFlag.as
        case .at: Asset.CountryFlag.at
        case .au: Asset.CountryFlag.au
        case .aw: Asset.CountryFlag.aw
        case .ax: Asset.CountryFlag.ax
        case .az: Asset.CountryFlag.az
        case .ba: Asset.CountryFlag.ba
        case .bb: Asset.CountryFlag.bb
        case .bd: Asset.CountryFlag.bd
        case .be: Asset.CountryFlag.be
        case .bf: Asset.CountryFlag.bf
        case .bg: Asset.CountryFlag.bg
        case .bh: Asset.CountryFlag.bh
        case .bi: Asset.CountryFlag.bi
        case .bj: Asset.CountryFlag.bj
        case .bl: Asset.CountryFlag.bl
        case .bm: Asset.CountryFlag.bm
        case .bn: Asset.CountryFlag.bn
        case .bo: Asset.CountryFlag.bo
        case .bq: Asset.CountryFlag.bq
        case .br: Asset.CountryFlag.br
        case .bs: Asset.CountryFlag.bs
        case .bt: Asset.CountryFlag.bt
        case .bv: Asset.CountryFlag.bv
        case .bw: Asset.CountryFlag.bw
        case .by: Asset.CountryFlag.by
        case .bz: Asset.CountryFlag.bz
        case .ca: Asset.CountryFlag.ca
        case .cc: Asset.CountryFlag.cc
        case .cd: Asset.CountryFlag.cd
        case .cf: Asset.CountryFlag.cf
        case .cg: Asset.CountryFlag.cg
        case .ch: Asset.CountryFlag.ch
        case .ci: Asset.CountryFlag.ci
        case .ck: Asset.CountryFlag.ck
        case .cl: Asset.CountryFlag.cl
        case .cm: Asset.CountryFlag.cm
        case .cn: Asset.CountryFlag.cn
        case .co: Asset.CountryFlag.co
        case .cr: Asset.CountryFlag.cr
        case .cu: Asset.CountryFlag.cu
        case .cv: Asset.CountryFlag.cv
        case .cw: Asset.CountryFlag.cw
        case .cx: Asset.CountryFlag.cx
        case .cy: Asset.CountryFlag.cy
        case .cz: Asset.CountryFlag.cz
        case .de: Asset.CountryFlag.de
        case .dj: Asset.CountryFlag.dj
        case .dk: Asset.CountryFlag.dk
        case .dm: Asset.CountryFlag.dm
        case .do: Asset.CountryFlag.do
        case .dz: Asset.CountryFlag.dz
        case .ec: Asset.CountryFlag.ec
        case .ee: Asset.CountryFlag.ee
        case .eg: Asset.CountryFlag.eg
        case .eh: Asset.CountryFlag.eh
        case .er: Asset.CountryFlag.er
        case .es: Asset.CountryFlag.es
        case .et: Asset.CountryFlag.et
        case .fi: Asset.CountryFlag.fi
        case .fj: Asset.CountryFlag.fj
        case .fk: Asset.CountryFlag.fk
        case .fm: Asset.CountryFlag.fm
        case .fo: Asset.CountryFlag.fo
        case .fr: Asset.CountryFlag.fr
        case .ga: Asset.CountryFlag.ga
        case .gb: Asset.CountryFlag.gb
        case .gd: Asset.CountryFlag.gd
        case .ge: Asset.CountryFlag.ge
        case .gf: Asset.CountryFlag.gf
        case .gg: Asset.CountryFlag.gg
        case .gh: Asset.CountryFlag.gh
        case .gi: Asset.CountryFlag.gi
        case .gl: Asset.CountryFlag.gl
        case .gm: Asset.CountryFlag.gm
        case .gn: Asset.CountryFlag.gn
        case .gp: Asset.CountryFlag.gp
        case .gq: Asset.CountryFlag.gq
        case .gr: Asset.CountryFlag.gr
        case .gs: Asset.CountryFlag.gs
        case .gt: Asset.CountryFlag.gt
        case .gu: Asset.CountryFlag.gu
        case .gw: Asset.CountryFlag.gw
        case .gy: Asset.CountryFlag.gy
        case .hk: Asset.CountryFlag.hk
        case .hm: Asset.CountryFlag.hm
        case .hn: Asset.CountryFlag.hn
        case .hr: Asset.CountryFlag.hr
        case .ht: Asset.CountryFlag.ht
        case .hu: Asset.CountryFlag.hu
        case .id: Asset.CountryFlag.id
        case .ie: Asset.CountryFlag.ie
        case .il: Asset.CountryFlag.il
        case .im: Asset.CountryFlag.im
        case .in: Asset.CountryFlag.in
        case .io: Asset.CountryFlag.io
        case .iq: Asset.CountryFlag.iq
        case .ir: Asset.CountryFlag.ir
        case .is: Asset.CountryFlag.is
        case .it: Asset.CountryFlag.it
        case .je: Asset.CountryFlag.je
        case .jm: Asset.CountryFlag.jm
        case .jo: Asset.CountryFlag.jo
        case .jp: Asset.CountryFlag.jp
        case .ke: Asset.CountryFlag.ke
        case .kg: Asset.CountryFlag.kg
        case .kh: Asset.CountryFlag.kh
        case .ki: Asset.CountryFlag.ki
        case .km: Asset.CountryFlag.km
        case .kn: Asset.CountryFlag.kn
        case .kp: Asset.CountryFlag.kp
        case .kr: Asset.CountryFlag.kr
        case .kw: Asset.CountryFlag.kw
        case .ky: Asset.CountryFlag.ky
        case .kz: Asset.CountryFlag.kz
        case .la: Asset.CountryFlag.la
        case .lb: Asset.CountryFlag.lb
        case .lc: Asset.CountryFlag.lc
        case .li: Asset.CountryFlag.li
        case .lk: Asset.CountryFlag.lk
        case .lr: Asset.CountryFlag.lr
        case .ls: Asset.CountryFlag.ls
        case .lt: Asset.CountryFlag.lt
        case .lu: Asset.CountryFlag.lu
        case .lv: Asset.CountryFlag.lv
        case .ly: Asset.CountryFlag.ly
        case .ma: Asset.CountryFlag.ma
        case .mc: Asset.CountryFlag.mc
        case .md: Asset.CountryFlag.md
        case .me: Asset.CountryFlag.me
        case .mf: Asset.CountryFlag.mf
        case .mg: Asset.CountryFlag.mg
        case .mh: Asset.CountryFlag.mh
        case .mk: Asset.CountryFlag.mk
        case .ml: Asset.CountryFlag.ml
        case .mm: Asset.CountryFlag.mm
        case .mn: Asset.CountryFlag.mn
        case .mo: Asset.CountryFlag.mo
        case .mp: Asset.CountryFlag.mp
        case .mq: Asset.CountryFlag.mq
        case .mr: Asset.CountryFlag.mr
        case .ms: Asset.CountryFlag.ms
        case .mt: Asset.CountryFlag.mt
        case .mu: Asset.CountryFlag.mu
        case .mv: Asset.CountryFlag.mv
        case .mw: Asset.CountryFlag.mw
        case .mx: Asset.CountryFlag.mx
        case .my: Asset.CountryFlag.my
        case .mz: Asset.CountryFlag.mz
        case .na: Asset.CountryFlag.na
        case .nc: Asset.CountryFlag.nc
        case .ne: Asset.CountryFlag.ne
        case .nf: Asset.CountryFlag.nf
        case .ng: Asset.CountryFlag.ng
        case .ni: Asset.CountryFlag.ni
        case .nl: Asset.CountryFlag.nl
        case .no: Asset.CountryFlag.no
        case .np: Asset.CountryFlag.np
        case .nr: Asset.CountryFlag.nr
        case .nu: Asset.CountryFlag.nu
        case .nz: Asset.CountryFlag.nz
        case .om: Asset.CountryFlag.om
        case .pa: Asset.CountryFlag.pa
        case .pe: Asset.CountryFlag.pe
        case .pf: Asset.CountryFlag.pf
        case .pg: Asset.CountryFlag.pg
        case .ph: Asset.CountryFlag.ph
        case .pk: Asset.CountryFlag.pk
        case .pl: Asset.CountryFlag.pl
        case .pm: Asset.CountryFlag.pm
        case .pn: Asset.CountryFlag.pn
        case .pr: Asset.CountryFlag.pr
        case .ps: Asset.CountryFlag.ps
        case .pt: Asset.CountryFlag.pt
        case .pw: Asset.CountryFlag.pw
        case .py: Asset.CountryFlag.py
        case .qa: Asset.CountryFlag.qa
        case .re: Asset.CountryFlag.re
        case .ro: Asset.CountryFlag.ro
        case .rs: Asset.CountryFlag.rs
        case .ru: Asset.CountryFlag.ru
        case .rw: Asset.CountryFlag.rw
        case .sa: Asset.CountryFlag.sa
        case .sb: Asset.CountryFlag.sb
        case .sc: Asset.CountryFlag.sc
        case .sd: Asset.CountryFlag.sd
        case .se: Asset.CountryFlag.se
        case .sg: Asset.CountryFlag.sg
        case .sh: Asset.CountryFlag.sh
        case .si: Asset.CountryFlag.si
        case .sj: Asset.CountryFlag.sj
        case .sk: Asset.CountryFlag.sk
        case .sl: Asset.CountryFlag.sl
        case .sm: Asset.CountryFlag.sm
        case .sn: Asset.CountryFlag.sn
        case .so: Asset.CountryFlag.so
        case .sr: Asset.CountryFlag.sr
        case .ss: Asset.CountryFlag.ss
        case .st: Asset.CountryFlag.st
        case .sv: Asset.CountryFlag.sv
        case .sx: Asset.CountryFlag.sx
        case .sy: Asset.CountryFlag.sy
        case .sz: Asset.CountryFlag.sz
        case .tc: Asset.CountryFlag.tc
        case .td: Asset.CountryFlag.td
        case .tf: Asset.CountryFlag.tf
        case .tg: Asset.CountryFlag.tg
        case .th: Asset.CountryFlag.th
        case .tj: Asset.CountryFlag.tj
        case .tk: Asset.CountryFlag.tk
        case .tl: Asset.CountryFlag.tl
        case .tm: Asset.CountryFlag.tm
        case .tn: Asset.CountryFlag.tn
        case .to: Asset.CountryFlag.to
        case .tr: Asset.CountryFlag.tr
        case .tt: Asset.CountryFlag.tt
        case .tv: Asset.CountryFlag.tv
        case .tw: Asset.CountryFlag.tw
        case .tz: Asset.CountryFlag.tz
        case .ua: Asset.CountryFlag.ua
        case .ug: Asset.CountryFlag.ug
        case .um: Asset.CountryFlag.um
        case .us: Asset.CountryFlag.us
        case .uy: Asset.CountryFlag.uy
        case .uz: Asset.CountryFlag.uz
        case .va: Asset.CountryFlag.va
        case .vc: Asset.CountryFlag.vc
        case .ve: Asset.CountryFlag.ve
        case .vg: Asset.CountryFlag.vg
        case .vi: Asset.CountryFlag.vi
        case .vn: Asset.CountryFlag.vn
        case .vu: Asset.CountryFlag.vu
        case .wf: Asset.CountryFlag.wf
        case .ws: Asset.CountryFlag.ws
        case .ye: Asset.CountryFlag.ye
        case .yt: Asset.CountryFlag.yt
        case .za: Asset.CountryFlag.za
        case .zm: Asset.CountryFlag.zm
        case .zw: Asset.CountryFlag.zw
        }
    }
}

// MARK: - Phone Code

extension Country {
    var phoneCode: String {
        switch self {
        case .ad: "376"
        case .ae: "971"
        case .af: "93"
        case .ag: "1"
        case .ai: "1"
        case .al: "355"
        case .am: "374"
        case .ao: "244"
        case .aq: "672"
        case .ar: "54"
        case .as: "1"
        case .at: "43"
        case .au: "61"
        case .aw: "297"
        case .ax: "358"
        case .az: "994"
        case .ba: "387"
        case .bb: "1"
        case .bd: "880"
        case .be: "32"
        case .bf: "226"
        case .bg: "359"
        case .bh: "973"
        case .bi: "257"
        case .bj: "229"
        case .bl: "590"
        case .bm: "1"
        case .bn: "673"
        case .bo: "591"
        case .bq: "599"
        case .br: "55"
        case .bs: "1"
        case .bt: "975"
        case .bv: "55"
        case .bw: "267"
        case .by: "375"
        case .bz: "501"
        case .ca: "1"
        case .cc: "61"
        case .cd: "243"
        case .cf: "236"
        case .cg: "242"
        case .ch: "41"
        case .ci: "225"
        case .ck: "682"
        case .cl: "56"
        case .cm: "237"
        case .cn: "86"
        case .co: "57"
        case .cr: "506"
        case .cu: "53"
        case .cv: "238"
        case .cw: "599"
        case .cx: "61"
        case .cy: "357"
        case .cz: "420"
        case .de: "49"
        case .dj: "253"
        case .dk: "45"
        case .dm: "1"
        case .do: "1"
        case .dz: "213"
        case .ec: "593"
        case .ee: "372"
        case .eg: "20"
        case .eh: "212"
        case .er: "291"
        case .es: "34"
        case .et: "251"
        case .fi: "358"
        case .fj: "679"
        case .fk: "500"
        case .fm: "691"
        case .fo: "298"
        case .fr: "33"
        case .ga: "241"
        case .gb: "44"
        case .gd: "1"
        case .ge: "995"
        case .gf: "594"
        case .gg: "44"
        case .gh: "233"
        case .gi: "350"
        case .gl: "299"
        case .gm: "220"
        case .gn: "224"
        case .gp: "590"
        case .gq: "240"
        case .gr: "30"
        case .gs: ""
        case .gt: "502"
        case .gu: "1"
        case .gw: "245"
        case .gy: "592"
        case .hk: "852"
        case .hm: "37"
        case .hn: "504"
        case .hr: "385"
        case .ht: "509"
        case .hu: "36"
        case .id: "62"
        case .ie: "353"
        case .il: "972"
        case .im: "44"
        case .in: "91"
        case .io: "246"
        case .iq: "964"
        case .ir: "98"
        case .is: "354"
        case .it: "39"
        case .je: "44"
        case .jm: "1"
        case .jo: "962"
        case .jp: "81"
        case .ke: "254"
        case .kg: "996"
        case .kh: "855"
        case .ki: "686"
        case .km: "269"
        case .kn: "1"
        case .kp: "850"
        case .kr: "82"
        case .kw: "965"
        case .ky: "1"
        case .kz: "7"
        case .la: "856"
        case .lb: "961"
        case .lc: "1"
        case .li: "423"
        case .lk: "94"
        case .lr: "231"
        case .ls: "266"
        case .lt: "370"
        case .lu: "352"
        case .lv: "371"
        case .ly: "218"
        case .ma: "212"
        case .mc: "377"
        case .md: "373"
        case .me: "382"
        case .mf: "590"
        case .mg: "261"
        case .mh: "692"
        case .mk: "389"
        case .ml: "223"
        case .mm: "95"
        case .mn: "976"
        case .mo: "853"
        case .mp: "1"
        case .mq: "596"
        case .mr: "222"
        case .ms: "1"
        case .mt: "356"
        case .mu: "230"
        case .mv: "960"
        case .mw: "265"
        case .mx: "52"
        case .my: "60"
        case .mz: "258"
        case .na: "264"
        case .nc: "687"
        case .ne: "227"
        case .nf: "672"
        case .ng: "234"
        case .ni: "505"
        case .nl: "31"
        case .no: "47"
        case .np: "977"
        case .nr: "674"
        case .nu: "683"
        case .nz: "64"
        case .om: "968"
        case .pa: "507"
        case .pe: "51"
        case .pf: "689"
        case .pg: "675"
        case .ph: "63"
        case .pk: "92"
        case .pl: "48"
        case .pm: "508"
        case .pn: "870"
        case .pr: "1"
        case .ps: "970"
        case .pt: "351"
        case .pw: "680"
        case .py: "595"
        case .qa: "974"
        case .re: "262"
        case .ro: "40"
        case .rs: "381"
        case .ru: "7"
        case .rw: "250"
        case .sa: "966"
        case .sb: "677"
        case .sc: "248"
        case .sd: "249"
        case .se: "46"
        case .sg: "65"
        case .sh: "290"
        case .si: "386"
        case .sj: "47"
        case .sk: "421"
        case .sl: "232"
        case .sm: "378"
        case .sn: "221"
        case .so: "252"
        case .sr: "597"
        case .ss: "211"
        case .st: "239"
        case .sv: "503"
        case .sx: "1"
        case .sy: "963"
        case .sz: "268"
        case .tc: "1"
        case .td: "235"
        case .tf: "260"
        case .tg: "228"
        case .th: "66"
        case .tj: "992"
        case .tk: "690"
        case .tl: "670"
        case .tm: "993"
        case .tn: "216"
        case .to: "676"
        case .tr: "90"
        case .tt: "1"
        case .tv: "688"
        case .tw: "886"
        case .tz: "255"
        case .ua: "380"
        case .ug: "256"
        case .um: "1"
        case .us: "1"
        case .uy: "598"
        case .uz: "998"
        case .va: "39"
        case .vc: "1"
        case .ve: "58"
        case .vg: "1"
        case .vi: "1"
        case .vn: "84"
        case .vu: "678"
        case .wf: "681"
        case .ws: "685"
        case .ye: "967"
        case .yt: "262"
        case .za: "27"
        case .zm: "260"
        case .zw: "263"
        }
    }
}

// swiftlint:enable identifier_name file_length
