// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import Head from "next/head";
import Link from "next/link";
import MainLayoutModuleScss from "./MainLayout.module.scss";

var styles = MainLayoutModuleScss;

function MainLayout$Navigation(props) {
  return React.createElement("nav", {
              className: styles["v-header"]
            }, React.createElement("div", {
                  className: styles["nav-bar"]
                }, React.createElement(Link, {
                      href: "/",
                      children: "Home"
                    }), React.createElement(Link, {
                      href: "/buttons",
                      children: "Buttons"
                    }), React.createElement(Link, {
                      href: "/checkboxes",
                      children: "Checkboxes"
                    }), React.createElement("a", {
                      href: "https://github.com/ryyppy/nextjs-default",
                      target: "_blank"
                    }, "Github")));
}

function MainLayout(props) {
  return React.createElement(React.Fragment, undefined, React.createElement(Head, {
                  children: React.createElement("title", undefined, "Rescript - React - NextJS - Trade elements")
                }), React.createElement("div", {
                  className: "kr-body"
                }, React.createElement("div", undefined, React.createElement(MainLayout$Navigation, {}), React.createElement("main", undefined, props.children))));
}

var make = MainLayout;

export {
  make ,
}
/* styles Not a pure module */
