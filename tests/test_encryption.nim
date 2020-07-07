import unittest

import ../double_ratchet/Crypto/Encryption

suite "Encryption":
  test "Vectorized":
    var
      key: array[32, byte] = [byte(82), 79, 29, 3, 209, 216, 30, 148, 160, 153, 4, 39, 54, 212, 11, 217, 104, 27, 134, 115, 33, 68, 63, 245, 138, 69, 104, 226, 116, 219, 216, 59]
      datas: seq[seq[byte]] = @[
        @[],
        @[byte(255), 235, 203, 75, 155, 59, 244, 4, 203, 124, 36, 31, 188, 51, 111, 54, 6, 245, 241, 57, 125, 40, 129, 75, 237, 17, 170, 54, 134, 173],
        @[],
        @[byte(255), 235, 203, 75, 155, 59, 244, 4, 203, 124, 36, 31, 188, 51, 111, 54, 6, 245, 241, 57, 125, 40, 129, 75, 237, 17, 170, 54, 134, 173, 168, 58, 176, 141, 157, 7, 189, 166, 41, 243]
      ]
      ads: seq[seq[byte]] = @[
        @[],
        @[],
        @[byte(255), 235, 203, 75, 155, 59, 244, 4, 203, 124],
        @[byte(16), 166, 127, 121, 155, 53, 75, 186, 198, 137]
      ]
      ress: seq[seq[byte]] = @[
        @[byte(225), 126, 129, 38, 55, 23, 36, 150, 199, 3, 31, 98, 207, 197, 66, 199, 172, 73, 242, 245, 65, 110, 161, 139, 49, 35, 152, 10, 143, 158, 12, 151, 115, 84, 56, 224, 41, 180, 223, 49, 143, 2, 201, 183, 175, 54, 226, 47],
        @[byte(225), 126, 129, 38, 55, 23, 36, 150, 199, 3, 31, 98, 207, 197, 66, 199, 67, 202, 187, 117, 205, 121, 76, 121, 107, 171, 82, 105, 46, 59, 192, 141, 49, 82, 192, 0, 250, 161, 156, 213, 20, 178, 77, 7, 53, 65, 183, 153, 45, 186, 122, 180, 199, 139, 40, 187, 6, 12, 225, 209, 237, 106, 17, 238, 123, 61, 164, 255, 36, 235, 47, 198, 76, 1, 1, 143, 243, 60],
        @[byte(225), 126, 129, 38, 55, 23, 36, 150, 199, 3, 31, 98, 207, 197, 66, 199, 201, 199, 40, 213, 170, 19, 180, 226, 136, 221, 57, 67, 228, 89, 162, 241, 247, 247, 134, 48, 85, 184, 249, 194, 190, 74, 131, 152, 59, 83, 127, 91],
        @[byte(225), 126, 129, 38, 55, 23, 36, 150, 199, 3, 31, 98, 207, 197, 66, 199, 67, 202, 187, 117, 205, 121, 76, 121, 107, 171, 82, 105, 46, 59, 192, 141, 49, 82, 192, 0, 250, 161, 156, 213, 20, 178, 77, 7, 53, 65, 90, 70, 75, 107, 91, 39, 211, 38, 224, 158, 15, 158, 139, 156, 127, 104, 16, 204, 17, 140, 51, 175, 187, 8, 53, 173, 179, 147, 124, 252, 133, 99, 232, 21, 251, 159, 166, 114, 52, 96, 213, 72]
      ]

    for i in 0 ..< datas.len:
      doAssert encryptByKey(key, datas[i], ads[i]) == ress[i]
      check decryptByKey(key, ress[i], ads[i]) == datas[i]
