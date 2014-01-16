(ns cljang.util
  (:require [noir.io :as io]
            [clj-time.core :as time]
            [markdown.core :as md]))


(defn md->html
  "reads a markdown file from public/md and returns an HTML string"
  [filename]
  (->>
    (io/slurp-resource filename)
    (md/md-to-html-string)))


(defn datetime
  "Shortcut for current datetime"
  []
  (time/now))


(defn uuid
  "Generate a uuid"
  []
  (str (java.util.UUID/randomUUID)))
