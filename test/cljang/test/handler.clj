(ns cljang.test.handler
  (:use clojure.test
        ring.mock.request
        cljang.handler))

(deftest test-app
  (testing "main route"
    (let [response (app (request :get "/"))]
      (is (= (:status response) 200))))

  (testing "not-found route"
    (let [response (app (request :get "/invalid"))]
      (is (= (:status response) 404))))

  (testing "nice things api"
    (let [response (app (request :get "/api/nicethings"))]
      (is (= "application/json;charset=UTF-8"
             (get (:headers response) "Content-Type")))
      (is (= (:status response) 200)))))
