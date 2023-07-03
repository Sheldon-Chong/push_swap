#!/bin/bash

print_color() {
  local color=$1
  shift
  echo -e "\e[${color}m$@\e[0m"
}


test1=(
  "1 2"
  "1 2 3"
  "2 3 1"
  "1 3 2"
  "3 1 2"
  "2 1 3"
  "3 2 1"
  ""
  "-2147483648 1"
  "2147483647 1"
  "-2147483648 2147483647"
)

test2=(
  "1 2 3 4"
  "1 2 4 3"
  "1 3 2 4"
  "1 3 4 2"
  "1 4 2 3"
  "1 4 3 2"
  "2 1 3 4"
  "2 1 4 3"
  "2 3 1 4"
  "2 3 4 1"
  "2 4 1 3"
  "2 4 3 1"
  "3 1 2 4"
  "3 1 4 2"
  "3 2 1 4"
  "3 2 4 1"
  "3 4 1 2"
  "3 4 2 1"
  "4 1 2 3"
  "4 1 3 2"
  "4 2 1 3"
  "4 2 3 1"
  "4 3 1 2"
  "4 3 2 1"
)

test3=(
"13 24 2 48 19 1 42 41 40 15"

"27 13 45 38 9 32 42 19 50 5 18 11 30 26 36 47 2 7 41 3 31 8 17 40 10 48 23 21 14 37 29 1 33 25 46 4 15 6 49 24 39 22 20 16 28 34 43 35 44 12"
"10 2 46 49 5 50 4 14 21 9 16 26 6 44 47 28 13 12 8 27 19 48 25 31 11 33 39 23 45 42 20 36 7 15 29 22 43 18 32 1 38 35 30 3 17 37 24 40 34 41"
"27 33 13 29 37 49 11 36 6 43 45 15 48 38 22 32 46 12 31 17 39 23 7 50 5 44 35 1 16 4 26 14 40 18 30 42 8 10 3 47 28 9 41 2 19 25 20 34 21 24"
)

test4=(
"419 494 339 31 249 215 373 499 500 22 316 395 11 338 358 252 389 192 466 424 174 178 88 230 65 26 421 229 260 125 451 241 272 379 426 320 155 93 54 311 242 420 133 317 352 191 399 166 429 184 365 179 258 329 431 167 269 273 12 234 412 439 348 454 21 193 351 7 171 408 216 223 151 378 248 3 16 460 218 212 231 434 462 411 265 42 135 97 224 461 292 487 472 169 392 25 45 64 236 344 306 400 58 95 35 98 117 244 198 288 387 490 147 357 113 137 441 458 418 347 102 157 406 473 152 467 321 437 380 346 240 46 432 315 61 268 10 211 367 77 328 80 264 256 440 340 38 277 90 359 356 43 51 124 326 483 118 464 9 333 259 131 471 79 447 463 99 376 287 153 345 228 297 60 82 84 469 381 154 232 68 136 180 123 448 66 410 481 267 480 438 19 486 70 337 371 172 422 386 303 109 101 48 479 200 168 307 83 126 220 63 245 296 476 369 122 325 281 304 444 2 370 262 459 130 156 162 227 186 50 436 55 189 349 33 388 96 478 18 17 177 239 498 299 491 312 108 165 266 375 274 188 308 37 163 278 219 450 158 377 206 416 170 140 143 442 183 298 327 213 91 161 208 111 366 270 20 405 39 44 89 404 103 195 475 294 74 407 372 134 489 5 41 187 23 332 217 335 197 69 283 4 391 194 106 280 310 47 286 314 176 455 285 343 235 282 34 456 254 173 181 28 465 85 56 57 246 144 30 121 27 384 251 92 423 430 73 477 86 115 226 81 116 363 275 468 238 128 76 336 139 390 67 107 284 6 24 446 138 492 402 148 350 331 324 49 205 75 15 433 428 141 237 383 385 110 309 145 1 364 300 318 397 255 488 323 146 164 243 361 159 209 149 291 261 417 120 204 313 199 160 203 202 443 398 341 474 374 52 225 150 354 222 453 257 445 233 330 355 493 322 8 401 413 409 485 382 72 250 302 290 293 78 305 271 482 14 496 295 112 71 36 201 396 353 119 207 495 104 221 210 362 13 435 53 190 394 342 247 196 175 393 129 214 279 414 59 105 87 132 403 0 94 142 415 289 127 457 425 427 497 484 470 360 452 253 319 182 114 185 276 29 40 301 263 334 100 449 62 368"
"403 141 67 376 325 388 176 272 409 257 274 125 178 360 423 109 39 226 165 235 271 432 202 352 430 496 477 166 135 331 28 273 404 450 429 465 459 130 319 491 377 329 306 337 215 216 277 38 77 4 316 412 34 123 246 117 398 110 101 138 453 168 339 201 363 15 21 175 440 115 33 188 177 478 270 64 52 499 431 199 387 380 344 497 159 384 434 458 343 258 145 417 183 54 324 134 467 61 37 48 153 12 164 42 294 36 393 95 65 105 286 320 317 205 340 22 193 290 424 356 463 435 161 449 83 466 43 248 31 280 381 315 8 220 244 287 366 228 81 1 167 362 103 411 493 197 276 10 251 357 310 349 369 152 172 84 182 92 50 359 500 194 307 18 218 444 372 312 3 426 143 473 126 249 301 283 71 88 323 492 382 266 311 397 400 428 213 17 291 300 489 173 234 256 385 35 293 223 484 119 261 495 490 243 111 155 51 472 56 238 401 160 483 98 233 211 452 72 80 185 40 29 302 229 364 433 63 445 481 131 27 395 422 346 114 240 69 86 436 296 200 210 122 157 402 132 255 341 462 82 367 46 239 460 399 70 149 392 142 170 414 99 30 102 13 180 373 353 328 87 75 391 7 14 127 97 284 474 171 281 421 189 334 330 78 139 278 415 487 118 107 480 196 464 348 368 378 121 227 150 91 333 133 347 151 231 203 129 253 20 370 488 148 169 94 198 407 351 116 374 57 447 89 425 476 303 93 158 443 225 195 16 446 26 184 454 371 247 439 219 438 470 335 156 332 442 455 32 207 9 60 275 457 408 451 263 494 192 267 350 394 73 375 322 190 260 479 482 25 342 410 469 120 264 49 338 285 289 162 252 288 74 389 214 390 124 237 498 241 85 179 55 413 113 326 456 79 405 406 154 128 146 361 321 420 45 230 297 224 305 282 106 441 187 58 136 191 232 41 100 269 181 236 268 137 379 147 259 336 416 295 209 144 11 68 471 254 208 298 0 419 62 23 96 2 327 76 345 314 262 355 265 19 358 53 163 221 212 186 485 90 5 461 104 365 486 250 475 217 245 242 204 206 24 383 354 386 108 318 279 299 418 313 448 59 309 66 6 47 292 304 396 222 44 174 427 437 140 468 308"
"125 246 186 203 56 60 43 334 214 264 433 103 216 201 336 403 250 452 259 110 150 319 3 472 245 288 317 353 113 260 492 423 409 494 231 424 93 68 53 285 410 497 84 12 54 416 211 244 370 171 107 276 330 138 294 71 435 277 425 169 45 316 58 351 48 304 237 69 374 18 390 136 51 149 192 23 306 478 447 122 242 119 457 380 167 172 378 299 22 160 483 82 137 243 375 37 343 153 187 124 4 123 258 439 382 180 355 251 152 92 461 465 120 458 63 147 417 228 198 212 17 225 291 284 62 146 226 315 20 47 340 471 297 31 451 27 265 422 196 443 15 275 362 387 432 323 405 488 318 384 38 175 238 290 427 448 298 480 129 176 115 13 33 189 156 394 376 446 338 393 234 453 161 108 75 188 170 230 49 210 99 218 252 332 80 476 131 166 429 263 8 21 168 70 65 282 89 185 87 371 400 431 79 105 240 78 128 102 428 73 342 395 34 413 197 300 42 289 485 350 386 295 213 26 44 479 232 498 372 220 402 111 399 286 464 77 449 195 91 36 381 292 348 140 117 163 366 367 181 25 346 127 219 32 481 270 95 341 293 408 205 273 207 155 145 255 436 279 224 254 19 194 499 354 495 101 407 202 109 94 437 239 426 74 500 159 209 88 331 61 373 165 200 470 438 312 121 247 268 419 404 322 359 314 321 206 324 430 491 253 133 9 256 143 141 459 227 39 358 208 223 158 0 335 369 328 10 249 179 112 126 444 455 66 333 307 2 76 379 475 6 487 16 364 434 493 98 445 418 191 345 482 40 305 104 397 29 412 363 377 236 96 308 490 337 52 469 450 468 11 456 303 50 278 222 229 184 280 182 389 269 473 67 281 365 486 118 401 392 30 217 151 157 162 440 215 132 221 274 261 134 313 398 267 411 262 257 24 72 116 327 441 344 1 272 474 415 139 233 484 46 193 302 235 466 7 271 55 5 296 41 310 142 406 396 100 357 301 360 420 144 106 311 204 391 59 385 454 326 329 97 325 81 368 489 164 349 356 90 248 442 174 85 35 178 199 154 496 320 467 352 460 177 309 477 28 383 130 114 462 463 183 173 347 86 14 361 64 421 287 135 339 57 148 83 283 414 190 388 266"

"-477 -485 305 28 39 145 266 -344 -415 202 64 347 -487 -455 -272 449 485 -367 463 -35 4 164 423 -465 -399 -185 88 -254 241 -430 -206 -285 153 108 -90 -378 -152 -497 -104 351 6 -39 -190 -16 150 312 -315 -120 9 105 -452 -205 -450 -375 -420 204 -116 212 190 -6 142 -218 484 301 342 254 -296 -435 -12 147 165 138 7 -180 -410 -480 -198 377 14 136 -402 172 72 -174 290 37 280 -225 242 73 -445 -41 -17 483 -468 253 -483 127 365 189 234 123 -85 233 211 -211 328 -263 -200 298 -148 287 187 -240 160 438 197 -252 417 306 -349 -189 257 -433 446 36 -237 -352 246 -478 -145 180 408 200 65 -246 330 343 -258 -391 -421 -18 259 -68 494 454 -44 258 38 282 148 -444 -30 469 -162 374 -97 273 336 -270 350 -471 -168 -161 461 -207 -229 -77 333 310 -311 383 227 -307 332 80 168 235 32 -171 209 -330 192 348 -314 61 149 -284 213 -297 15 -276 -62 -466 84 -140 -7 60 -58 66 -459 -149 -65 -36 -299 -482 -334 31 -289 -463 155 140 -82 -286 115 22 109 459 -137 182 -37 -80 -167 -243 -176 -117 -164 -357 125 416 335 92 406 -319 -129 -386 18 -158 -269 -326 238 422 128 -101 96 -52 -489 -438 23 499 -102 255 177 -38 322 -408 -288 395 110 -431 435 74 300 -212 30 292 474 -13 -57 432 465 -56 -495 68 -472 -108 401 -260 129 -372 243 -305 -186 303 381 229 44 453 93 174 210 -74 307 275 349 387 -20 101 -440 277 120 455 -214 -157 444 11 295 460 429 441 -387 -494 -457 -359 -355 492 -87 324 -434 -256 198 262 -92 173 29 201 -130 83 388 -406 -226 -156 -154 -181 -385 -397 476 -496 194 256 175 294 214 -175 -210 158 51 497 130 -10 245 -250 -223 -247 -318 346 -105 260 -428 421 323 400 21 -28 404 151 279 -43 -491 -155 -336 12 -287 -86 288 75 -5 -188 41 -417 225 -261 384 -135 393 -443 418 -46 -15 -209 -324 -136 -393 437 -419 425 445 430 217 -365 -278 -304 -366 -351 -345 457 -184 339 -467 308 391 207 -298 -331 431 -216 286 405 337 -280 317 356 -31 -313 -4 -182 -371 -233 -358 -51 -293 -150 -40 144 -312 -363 -294 -347 -464 166 228 137 -403 486 -160 419 114 -266 -1 -339 327 496 302 251 223 319 480 -418 433 -169 -458 -300 85 448 -474 371 -220 338 -245 118 162 -112 -262 13 479 193 154 -98 49 -460 240 -442 -377 466 363 451 -383 361 220 452 359 185 331 299 -413 113 218 -486 314 -26"
"90 -148 -373 -233 324 -38 99 338 461 328 -97 201 -134 -83 -32 -22 -230 -123 6 -463 416 417 -183 -67 -170 370 -327 -138 -443 -394 -417 25 332 243 218 152 253 145 69 -448 -160 471 -119 422 269 -216 151 493 456 -305 394 9 -171 -495 232 91 -68 -323 375 388 -21 316 373 -217 -436 236 189 -476 1 188 -272 -109 -366 347 437 -498 28 202 -481 -192 -46 -257 -364 103 -13 487 58 227 -79 186 399 -17 -349 268 5 413 150 -11 -434 -105 -311 62 -279 410 -339 -333 287 345 -54 -390 115 -449 354 -236 -315 19 -129 -332 -88 234 160 -375 -324 -312 -386 -245 275 -131 -33 -147 288 -296 130 -59 96 -268 51 213 304 -53 -473 109 223 -168 118 4 -362 -389 397 78 216 -107 336 233 212 256 483 -267 0 -234 -263 117 331 -195 296 -370 -104 278 258 -282 -409 -164 -470 -146 177 -387 -23 -43 -39 436 -227 -5 42 191 -446 80 -457 -271 353 185 462 -165 -365 73 476 -139 -363 -225 -142 -209 -487 313 -242 -494 321 434 68 490 323 452 -273 -422 237 36 -281 -455 -223 423 53 277 65 246 257 -3 249 312 20 -317 -440 228 -9 26 171 -369 405 498 -460 -113 158 -61 -302 337 -181 424 -15 342 111 -161 -72 -329 327 -381 -425 457 127 157 61 135 -70 -456 7 95 -402 105 -24 250 104 -75 392 -126 -48 368 -98 402 -6 -151 133 -303 -453 241 438 -392 463 367 265 -431 -316 372 -412 -80 168 477 79 -29 -212 -253 143 -284 126 382 -480 -247 -351 458 294 -249 -200 -159 -413 209 -356 82 -418 -115 474 447 -238 -405 -49 391 308 -420 142 -231 225 -92 427 -380 199 -177 -37 -297 381 -477 -218 -461 59 408 -342 -340 330 270 -357 -306 23 -299 -367 38 -130 401 384 -307 -252 459 315 129 17 302 193 81 360 -82 -202 -447 369 -244 -114 172 -328 448 -185 366 -4 131 -128 -266 -411 -163 421 39 479 -404 14 -190 179 159 -396 -288 161 -41 317 -96 -419 497 291 412 285 379 386 361 341 -290 473 230 -283 272 -74 -87 -193 187 -167 -384 263 -116 411 -85 -277 -466 309 -424 -454 380 295 140 322 -118 -350 -313 240 -439 -489 -486 262 -18 -77 -213 -64 147 -374 107 -361 88 146 -52 -44 -372 284 49 439 76 -108 -482 343 -90 -343 198 74 -12 481 -81 -191 -184 -471 200 165 325 -14 -201 -348 -84 -289 333 420 71 -337 119 326 289 407 86 280 -379 -484 35 335 -493 454 18 170 -274 -310 -34 -478 499 93 54 -262 -490 144 238"
"-51 416 -201 -42 264 -209 65 406 342 271 231 -271 -69 -219 -290 -275 -74 329 -107 446 -141 -278 -342 400 -331 386 376 -133 423 225 -40 -355 488 79 -336 499 388 265 10 -286 -329 436 -185 311 213 -384 -234 87 -118 -287 333 469 -310 444 -211 30 147 -339 -79 -202 -94 -93 -299 185 118 -162 -441 33 -417 106 327 212 -111 -223 480 487 29 -354 -96 115 -28 429 -469 -6 283 -22 46 -220 -64 -320 -227 326 121 -11 -84 -170 -448 -309 32 -229 84 -82 53 -155 -473 145 -70 -346 135 -112 -1 -455 -345 -88 -182 -431 439 197 -253 -158 119 211 171 357 -457 -291 128 -57 -285 170 -99 -381 -357 -454 276 24 215 -19 -347 3 -49 -446 -187 440 196 13 -499 127 169 371 -450 412 221 -297 -153 83 -184 -81 -86 -395 226 -273 286 328 163 392 299 -465 248 107 316 466 337 -44 -314 486 289 -337 -38 58 -493 461 -241 -419 181 223 -244 -312 -200 -249 -252 -165 287 365 315 179 437 -230 -404 116 -131 -207 349 -41 -127 490 -228 361 -456 389 -466 34 411 25 -210 -367 430 -472 -61 -324 -259 12 -169 261 -328 -480 -26 -254 195 8 172 19 -440 -491 -496 193 -428 90 309 -9 -135 417 -159 129 39 155 269 -338 112 247 -98 -250 -460 401 -308 47 -398 88 237 318 191 -274 142 -73 -348 -140 -434 -97 -204 470 -208 -300 -270 120 -358 274 425 -311 413 -262 186 -304 -318 344 -305 369 -430 295 -325 -67 409 479 -194 -89 209 -365 -189 101 15 -175 244 -421 140 -378 -266 -17 50 -470 16 20 -301 190 56 -272 -43 -307 -435 -368 -427 305 -295 355 -467 -179 390 -251 285 218 360 270 -143 277 173 227 358 -154 256 -121 -13 64 -130 -387 -406 -33 383 278 95 300 73 -420 160 -65 -80 302 117 136 -488 404 43 216 176 385 482 69 -39 -102 -32 -243 -423 70 489 80 -239 -114 321 303 473 41 206 -332 63 438 241 -344 -36 214 -375 498 -196 -407 -198 -284 -459 -256 422 97 259 210 235 -231 183 -225 -495 381 -268 182 -415 125 317 156 374 -475 -412 132 500 -68 -464 467 -120 -316 -164 -261 308 -257 -369 -60 -180 341 -264 175 330 -425 -399 202 -409 -326 -193 434 89 477 442 451 -489 -380 -248 93 272 443 -157 445 -396 -138 222 -45 159 -330 -149 233 -232 -236 -116 -119 402 279 -463 139 -451 290 44 -21 356 -487 -4 251 391 -77 -213 184 -18 -123 199 -479 -372 476 -385 -139 243 372 313 -106 -31 187 -350 -376 378 -389 -216 -246 99 -293"

"8552 -34995 19426 -41259 39057 37996 -23548 23852 92061 -2546 24224 70023 24603 -16071 85113 90437 26770 52722 -70991 -55163 81557 -36144 -53273 90176 -15576 63174 99688 75552 -31289 83529 -64752 -23199 15317 -642 -83917 93128 -54663 -36252 -41893 -86635 -10836 20846 90401 -71200 73274 81859 -82716 59854 -24371 32906 98524 49891 -70297 -14236 3802 -23306 45386 -28218 -83983 76985 -66161 59685 471 7582 -58063 -23379 -5673 90897 22266 -68515 -82619 -7885 -80205 -68302 55251 41097 -63156 -50733 31381 -78278 68356 -57593 -23992 -59475 49152 12786 15579 66016 37901 -65494 -74820 -10210 2463 -1006 54310 -62829 17796 -69670 30978 -22165 -39460 13878 35204 24122 -68253 14034 64016 29710 35288 -30833 9642 -64461 -89231 4406 74497 53287 49850 5675 26194 19716 -96565 40771 41989 5217 -24814 74025 -31973 77380 -97306 64610 -40311 -40679 -18456 -74952 -6052 -39960 53593 -24753 56990 -74377 -93062 98115 32648 72987 -14167 15719 -43866 28427 -92637 -14518 -60362 15531 -30988 -77508 49505 5150 -61855 -51379 76752 6715 83679 23337 98375 58825 -41924 5215 -63867 52142 79256 -13196 85914 -79982 -84229 2267 66001 -69800 35803 -27481 -50755 99076 -36075 -61914 -17994 56757 -7074 -95544 17624 40022 97707 -52763 -23124 -80397 -16865 -63773 36063 82734 24196 83097 26982 -71796 -35424 -39677 -75837 -70593 -93382 51606 -16633 -80551 -82849 -49996 -60243 -96396 68374 -23277 17198 39720 71196 62358 -92364 47831 18243 -86777 -25788 -62813 -46288 -64469 94719 79491 -13704 -20304 -54882 -43363 68304 63696 51668 26065 156 80154 -75030 -85752 44629 -78176 838 72811 -28408 -94662 17784 -98803 -65586 78070 56235 53441 -56977 -44828 10346 -47861 -98382 -92742 37349 -707 -55147 32417 31791 19337 -25630 -18279 74550 94322 82274 82931 91869 5828 -88966 -23340 21938 -14253 -19936 -2084 -87903 -34783 88082 78882 39775 -88508 64653 -76046 42491 -49348 66057 -47323 74115 97876 -68213 -31918 -88122 13428 69580 69653 46337 31442 -72745 37379 7244 71733 -66906 65912 -30536 -60057 41159 47697 36914 69451 49803 -32731 41873 55050 25969 -6416 -11136 60491 5345 -78741 36697 -83733 -86316 93831 -84809 74405 -66134 -14026 80321 -15376 -21408 13695 60014 -5607 -295 -2729 84725 51857 -36397 99232 97248 -43496 -89347 37248 -42965 20142 83112 -20309 -2645 -21763 74449 -98565 -91270 61439 -80213 -64320 -41446 -31696 17978 65108 -31579 84633 65557 66785 -86340 22075 -42539 58893 75481 35123 65029 31736 32256 -24526 16866 14787 -80809 15740 17877 26936 77393 -50841 14531 -49075 -45153 35321 44260 59899 -68932 -3292 -48816 87700 -2457 -53870 11822 82784 62777 -39342 -5079 -90325 29423 -91206 71456 70999 -92463 84032 -24086 51317 -87076 71110 6528 97071 -91790 -14623 16689 54895 85228 -37282 -80591 50396 92743 -68104 53789 -28122 -73156 -59145 985 -61452 -78890 -55073 -14683 83150 -67700 76344 52230 -88348 19099 51369 -89091 -51875 -24979 -78694 54375 4169 78414 41952 -31641 -2000 54306 33205 -50168 90764 -93304 45750 -68811 -26424 -36510 72305 44790 87463 -21903 -49426 -4630 -36116 13403 52747 -12062 1036 -78566 -6312 -76810 -70247 45201 -29163 81611 -79451 -68774 80363 -69362 69537 -53496 75276 -11658 -85430 87413 -74013 18616 75352 -77675 -34437 67956 59001 -40636 71811 -72660 39345 -3786 43458"
"-86043 66765 52108 -40488 70580 15471 7446 -43247 83675 -78122 -88435 -94145 -38888 31651 36491 -9097 64829 83699 -52582 -21293 -45466 2371 7323 7441 -61544 31988 -31350 31389 -1059 63622 66470 -15702 -91587 64980 63671 -94849 95990 -79322 -93305 1813 80419 64707 3227 14166 14480 9866 45437 63612 -29182 -35596 -78227 -55191 -37045 -51234 -99873 68265 19723 93072 75702 -39071 -65304 -40427 84154 85649 69041 66710 52251 -49851 90294 -1985 4049 99715 60315 -60203 -45065 -73101 38459 -24604 91849 -68878 48244 68528 -21219 -23529 4243 -45292 -68761 -12770 -45053 -84669 -19695 -98417 -65888 29764 84246 22455 -71492 -59092 -72877 55749 36737 67926 -98619 34369 7744 -75509 -58507 27269 3206 -75063 2662 26498 35769 93852 65130 99581 -37294 -70643 31567 -68788 55146 -82799 -21854 -32664 -75225 82971 -76272 -77995 9899 -78440 75276 43465 28833 24332 62834 27091 6654 -89499 91758 -84811 69296 90306 61741 11037 -70178 -18088 -62166 88948 -28310 84509 -62256 -52642 38863 -61793 -35507 -4199 70030 82531 -58235 -55477 93513 -92512 44707 -98169 -7379 7279 -43365 -4176 -94720 87372 88015 51814 -61922 79530 -1595 -76761 55183 -89054 -10410 50807 -57632 62033 26469 16261 -10031 33383 -89734 -40076 -92594 -95267 -82720 -2081 6090 -67101 13031 -14277 -90889 -30300 8169 -98965 84661 -68704 85208 35199 -26760 41295 96571 -12329 68455 85863 -4222 -6449 -41174 -16024 -92400 -58941 38572 -23728 -39210 -22024 -31288 -50713 -33185 -5593 -74223 16469 31312 -88264 -3488 16223 20189 49322 91130 67258 84571 83267 31243 46846 38257 9941 13042 86252 56771 79959 -98689 -31436 1990 1982 -56683 85512 42797 34171 2135 -33298 67193 -69243 -38484 -92169 -46354 35286 -7926 15564 72332 11144 98451 70302 -61682 -68051 -85287 50158 49161 27856 68872 19699 82700 -78405 -48105 -24371 19512 -25761 82943 51604 -9458 89315 -40736 -53401 -52321 92055 -6187 51948 -14560 79511 -87610 39705 6449 38682 96860 4416 81836 -63127 50917 -36251 62949 28989 -6071 -75529 44807 -44605 18988 42957 -35043 -82521 26138 -43335 71015 -91786 42330 97747 71279 -97337 -34369 50908 -7610 -62644 -75253 -56732 48370 -79744 64765 85498 -39576 -58802 36722 -41669 34782 -34454 -92349 60266 -52958 55465 53310 -33816 14016 -33465 -17721 -14581 69810 -52217 -55059 -89048 68800 -47560 -93339 -51498 -22282 1481 14136 40676 -73793 -64525 58307 58949 -53838 -86093 -55695 88406 -68065 9305 23379 64012 -9250 -33496 72063 39148 -27025 -14032 14749 12328 -73569 40778 71363 -79585 34686 -11571 35603 -1095 -17263 43308 57447 -74436 11043 -10935 -69702 14120 -96450 23894 -4725 84863 -68333 -59630 83723 -62651 82009 52531 40624 -97899 -79792 -82726 -77576 -68219 -43489 -22074 -57309 3949 71117 64584 -93572 -64190 -48521 37439 36995 -21523 -57490 -33578 -36549 84512 -62189 -56102 4625 -49774 29375 84641 -19690 -6055 -71057 4622 -5905 -83059 368 66334 8332 -7024 -53787 -61925 -33114 -59681 25468 -65610 -23892 -53589 67846 39641 11895 53497 42017 -14971 63267 6051 70671 30222 -8630 -45442 57901 -50882 46964 -63283 55513 -65208 -3239 -66101 -87222 -41847 72781 96916 -4291 -77055 39127 -15288 93704 67459 -28234 37415 -68674 10145 -53731 78770 1248 -55302 93523 -42470 -2693 84704 -86746 -16283 -40317 76810 -97883 99613 58562 37916"
"60754 45655 97325 -76993 85952 25271 19895 85916 7343 -68961 79887 -44062 17180 -43473 -4923 -38215 -37327 13737 -76896 60985 -74327 -10131 -96818 430 4893 -89945 1455 -20071 57429 46732 90441 54652 70528 58853 57168 -71475 -61590 76856 3062 82726 48917 1002 -44445 -92309 38793 -94737 31065 26949 -76753 -95926 -10954 -3951 72243 43916 9793 13317 -20991 32559 21109 -78 -19238 -3384 69328 81177 11288 35702 56194 -30932 28550 55461 -48222 48336 -4903 91233 -11868 50788 26851 -8001 87085 84458 -85446 -1315 50496 -92283 -23409 61908 -91376 64216 -35626 19387 85252 18895 -71519 4173 -15134 -2046 -35149 57795 44578 94382 -96782 37458 88246 -1705 27113 4572 -27377 1614 -84140 -75892 12299 -3900 14694 44633 97485 -81901 -75484 -10501 6432 45868 55910 60232 44282 41634 -55211 58064 -30002 -18479 -76461 45552 14762 -46630 92654 92477 -71085 40091 48590 59064 -96322 1396 2310 35263 92211 81306 3275 -85617 -48021 -65501 -48529 26896 28927 -22732 85963 -5403 -7514 -50347 29468 86423 83359 -13899 40514 71565 -31325 18706 -50434 -31705 -13630 13090 579 -94030 -37408 -22329 -94918 -83237 14096 99227 50956 77034 70428 10361 -10975 30610 58615 33356 54194 -74257 25878 77297 -49801 -21765 -96288 -38059 -57262 -85887 72206 -25756 -78576 76722 -69361 -63022 -23140 65060 42754 11358 90909 -44299 -86520 47122 -96897 9387 -54057 -12137 36496 -53742 12868 25713 -26090 47905 26011 39680 49784 -88230 99017 88132 22110 15906 76134 30444 77446 50100 -2182 72737 -46244 -35883 -45653 8489 13179 -62284 29992 41193 -21825 69866 5893 71355 28222 73773 -64346 -56850 8017 75010 -13956 -65577 -86182 -953 -24892 -94780 74188 69163 77538 95481 78944 20161 85275 99838 -93764 95938 -79515 -62534 -27045 -19277 6165 -21339 -62337 64228 45324 51831 -82652 -41826 -75518 16510 -29918 55595 -95711 -61908 35163 47462 2816 74681 -41417 -29231 -19905 -99113 29012 -16952 -24182 -29400 -96455 24146 -48700 17646 -70224 -95129 75427 89042 -90091 -69789 -48028 35280 -25671 61110 45605 -51335 -73841 -95985 -84331 46015 2519 -66829 37557 -92807 -81417 74678 40294 -97470 -44997 16332 -6538 39899 72432 82081 21502 -27905 -90025 -24088 -32235 -47078 -44942 -75286 39862 -32692 -49752 60288 -80703 91124 32337 -39754 40076 -12293 13377 -71645 20911 -17891 98074 64365 94704 21325 -27865 16047 1044 -75748 43780 82857 -33379 -89457 -73377 52972 53848 -59046 12074 13438 73766 14709 97830 36009 35548 62132 -1721 92822 -80200 -53247 -57214 -89465 75435 -43318 -22187 -69324 88734 -13367 96544 46087 99075 -28461 83590 40722 -84372 -50432 26079 -60652 -64403 -93914 98723 -48522 58805 -56746 77376 -25408 82981 -87460 -9365 96833 -59715 -44158 -73599 -25661 -64026 -34180 3725 4920 -22024 -26535 -43689 74092 4710 -81226 92380 -72803 24476 -36957 52699 -94863 70521 -49996 -56748 -36439 87554 38403 41146 48392 79604 71473 -33460 50247 -3232 -46598 82035 90522 -20629 44368 95949 87158 95053 47507 42581 -77218 57229 67606 76172 -24281 40679 -1825 -78607 -94847 48814 -95759 -16398 40555 41063 82628 -5101 -3324 72311 79461 -17651 -64467 42505 -22373 21064 -82613 -74216 89886 -83814 -9174 7962 -97727 34549 -30724 -16262 38533 -56724 -68425 -49031 -66472 -47499 -35342 -55488 92014 87297 -85595 15946 3393"

"383043 541989 685954 60710 397531 417295 997051 627165 283253 169657 461991 689314 894495 409162 597113 758776 645586 21946 66112 395709 627255 150153 114166 187665 778050 783146 92602 899529 37622 958500 207945 885416 758997 438691 442992 662280 669477 500146 51682 927462 132869 514901 771314 80001 347828 777216 486648 830393 804668 171008 589192 689053 600346 839601 650769 960715 441904 39433 944697 214915 197635 509545 353614 868973 45016 525159 197085 338478 724643 631118 206825 631087 854476 656499 108153 282536 778211 645970 990174 468028 574801 767813 221970 712850 546530 543510 780552 32938 463347 195074 285027 970604 475410 43771 812420 760496 536140 140581 784214 713088 412033 932805 208327 22282 945333 60794 451567 385570 413700 539006 659103 326834 321690 398812 703773 429056 282948 781786 133855 838174 2849 413457 355484 768017 339717 246601 521015 671392 94694 570420 595852 918710 341822 944579 117445 874011 37700 68027 262022 446638 877354 194263 954012 750953 743649 211768 557068 987868 988434 971577 924908 763335 454422 803022 458162 295651 368948 451029 104257 99400 821914 311129 977981 784532 77624 308118 534129 364972 380417 590326 169070 29706 100785 109271 73053 659298 337352 804508 644577 998295 831457 148004 487605 462104 328000 987212 246440 850608 180905 277856 420044 164834 442473 840421 595137 658836 553850 41415 246316 941991 117106 34524 665677 33733 527032 258560 907696 382096 642928 203412 307335 181935 423236 459627 21265 124913 295511 185600 366700 588498 312677 549440 923791 901809 708507 851816 183646 283700 785156 303552 657612 295638 474560 98537 576078 188731 467357 415972 952581 681869 655476 254852 368863 670880 867018 631984 354743 285431 853946 311861 691953 651078 408435 319036 453445 502315 411725 499808 994147 426497 494347 235485 735596 355100 800502 416522 738328 656424 74719 437667 98204 237326 552088 110411 653565 408434 307975 919483 604644 921102 866999 483848 548342 142202 494573 331109 633131 528669 484344 336674 845264 726780 151031 421539 633607 504807 950743 492242 912117 614279 140759 858071 745745 959393 118618 880442 651130 691902 263520 960451 682735 864605 952974 947019 343172 661119 681498 437836 314096 78114 599665 989898 805412 410409 434056 619444 43597 372121 623558 308372 479169 341274 618162 181844 901380 764990 130390 946138 985525 366980 2176 267004 781441 652047 919965 572022 598675 130916 868883 899113 646048 226027 310722 758576 49673 150913 867787 600845 93669 769560 350050 94943 931133 577951 909361 55153 281349 837 356077 34604 685155 681194 704092 931262 235786 865775 776339 49907 740709 18014 679375 709360 736133 220264 137805 633986 134457 739529 926223 738705 312681 794452 508038 776854 733419 946740 302646 800805 930265 65969 363554 480565 998291 675084 957182 353246 875749 530507 48252 235314 781024 309253 578552 775807 208186 442108 169109 508631 336628 69629 137510 377386 108272 909631 493001 871941 318866 891025 931866 593195 280946 690843 360449 888378 751582 827161 904034 600568 597962 314997 71596 928637 102384 649177 908149 837618 144598 784642 768727 761755 661271 963070 622304 396952 676079 419050 930660 91579 459631 285334 851759 176924 46985 374109 876065 518146 315489 394005 290147 785210 916088 852032 362658 813025 371144 443835 442581 153071 418441 675014 978048 180971 409326 108138 900268 827266 353564 526443 634731 805422 291607 245171 670706 975509 825599 134364 498096 36754 659776 688687"
"-886341 -544528 -548589 -819901 -249850 -892889 -756836 -265713 -328008 -779744 -346887 -65415 -54964 -178976 -350837 -505919 -586333 -611531 -5104 -435401 -71907 -410261 -336450 -530100 -338014 -821142 -273406 -357494 -542213 -151917 -653741 -209158 -231014 -839527 -904345 -195735 -197257 -828822 -272758 -768588 -749749 -439135 -884546 -720085 -73127 -474048 -210064 -26458 -708617 -859471 -967567 -663698 -431700 -378895 -625729 -473518 -309359 -702842 -146558 -76837 -59081 -753003 -774284 -565693 -393941 -254589 -224235 -906947 -166860 -448877 -944073 -396228 -172311 -695974 -154118 -242425 -938114 -604596 -822902 -872810 -832742 -71925 -1608 -286831 -949769 -382196 -820285 -316635 -374208 -977175 -795860 -793756 -292376 -632780 -310600 -974048 -826968 -722922 -319873 -433972 -805415 -319817 -735692 -807160 -296900 -913619 -324211 -799344 -438963 -532835 -485993 -62448 -948820 -82945 -132806 -310749 -994520 -176147 -786089 -525258 -49069 -421181 -846125 -296370 -415036 -139296 -885780 -167574 -235974 -437474 -69874 -569269 -662564 -634783 -50291 -841486 -366126 -20076 -148375 -916408 -24083 -177532 -457168 -703125 -682863 -8867 -809043 -396084 -164259 -445562 -660254 -519652 -147550 -660545 -130263 -794159 -823715 -280636 -400760 -379047 -475174 -256047 -421866 -197192 -546071 -787237 -200171 -866198 -703847 -390470 -358595 -922948 -191728 -936882 -337934 -964378 -28189 -171119 -248111 -255947 -761822 -763417 -109327 -265334 -335458 -212897 -910956 -438396 -479448 -678520 -97262 -604286 -362212 -358037 -872424 -753685 -325657 -876717 -826353 -800752 -446596 -850727 -957997 -438303 -144330 -502251 -928889 -906722 -619863 -23458 -682832 -604443 -923322 -46624 -720564 -897795 -222791 -463787 -559903 -662646 -384137 -286745 -954445 -970973 -664162 -694943 -158301 -938138 -511154 -829123 -491465 -507169 -936577 -8375 -265501 -99084 -908793 -162821 -365664 -194231 -812517 -130693 -163020 -683900 -523630 -314703 -279532 -10021 -339521 -247696 -764209 -878328 -301505 -788738 -904422 -77323 -47477 -180795 -592571 -264362 -8650 -888498 -928237 -817649 -494503 -440125 -814676 -845331 -158816 -516491 -899116 -722891 -939698 -572385 -470680 -893055 -635243 -940461 -933381 -281740 -268848 -837525 -204963 -321425 -547230 -799409 -671561 -858253 -373226 -392917 -863487 -564977 -734695 -945539 -347077 -976599 -756923 -814574 -741178 -253906 -940085 -984612 -776311 -774403 -823502 -732905 -265775 -793815 -522218 -587330 -239060 -818610 -224901 -382906 -97213 -719294 -195436 -847685 -90083 -962310 -174129 -243961 -389525 -916982 -263526 -568621 -634620 -526685 -674039 -697782 -413667 -982282 -258861 -301106 -186501 -434950 -186903 -281288 -485710 -227657 -963669 -316381 -194566 -498147 -741799 -117081 -418563 -285923 -658329 -873153 -186750 -558387 -29669 -976258 -287265 -99753 -393467 -284359 -367620 -330791 -851076 -395282 -602808 -113867 -654804 -829559 -675681 -744840 -189815 -95391 -94066 -474425 -442207 -640139 -793395 -841086 -673786 -728569 -794552 -851508 -217923 -619276 -964224 -354931 -593534 -92392 -250399 -640475 -575391 -462752 -907985 -817768 -650411 -914023 -841932 -273463 -698965 -31057 -868174 -932194 -479390 -402381 -198306 -744829 -471302 -918651 -216094 -150099 -427949 -710056 -947985 -315517 -502962 -190235 -865875 -937348 -698369 -21477 -911027 -854776 -755532 -614946 -979388 -106296 -64149 -835003 -31054 -719486 -878705 -120104 -830571 -320872 -116476 -286433 -795300 -609095 -808326 -625688 -506431 -424206 -716021 -706098 -796292 -846041 -515381 -253570 -836639 -909778 -353926 -729330 -328475 -796524 -413758 -512566 -86122 -196198 -227460 -843230 -581554 -210494 -580469 -277180 -712889 -710715 -344212 -56409 -811763 -758143 -940606 -667240 -915196 -934768 -180489 -512263 -465817 -293600 -395188 -910128 -500747 -428289 -343711 -236474 -633256 -749171 -75847 -680906 -306220 -886869 -819839 -238532 -623076 -134496 -602401 -890120 -289720 -910652 -454240 -567258 -481717 -248453"
)

test5=(
  "1 1"
  "test"
  "1f"
  "1 1f"
  ""
  " "
  "  f   "
  "-2147483649"
  "2147483648"
)

i=1

for str in "${test1[@]}"; do
  echo "$i: '$str'"
  echo "my checker:\n" "$(./push_swap "$str" | ./checker "$str")"
  #linux checker:\n" "$(./push_swap "$str" | ./checker_linux "$str")
  #$(valgrind --leak-check=full ./push_swap "$str" 2>&1 | grep 'no leaks')
  #$(./push_swap "$str" | valgrind --leak-check=full ./checker "$str" 2>&1 | grep 'no leaks')
  ((i++))
  echo ""
  sleep 1
done