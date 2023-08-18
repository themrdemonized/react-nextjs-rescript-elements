// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Cx from "rescript-classnames/src/Cx.mjs";
import * as React from "react";
import * as Belt_Option from "rescript/lib/es6/belt_Option.js";
import * as Caml_option from "rescript/lib/es6/caml_option.js";
import ButtonComponentModuleScss from "./ButtonComponent.module.scss";

var style = ButtonComponentModuleScss;

function ButtonComponent(props) {
  var iconDouble2Slot = props.iconDouble2Slot;
  var iconDouble1Slot = props.iconDouble1Slot;
  var iconSingleSlot = props.iconSingleSlot;
  var iconWithTextSlot = props.iconWithTextSlot;
  var forceActive = props.forceActive;
  var disabled = props.disabled;
  var typeColor = props.typeColor;
  var typeSize = props.typeSize;
  var name = props.name;
  var value = props.value;
  var type_ = props.type_;
  var value$1 = value !== undefined ? value : "";
  var name$1 = name !== undefined ? name : "";
  var typeSize$1 = typeSize !== undefined ? typeSize : /* 'M' */77;
  var typeColor$1 = typeColor !== undefined ? typeColor : "Primary";
  var disabled$1 = disabled !== undefined ? disabled : false;
  var forceActive$1 = forceActive !== undefined ? forceActive : false;
  var main = React.useRef(null);
  var input = React.useRef(null);
  React.useEffect((function () {
          if (disabled$1) {
            Belt_Option.forEach(Caml_option.nullable_to_opt(main.current), (function (el) {
                    el.blur();
                  }));
          }
          
        }), [disabled$1]);
  var inputEl = type_ !== undefined ? React.createElement("input", {
          ref: Caml_option.some(input),
          className: style["hidden-input"],
          name: name$1,
          type: type_,
          value: value$1
        }) : null;
  var slotEl;
  if (iconSingleSlot !== undefined) {
    slotEl = React.createElement("div", {
          className: style["icon-single"]
        }, Caml_option.valFromOption(iconSingleSlot));
  } else if (iconDouble1Slot !== undefined) {
    var t = Caml_option.valFromOption(iconDouble1Slot);
    slotEl = iconDouble2Slot !== undefined ? React.createElement(React.Fragment, undefined, React.createElement("div", {
                className: style["icon-double"]
              }, t), React.createElement("div", {
                className: style["icon-double"]
              }, Caml_option.valFromOption(iconDouble2Slot))) : React.createElement("div", {
            className: style["icon-double"]
          }, t);
  } else {
    slotEl = iconWithTextSlot !== undefined ? React.createElement("div", {
            className: style["icon-with-text"]
          }, Caml_option.valFromOption(iconWithTextSlot)) : React.createElement("div", {
            className: style.text
          }, value$1);
  }
  return React.createElement(React.Fragment, undefined, React.createElement("div", {
                  className: Cx.cx([
                        style.root,
                        typeSize$1 === /* 'L' */76 ? style.large : "",
                        typeSize$1 === /* 'S' */83 ? style.small : "",
                        iconWithTextSlot !== undefined ? style["root-with-icon"] : "",
                        iconSingleSlot !== undefined ? style["root-with-icon-single"] : "",
                        iconDouble1Slot !== undefined ? style["root-with-icon-double"] : ""
                      ])
                }, React.createElement("div", {
                      ref: Caml_option.some(main),
                      className: Cx.cx([
                            style["root-button"],
                            disabled$1 ? style.disabled : "",
                            typeColor$1 === "Secondary" ? style.secondary : "",
                            typeColor$1 === "Tertiary" ? style.tertiary : "",
                            forceActive$1 ? style["force-active"] : ""
                          ]),
                      tabIndex: 0,
                      onClick: props.onClick
                    }, React.createElement("div", {
                          className: style.content
                        }, slotEl)), inputEl));
}

var make = ButtonComponent;

export {
  make ,
}
/* style Not a pure module */
