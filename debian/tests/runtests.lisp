(require "asdf")

(let ((asdf:*user-cache* (uiop:getenv "AUTOPKGTEST_TMP"))) ; Store FASL in some temporary dir
  (asdf:load-system "alexandria-tests"))

;; Can't use ASDF:TEST-SYSTEM, its return value is meaningless
(unless (alexandria-tests::run-tests)
  (uiop:quit 1))
