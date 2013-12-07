(ns cljang.routes.api
  (:use compojure.core)
  (:require [liberator.core :refer [defresource]]))

(def things
  ["Clojure",
   "Liberator",
   "AngularJS",
   "CoffeeScript",
   "Sass",
   "Grunt",
   "Bower"])

(defresource nice-things
  :available-media-types ["application/json"]
  :handle-ok {:things things})


(defroutes api-routes
  (GET "/api/nicethings" [] nice-things))

