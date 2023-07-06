//
//  Enu,.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/07/05.
//

import Foundation

struct Enum {

    public enum categoryType: String {
        case T1H = "T1H" // 기온
        case RN1 = "RN1" // 1시간 강수량
        case SKY = "SKY" // 하늘상태
        case UUU = "UUU" // 동서바람성분
        case VVV = "VVV" // 남북바람성분
        case REH = "REH" // 습도
        case PTY = "PTY" // 강수 형태
        case LGT = "LGT" // 낙뢰
        case VEC = "VEC" // 풍향
        case WSD = "WSD" // 풍속
    }
}
