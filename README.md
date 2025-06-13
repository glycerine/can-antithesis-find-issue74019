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

---
author: Jason E. Aten, Ph.D.

License: MIT
