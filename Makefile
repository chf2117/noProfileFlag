

main.o: main.cpp
	clang -c -fprofile-instr-generate -fcoverage-mapping -fno-profile-instr-generate -fno-coverage-mapping main.cpp

mainWithFlags: main.o
	clang -fprofile-instr-generate -fno-profile-instr-generate main.o -o mainWithFlags

mainWithoutFlags: main.o
	clang main.o -o mainWithoutFlags

coverageWithFlags: mainWithFlags
	rm  -f *prof*
	./mainWithFlags
	llvm-profdata merge -sparse default.profraw -o withFlags.profdata
	llvm-cov show ./main -instr-profile=withFlags.profdata


coverageWithoutFlags: mainWithoutFlags
	rm -f *prof*
	./mainWithoutFlags
	llvm-profdata merge -sparse default.profraw -o withoutFlags.profdata
	llvm-cov show ./main -instr-profile=withoutFlags.profdata
