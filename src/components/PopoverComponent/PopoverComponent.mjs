// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Cx from "rescript-classnames/src/Cx.mjs";
import * as Curry from "rescript/lib/es6/curry.js";
import * as Utils from "../../utils/Utils.mjs";
import * as React from "react";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Belt_Array from "rescript/lib/es6/belt_Array.js";
import * as Caml_array from "rescript/lib/es6/caml_array.js";
import PopoverComponentModuleScss from "./PopoverComponent.module.scss";

var styles = PopoverComponentModuleScss;

function PopoverComponent(props) {
  var props$1 = props.props;
  var toolsSlots = props.toolsSlots;
  var clickTool = props.clickTool;
  var tools = props.tools;
  var tools$1 = tools !== undefined ? tools : [];
  var clickTool$1 = clickTool !== undefined ? clickTool : (function (param) {
        
      });
  var toolsSlots$1 = toolsSlots !== undefined ? toolsSlots : [];
  var props$2 = props$1 !== undefined ? props$1 : ({});
  var className = Utils.getClassNameFromProps(props$2);
  var filteredProps = Utils.filterProps(props$2);
  var hasTools = tools$1.length !== 0;
  var toolsWithDividers = Belt_Array.sliceToEnd(Belt_Array.flatMap(tools$1, (function (el) {
              return [
                      "divider",
                      el
                    ];
            })), 1);
  var toolsSlotsWithDivider = Belt_Array.sliceToEnd(Belt_Array.flatMap(toolsSlots$1, (function (el) {
              return [
                      null,
                      el
                    ];
            })), 1);
  var toolsEl;
  if (hasTools) {
    var toolsList = Belt_Array.mapWithIndex(toolsWithDividers, (function (index, el) {
            if (el === "divider") {
              return React.createElement("div", {
                          key: String(index),
                          className: styles["divider-line"]
                        });
            } else {
              return React.createElement("div", {
                          key: String(index),
                          className: styles.tool,
                          onClick: (function (param) {
                              Curry._1(clickTool$1, el);
                            })
                        }, Caml_array.get(toolsSlotsWithDivider, index));
            }
          }));
    toolsEl = React.createElement("div", {
          className: styles.tools
        }, toolsList);
  } else {
    toolsEl = null;
  }
  var newrecord = Caml_obj.obj_dup(filteredProps);
  return React.createElement("div", (newrecord.className = Cx.cx([
                    Utils.getTradePalleteClass(undefined),
                    styles.root,
                    hasTools ? styles["root-with-tools"] : "",
                    className
                  ]), newrecord), React.createElement("div", {
                  className: styles["root-popover"]
                }, React.createElement("div", {
                      className: styles.content
                    }, props.children), toolsEl));
}

var make = PopoverComponent;

export {
  make ,
}
/* styles Not a pure module */
