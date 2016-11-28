;;;; cl-github-v3.asd

(asdf:defsystem #:cl-github-v3
  :description "Describe cl-github-v3 here"
  :author "Tim McGilchrist"
  :license "BSD"
  :depends-on (#:drakma
               #:yason)
  :serial t
  :components ((:file "package")
               (:file "cl-github-v3")))

