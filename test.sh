#################################
# ACCOUNT
#################################
#
# testhuman233
# owner
# Private key: 5JTt5SmDwn9rbcC2mcmBTD8gRWmX4vLVR2vMSgbhgacuw6VXyJ4
# Public key: EOS5ahoe6HpM24vCiF5pknqUJWsBLu3JT1zuDiPWPgPCXiQ26PC6V
# active
# Private key: 5KhmSGmbALUvfhcnPW6RZeBGfe2XK6nGCu5S8rRha5SjQecABbZ
# Public key: EOS5GBEjBr6ZkSmoqRDcGT6Uixvj3Fp3VKKkfVM1nubP15nT5Fkko
# 
# testcontrac1
# owner
# Private key: 5JcxrDGFJxU3fykNAJpBsLs19UC2KaBmUdgsViMwNHcp7vwmf1y
# Public key: EOS7t5rPmm1XgkmGHtrdq2qdQYVcfXqqEXSdFGEXcubaGRDvgurUu
# active
# Private key: 5KHLYj3DL5bBH2aTQ3hZuiw88ypLc1HjAvxJnYinNuv6UuTR3UC
# Public key: EOS7FGpW7ajM5YKJGUsWhDzhRegbKJZ8rBHJkXZZhWXaMjamtwcuG
# 
# checkiscontr
# owner
# Private key: 5KQpgPFjv2dLh83nw1v7aiNYcGGL3eep5cHiTHQnsM3qSR12Kd9
# Public key: EOS4yP8JpuHVBhWECvPRczAR4Jp9WBtLrHjtLHYFPCxqs3ppQFcrq
# active
# Private key: 5KkaaGnymPtbCMX5L4aZZiiJs4mrRbjif38Wh2WzmCWCufnuCaq
# Public key: EOS6udF8aepexfwqUgZLtTSMnat7Gcv7Pd4NtKo5cBWiV35jhME9f
#
#################################
# INIT
#################################
# cleos wallet unlock
 
cleos wallet import --private-key 5KhmSGmbALUvfhcnPW6RZeBGfe2XK6nGCu5S8rRha5SjQecABbZ

cleos wallet import --private-key 5KHLYj3DL5bBH2aTQ3hZuiw88ypLc1HjAvxJnYinNuv6UuTR3UC

cleos wallet import --private-key 5KkaaGnymPtbCMX5L4aZZiiJs4mrRbjif38Wh2WzmCWCufnuCaq

# if throw: Error 3200004: fail to resolve host, change 18888 to 38888 or others api.
# cleos -u http://dev.cryptolions.io:18888 push action eosio buyram '["testcontrac1","testcontrac1","50.0000 EOS"]' -p testcontrac1@active
#
# cleos -u http://dev.cryptolions.io:18888 push action eosio buyram '["checkiscontr","checkiscontr","50.0000 EOS"]' -p checkiscontr@active
#
#################################
# compile & deploy
#################################
# eosiocpp -g testcontrac1/testcontrac1.abi testcontrac1/testcontrac1.cpp
# eosiocpp -o testcontrac1/testcontrac1.wast testcontrac1/testcontrac1.cpp
#
# eosiocpp -g checkiscontr/checkiscontr.abi checkiscontr/checkiscontr.cpp
# eosiocpp -o checkiscontr/checkiscontr.wast checkiscontr/checkiscontr.cpp
# 
# cleos -u http://dev.cryptolions.io:18888 set contract testcontrac1 testcontrac1 -p testcontrac1@active
#
# 


cleos -u http://dev.cryptolions.io:18888 push action checkiscontr hi '["checkiscontr"]' -p checkiscontr@active

cleos -u http://dev.cryptolions.io:18888 push action testcontrac1 hi '["testcontrac1"]' -p testcontrac1@active

#################################
# 


