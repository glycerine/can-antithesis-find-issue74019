can-antithesis-find-issue74019
==============================

re the discussion here:
https://github.com/etcd-io/etcd/issues/20170

rr -h (chaos mode) immediately found the following bug in the Go runtime
https://github.com/golang/go/issues/74019

with details here
https://github.com/glycerine/rr_binary_for_issue74019?tab=readme-ov-file#analysis

The question is: can Antithesis find a similar
race condition in the Go runtime under go test -race?

A simple `make` should create and run a docker container
with the test, using docker compose.


The crash that rr chaos mode finds is in the included log
https://github.com/glycerine/can-antithesis-find-issue74019/blob/master/log.chaos.go1.25rc1.txt

The full rr (packed) trace for reply is in the my-rr-trace subdirectory.

---
author: Jason E. Aten, Ph.D.

License: MIT
