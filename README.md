can-antithesis-find-issue74019
==============================

re the discussion here:
https://github.com/etcd-io/etcd/issues/20170#issuecomment-2971126979

rr -h (chaos mode) immediately found the following bug in the Go runtime
https://github.com/golang/go/issues/74019

with details here
https://github.com/glycerine/rr_binary_for_issue74019?tab=readme-ov-file#analysis

The question is: can Antithesis find a similar
race condition in the Go runtime under go test -race?

A simple `make` should create and run a docker container
with the test, using docker compose. However, that will
use the real network (which rr does not mind, but
Antithesis surely will). To use a simulated network and
the synctest fake clock and barrier, type `make synctest`

The issues seen by `make chaos_synctest` under rr's chaos
mode happen maybe 1/3 of runs(?)--they are intermittent.
Log and trace of a chaos rr run under synctest are at https://github.com/glycerine/can-antithesis-find-issue74019/blob/master/log.chaos-synctest2-rr-trace.txt and https://github.com/glycerine/can-antithesis-find-issue74019/tree/master/chaos-synctest2-rr-trace

(I wouldn't try doing make chaos_synctest under Antithesis;
rr is probably not supported; it needs several Linux
kernel parameters set and specific hardware support. For
details you can see https://github.com/rr-debugger/rr/wiki/Will-rr-work-on-my-system and https://github.com/rr-debugger/rr/wiki/Building-And-Installing and my exact setup is detailed at the top of https://github.com/golang/go/issues/74019).

Another example of the crash that rr chaos mode finds is in the included log
https://github.com/glycerine/can-antithesis-find-issue74019/blob/master/log.chaos.go1.25rc1.txt

The full rr (packed) trace (for replay) from that run is in the https://github.com/glycerine/can-antithesis-find-issue74019/tree/master/my-rr-trace subdirectory.

---
author: Jason E. Aten, Ph.D.

License: MIT
