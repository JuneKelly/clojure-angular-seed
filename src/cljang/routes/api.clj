(ns cljang.routes.api
  (:use compojure.core)
  (:require [liberator.core :refer [defresource]]))


(defresource nice-things
  :available-media-types ["application/json"]
  :handle-ok {:things ["Clojure", "AngularJS"]})


(defroutes api-routes
  (GET "/api/nicethings" [] nice-things))
