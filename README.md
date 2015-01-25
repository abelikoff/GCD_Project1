# Getting and cleaning data - Project 1

## Notes on implementation

* All work is done by the script `run_analysis.R` which downloads and
  extracts the data (if it's not available) saves it in a compact Rda
  dataset (for quick loading in the future), does the analysis and
  outputs `tidy.txt`.

* We use `reshape` package for aggregation for maximum portability (R
  on Ubuntu 14.04 is at version 3.0 which is not capable of using
  `dplyr`). Switching to `dplyr` should speed things up a bit.

* [The Codebook](Codebook.md) is composed manually, primarily because
  we produce highly derivative data and there is little point in
  writing all scaffolding for automatic generation of a codebook.
