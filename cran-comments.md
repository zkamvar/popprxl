This update adds "adegenet" to suggests to fix an issue brought up to Kurt Hornik:

These seem to have undeclared package dependencies in their unit test code (R files in tests subdirs), see below.

$popprxl
 'data(package=)' call not declared from: ‘adegenet’

## Test environments
* local OS X install, R 3.5.0
* ubuntu 12.04 (on travis-ci), R 3.5.0 and devel (2018-05-17 r74734)

## R CMD check results
There were no ERRORs, WARNINGs, or NOTEs

## Downstream dependencies
None
