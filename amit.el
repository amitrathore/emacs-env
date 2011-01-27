(setq *MONITOR-WIDTH* 1920)

(setq *WORKSPACE* "/Users/amit/workspace")
(setq *FURTIVE-ROOT* "/Users/amit/workspace/furtive")
(setq *SWARMIJI-ROOT* "/Users/amit/workspace/swarmiji")
(setq *COMMON-JARS-ROOT* "/Users/amit/workspace/common-jars")

(setenv "FURTIVE_HOME" (concat (getenv "HOME") "/workspace/furtive"))
(setenv "FURTIVE_ENV" "development")
(setenv "SWARMIJI_HOME" (concat (getenv "HOME") "/workspace/swarmiji"))
(setenv "SWARMIJI_ENV" "development")
(setenv "SUMMARIZER_NS" "tesla")

(load-file (concat *EMACS-ENV* "/init/init_erlang.el"))
(load-file (concat *EMACS-ENV* "/init/init_haskell.el"))
(load-file (concat *EMACS-ENV* "/init/init_sml.el"))
