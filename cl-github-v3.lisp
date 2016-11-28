;;;; cl-github-v3.lisp

(in-package #:cl-github-v3)

;;; "cl-github-v3" goes here. Hacks and glory await!

;;;  (delete-package 'cl-github-v3) - deletes / unloads ASDF package

(defvar *github* "https://api.github.com")
(defvar *user-agent* "cl-github-v3")

;; (yason:encode result) to print out User Hashtable structure
;; http://hanshuebner.github.io/yason/
;; (gethash "login" result) to print value for login key
;; http://cl-cookbook.sourceforge.net/hashes.html
(defun github-user (user)
  "Get info for user USER. Returns user data."
  (let ((url (format nil "~a/users/~a" *github* user)))
    (get-json url))
  )

(defun github-user-orgs (user)
  "Get USER organisations"
  (let ((url (format nil "~a/users/~a/orgs" *github* user)))
    (get-json url)))

(defun github-user-repos (user)
  "Get USER repositories."
  (let ((url (format nil "~a/users/~a/repos" *github* user)))
    (get-json url))
)

(defun github-org (org)
  "Get info for ORG. Returns org data."
  (let ((url (format nil "~a/org/~a" *github* org)))
    (get-json url))
)

(defun github-org-repos (org)
  "Get ORG repositories."
  (let ((url (format nil "~a/org/~a/repos" *github* org)))
    (get-json url))
  )


(defun get-json (url)
  "Gets json data for url with options cookie-jar."
  (yason:parse
   (drakma:http-request url :method :get :user-agent *user-agent* :preserve-uri t :want-stream t)))
