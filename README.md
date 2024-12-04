Steps to reproduce:

1. Run `make coverageWithoutFlags`
2. Observe that there is no `default.profraw` file

This result makes sense because the build commands do not instrument the object files or the binary.

3. Run `make coverageWithFlags`
4. Observe that `default.profraw` has been created

Expected result:  
Profile data is not created when `-fno-profile-instr-generate` flag follows `-fprofile-instr-generate`
