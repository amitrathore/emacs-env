(add-to-list 'extra-classpaths (concat *WORKSPACE* "/frumios/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/frumios/spec/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/damages/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/humpty-dumpty/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/babble/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/conjure/src/"))

;;; the Remember project
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/remember/src/"))
(setq REMEMBER-JARS
      (directory-files (concat *WORKSPACE* "/remember/lib/java/") t "\\.jar$"))
(mapcar 'add-to-extra-classpath REMEMBER-JARS)

;;; the Clojure in Action project
(add-to-list 'extra-classpaths "/Users/amit/labs/projectx/writing/manning/muse/muse-content/")
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/ring/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/compojure/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/clj-html/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/enlive/src/"))

;;; the Cognifly/Cratos
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/okula/cratos/src/"))
(setq CRATOS-JARS
      (directory-files (concat *WORKSPACE* "/okula/cratos/lib/java/") t "\\.jar$"))
(mapcar 'add-to-extra-classpath CRATOS-JARS)