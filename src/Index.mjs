// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as ButtonComponent from "./components/ButtonComponent/ButtonComponent.mjs";

function $$default(param) {
  var match = React.useState(function () {
        return 0;
      });
  var setCount = match[1];
  var count = match[0];
  return React.createElement("div", undefined, React.createElement(ButtonComponent.make, {
                  value: "count is " + String(count) + "",
                  onClick: (function (param) {
                      Curry._1(setCount, (function (count) {
                              return count + 1 | 0;
                            }));
                    }),
                  style: {
                    marginTop: "16px",
                    marginBottom: "16px"
                  }
                }), React.createElement(ButtonComponent.make, {
                  value: "count is " + String(count) + "",
                  typeColor: /* Secondary */1,
                  onClick: (function (param) {
                      Curry._1(setCount, (function (count) {
                              return count + 1 | 0;
                            }));
                    }),
                  style: {
                    marginBottom: "16px"
                  }
                }), React.createElement(ButtonComponent.make, {
                  value: "count is " + String(count) + "",
                  typeColor: /* Tertiary */2,
                  onClick: (function (param) {
                      Curry._1(setCount, (function (count) {
                              return count + 1 | 0;
                            }));
                    }),
                  style: {
                    marginBottom: "16px"
                  }
                }), React.createElement(ButtonComponent.make, {
                  value: "count is " + String(count) + "",
                  typeSize: /* L */0,
                  onClick: (function (param) {
                      Curry._1(setCount, (function (count) {
                              return count + 1 | 0;
                            }));
                    }),
                  style: {
                    marginBottom: "16px"
                  }
                }), React.createElement(ButtonComponent.make, {
                  value: "count is " + String(count) + "",
                  typeSize: /* S */1,
                  onClick: (function (param) {
                      Curry._1(setCount, (function (count) {
                              return count + 1 | 0;
                            }));
                    }),
                  style: {
                    marginBottom: "16px"
                  }
                }), React.createElement(ButtonComponent.make, {
                  value: "count is " + String(count) + "",
                  disabled: true,
                  onClick: (function (param) {
                      Curry._1(setCount, (function (count) {
                              return count + 1 | 0;
                            }));
                    }),
                  style: {
                    marginBottom: "16px"
                  }
                }));
}

export {
  $$default ,
  $$default as default,
}
/* react Not a pure module */
