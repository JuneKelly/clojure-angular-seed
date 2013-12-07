(ns cljang.routes.home
  (:use compojure.core)
  (:require [cljang.views.layout :as layout]
            [cljang.util :as util]))


(defn home-page []
  (layout/render
    "base.html"))


(defroutes home-routes
  (GET "/" [] (home-page)))
