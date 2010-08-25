(setq extra-classpaths (directory-files "~/.clojure" t "\\.jar$"))

(defun add-to-extra-classpath (classpath-entry)
  (add-to-list 'extra-classpaths classpath-entry))

(add-to-list 'extra-classpaths (concat *FURTIVE-ROOT* "/src/"))
(setq FURTIVE-JARS
      (directory-files (concat *FURTIVE-ROOT* "/lib/java") t "\\.jar$"))
(mapcar 'add-to-extra-classpath FURTIVE-JARS)

(add-to-list 'extra-classpaths (concat *SWARMIJI-ROOT* "/src/"))
(setq SWARMIJI-JARS
      (directory-files (concat *SWARMIJI-ROOT* "/lib") t "\\.jar$"))
(mapcar 'add-to-extra-classpath SWARMIJI-JARS)

(setq COMMON-JARS
      (directory-files *COMMON-JARS-ROOT* t "\\.jar$"))
(mapcar 'add-to-extra-classpath COMMON-JARS)

(setq CLOJURE-MODULES
      (mapcar 
       (lambda (clj_module) 
         (concat *FURTIVE-ROOT* "/lib/clojure/" clj_module "/src/")) 
       (cddr (directory-files (concat *FURTIVE-ROOT* "/lib/clojure")))))
(mapcar 'add-to-extra-classpath CLOJURE-MODULES)

(add-to-list 'extra-classpaths (concat *WORKSPACE* "/clj-record/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/furtive/spec/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/furtive/lib/clojure/postal/src/clj/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/redis-clojure/src/"))
;(add-to-list 'extra-classpaths (concat *WORKSPACE* "/humpty-dumpty/lib/clojure/redis-clojure/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/furtive/lib/clojure/clojure-http-client/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/capjure/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/capjure/spec/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/clj-utils/src/"))
(add-to-list 'extra-classpaths (concat *WORKSPACE* "/webbing/src/"))

(load-file (concat *EMACS-ENV* "/custom/user_paths.el"))

(setq swank-clojure-extra-classpaths extra-classpaths)