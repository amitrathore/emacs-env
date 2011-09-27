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

;;; the Jabberwocky project
;(add-to-list 'extra-classpaths (concat *WORKSPACE* "/jabberwocky/src/"))
(setq JABBERWOCKY-JARS
      (directory-files (concat *WORKSPACE* "/jabberwocky/lib/") t "\\.jar$"))
(mapcar 'add-to-extra-classpath JABBERWOCKY-JARS)

;; PARJER
(setq PARJER-JARS
      (directory-files (concat *WORKSPACE* "/parjer/lib/java") t "\\.jar$"))
(mapcar 'add-to-extra-classpath PARJER-JARS)
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/parjer/src/"))

;;; the Clojure in Action project
(add-to-list 'extra-classpaths "/Users/amit/labs/projectx/writing/manning/muse/muse-content/")
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/ring/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/compojure/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/clj-html/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/enlive/src/"))
(setq MANNING-JARS
      (directory-files "/Users/amit/labs/projectx/writing/manning/muse/muse-content/lib/" t "\\.jar$"))
(mapcar 'add-to-extra-classpath MANNING-JARS)



;;; the Cognifly/Cratos
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/okula/cratos/src/"))
(setq CRATOS-JARS
      (directory-files (concat *WORKSPACE* "/okula/cratos/lib/java/") t "\\.jar$"))
(mapcar 'add-to-extra-classpath CRATOS-JARS)

;;;; sherlock anaphoric macros, and other stuff
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/sherlock/src/"))

;;;; the oroborus project
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/oroborus/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/oroborus/spec/"))

;;;; sandman 
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/sandman/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/sandman/spec/"))

(add-to-list 'extra-classpaths (concat *WORKSPACE* "/sandman-client/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/sandman-client/spec/"))

(add-to-list 'extra-classpaths "/Users/amit/workspace/clojure-in-action/code/intellij/compilation/src/")
