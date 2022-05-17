# bc-be-contained
Work toward containerizing tools and processes from the BitCurator Environment

## Overview

Following ideas laid out here: https://docs.google.com/presentation/d/1RSWwAiHWogOHjsAuEH56XSP4R_jJMGiy0vfVwVH3JN0/edit#slide=id.ge91208f789_0_269

Additional context here: https://docs.google.com/document/d/1QVoQsSnWWXnq-_oThAkwksiAIkxs7EliPRK7Tx-1fpg/edit?usp=sharing
### Files in this repo
- _sample-data_ contains two directories:
  - _disk-images_ - two disk images from the M57.Biz corpus (https://downloads.digitalcorpora.org/corpora/scenarios/2009-m57-patents/), and a third disk image created for an introduction to Bitcurator workshop at BUF 2019 (h/t to Dianne Dietrich, Marty Gengenbach, and Amy Berish).
  - _logical-files_ - sample files for testing. Many of these came from the BUF 2019 workshop materials, and any sensitive PII included (e.g., SSNs, DOBs, GPAs) are entirely made up. 

- _docker-files_ - as of this writing, consists of three Dockerfiles shared in September 2021, April 2022, and May 2022. These have been organized according to the base operating system, including Kali Linux, Ubuntu rolling, and Ubunutu latest (LTS). 

- testings.txt - notes from testing various parts of this.

More to come, I'm sure.
