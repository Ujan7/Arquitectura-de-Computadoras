// // A
// 	ADD X30, X30, XZR // SET N
// 	ADD X2, X1, XZR
// load:
// 	CBZ X30, endload
// 	STUR X2, [X0, #0]
// 	ADD X0, X0, X8
// 	ADD X2, X2, X1
// 	SUB X30, X30, X1
// 	CBZ XZR, load
// endload:
// //	CBZ XZR, endload

// // B
// 	ADD X30, X29, X1 // SET k = N
// 	ADD X29, XZR, XZR // t = 0
// 	ADD X0, XZR, XZR
// sum:
// 	CBZ X30, endsum			// while k != 0:
// 	LDUR X28, [X0, #0]	// 		X28 = A[i]
// 	ADD X0, X0, X8			// 		i += 1
// 	ADD X29, X29, X28		// 		t += A[i]
// 	SUB X30, X30, X1		// 		k -= 1
// 	CBZ XZR, sum
// endsum:
// 	STUR X29, [X0, #0]	// A[N] = t
// finish:
	// CBZ XZR, finish

// // C
// 	ADD X30, XZR, XZR
// mul:
// 	CBZ X16, endmul
// 	ADD X30, X30, X17
// 	SUB X16, X16, X1
// 	CBZ XZR, mul
// endmul:
// 	STUR X30, [X0, #0]
// finish:
// 	CBZ XZR, finish
