

main.o: main.cpp
	clang -c -fprofile-instr-generate -fcoverage-mapping -fno-profile-instr-generate -fno-coverage-mapping main.cpp

mainWithFlags: main.o
	clang -fprofile-instr-generate -fno-profile-instr-generate main.o -o mainWithFlags

mainWithoutFlags: main.o
	clang main.o -o mainWithoutFlags

coverageWithFlags: mainWithFlags
	rm  -f *prof*
	./mainWithFlags


coverageWithoutFlags: mainWithoutFlags
	rm -f *prof*
	./mainWithoutFlags
