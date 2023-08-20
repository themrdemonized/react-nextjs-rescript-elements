%%private(@module("./TextFieldComponent.module.scss") external styles: {..} = "default")

@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"
@send external focus: Dom.element => unit = "focus"
@get external selectionStart: Dom.element => option<int> = "selectionStart"
@send external setSelectionRange: (Dom.element, int, int) => unit = "setSelectionRange"

type typeSizes = M

@react.component
let make = (
    ~name: string="",
    ~autocomplete: string="on",
    ~type_: string="text",
    ~typeValue: string="",
    ~modelValue: string="",
    ~typeSize: typeSizes=M,
    ~disabled: bool=false,
    ~isError: bool=false,
    ~autoselect: bool=false,
    ~autofocus: bool=false,
    ~forceWithContentState: bool=false,
    ~forceFocusState: bool=false,
    ~updateModelValueOnInput: bool=false,

    ~onChange: option<(string) => unit>=?,
    ~onInput: option<(string) => unit>=?,
    ~updateModelValue: option<(string) => unit>=?,
    ~onFocus: option<() => unit>=?,
    ~onBlur: option<() => unit>=?,
    ~onKeyUp: option<(ReactEvent.Keyboard.t) => unit>=?,

    ~contentSlot: option<React.element>=?,
    ~children: option<React.element>=?,
    ~props: ReactDOM.domProps={}
) => {
    let className = Utils.getClassNameFromProps(props)
    let filteredProps = Utils.filterProps(props)

    let input = React.useRef(Js.Nullable.null)
    let content = React.useRef(Js.Nullable.null)

    let (currentValue, setCurrentValue) = React.useState(() => modelValue)
    let (contentLeftPadding, setContentLeftPadding) = React.useState(() => 0)

    let updateContentPadding = () => {
        switch contentSlot {
            | None => ()
            | Some(_) => 
                content.current->Js.Nullable.toOption->Belt.Option.forEach(el => {
                    let rect = Webapi.Dom.Element.getBoundingClientRect(el)
                    let w = rect->Webapi.Dom.DomRect.width
                    setContentLeftPadding(_ => Belt.Float.toInt(w))
                })
        }
    }

    React.useEffect2(() => {
        let nav = Webapi.Dom.window->Webapi.Dom.Window.navigator
        let ua = nav.userAgent
        let re1 = Js.Re.fromStringWithFlags("iPad", ~flags="i")
        let re2 = Js.Re.fromStringWithFlags("iPhone", ~flags="i")
        let isiOS = re1->Js.Re.test_(ua) || re2->Js.Re.test_(ua)

        if (autoselect && !isiOS)
        {
            input.current->Js.Nullable.toOption->Belt.Option.forEach(el => el->focus)
        }

        switch contentSlot {
            | None => ()
            | Some(_) => updateContentPadding();
        }

        None
    }, (autoselect, content))

    let (isFocusedInput, setIsFocusedInput) = React.useState(() => false)
    let isFocused = forceFocusState || isFocusedInput

    let handleFocus = (_) => {
        setIsFocusedInput((_) => true)
        switch onFocus {
            | Some(c) => c()
            | None => ()
        }
    }

    let handleBlur = (_) => {
        setIsFocusedInput((_) => false)
        switch onBlur {
            | Some(c) => c()
            | None => ()
        }
    }

    let handleChange = (e) => {
        let v =  e->ReactEvent.Form.currentTarget
        let value = v["value"]
        setCurrentValue((_) => value)
        switch onChange {
            | Some(c) => c(value)
            | None => ()
        }
        switch updateModelValue {
            | Some(c) => c(value)
            | None => ()
        }
    }

    let handleInput = (e) => {
        let v = e->ReactEvent.Form.currentTarget
        let value = v["value"]
        setCurrentValue((_) => value)
        switch onInput {
            | Some(c) => c(value)
            | None => ()
        }

        switch (updateModelValueOnInput, updateModelValue) {
            | (true, Some(c)) => c(value)
            | (_, _) => ()
        }

        input.current->Js.Nullable.toOption->Belt.Option.forEach(el => {
            let startPos = el->selectionStart
            switch startPos {
                | None => ()
                | Some(c) => 
                    el->setSelectionRange(c, c)
            }
        })
    }

    let isWithContent = forceWithContentState || currentValue !== "" || Js.Option.isSome(contentSlot)
    let currentValueString = currentValue

    let handleKeyUp = (e) => {
        switch onKeyUp {
            | Some(c) => c(e)
            | None => ()
        }
    }   

    <div 
         {...filteredProps}
        className={styles["root"]}
    >
        <div
            className={cx([
                Utils.getTradePalleteClass(),
                styles["input-wrapper"],
                isFocused ? styles["focused"]: "",
                isWithContent ? styles["with-text"]: "",
                disabled ? styles["disabled"]: "",
                isError ? styles["error"]: "",
                className
            ])}
        >
            <input
                ref={ReactDOM.Ref.domRef(input)}
                className={cx([
                    "font-4ait-elements_text",
                    styles["input"]
                ])}
                disabled={disabled}

                onFocus={handleFocus}
                onBlur={handleBlur}
                onChange={handleChange}
                onInput={handleInput}
                onKeyUp={handleKeyUp}

                type_={type_}
                name={name}
                value={currentValueString}
                autoComplete={autocomplete}
                autoFocus={autofocus}

                style={ReactDOM.Style.make(~paddingLeft=`${Belt.Int.toString(16 + contentLeftPadding)}px`, ())}
            />
            {switch contentSlot {
                | None => React.null
                | Some(c) =>
                    <div 
                        ref={ReactDOM.Ref.domRef(content)}
                        style={ReactDOM.Style.make(
                            ~position="absolute",
                            ~left="16px",
                            ~top="22px",
                            ~height="22px",
                            ~display="flex",
                            ~justifyContent="center",
                            ~alignItems="center",
                            ()
                        )}
                    >
                        <div>
                            {c}
                        </div>
                    </div>
                }
            }
            <span 
                className={styles["caption"]}
            >
                {switch children {
                    | None => React.null
                    | Some(c) => {c}
                }}
            </span>
            <div 
                className={styles["group-icon"]}
            >
                <IconExclamationMarkTriangleFill
                    props={
                        className: {cx([
                            styles["icon-status"],
                            styles["icon-warning"] 
                        ])}
                    }
                />
            </div>
        </div>
    </div>
}

