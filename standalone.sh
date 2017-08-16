#!/bin/bash
rm cljs.jar
wget 'https://github.com/clojure/clojurescript/releases/download/r1.9.854/cljs.jar'

lein deps

mkdir -p /tmp/users/longhomedirname/.m2/repository/cljsjs/react-dom/15.5.4-0/
mkdir -p /tmp/users/longhomedirname/.m2/repository/cljsjs/react-with-addons/15.5.4-0/

cp ~/.m2/repository/cljsjs/react-dom/15.5.4-0/react-dom-15.5.4-0.jar /tmp/users/longhomedirname/.m2/repository/cljsjs/react-dom/15.5.4-0/react-dom-15.5.4-0.jar
cp ~/.m2/repository/cljsjs/react-dom/15.5.4-0/react-dom-15.5.4-0.jar /tmp

cp ~/.m2/repository/cljsjs/react-with-addons/15.5.4-0/react-with-addons-15.5.4-0.jar /tmp/users/longhomedirname/.m2/repository/cljsjs/react-with-addons/15.5.4-0/react-with-addons-15.5.4-0.jar
cp ~/.m2/repository/cljsjs/react-with-addons/15.5.4-0/react-with-addons-15.5.4-0.jar /tmp

java -cp cljs.jar:/tmp/users/longhomedirname/.m2/repository/cljsjs/react-with-addons/15.5.4-0/react-with-addons-15.5.4-0.jar:/tmp/users/longhomedirname/.m2/repository/cljsjs/react-dom/15.5.4-0/react-dom-15.5.4-0.jar:src clojure.main ./scripts/release.clj

cp release/moduleb.js release/fail_moduleb.js

java -cp cljs.jar:/tmp/react-with-addons-15.5.4-0.jar:/tmp/react-dom-15.5.4-0.jar:src clojure.main ./scripts/release.clj

cp release/moduleb.js release/pass_moduleb.js


