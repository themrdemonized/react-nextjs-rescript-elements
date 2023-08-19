%%private(@module("./CheckboxComponent.module.scss") external styles: {..} = "default")
@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"

type types = M | S
type modes = Normal | Parted
type states = True | False | Parted

@react.component
let make = (
  ~modelValue: states=False,
  ~disabled: bool=false,
  ~isError: bool=false,
  ~type_: types=M,
  ~mode: modes=Normal,
  ~updateModelValue: (bool) => unit,
  ~children: option<React.element>=?,
  
  ~style: ReactDOM.Style.t=ReactDOM.Style.make(()),
  ~className = ""
  ) => {
    let (isFocused, setIsFocused) = React.useState(() => false)
    let onFocus = (_) => {
        setIsFocused(_ => true)
    }

    let currentChecked: ref<bool> = ref(modelValue === True ? true : false)

    let state: states = switch mode {
        | Normal => currentChecked.contents ? True : False
        | Parted => switch (currentChecked.contents, modelValue) {
            | (true, _) => True
            | (false, Parted) => Parted
            | (_, _) => False
        }
    }
    
    let onBlur = (_) => {
        setIsFocused(_ => false)
    }

    let onChange = (_) => {
        if !disabled {
            currentChecked := !currentChecked.contents
            updateModelValue(currentChecked.contents)
        }
    }

    let onKeyUp = (e) => {
        if !disabled {
            let key = e->ReactEvent.Keyboard.keyCode
            switch key {
                | 13
                | 32 => 
                    onChange();
                    e->ReactEvent.Keyboard.preventDefault
                | _ => ()
            }
        }        
    }

    let onMouseDown = (_) => {
        ()
    }

    React.useEffect1(() => {
        currentChecked := switch (mode, modelValue) {
            | (Normal, True) => true
            | (Normal, _) => false
            | (Parted, True) => true
            | (Parted, _) => false
        }
        None
    }, [mode])

    <div>
        <div
            className={cx([
                "foura__trade_elements__elements_palette",
                styles["input-wrapper"],
                isFocused ? styles["focused"] : "",
                disabled ? styles["disabled"] : "",
                isError ? styles["error"] : "",
                state === True || state === Parted ? styles["checked"] : "",
                type_ === S ? styles["small"] : "",
                className
            ])}
            style={style}
            tabIndex={disabled ? 0 : 0}

            onFocus={onFocus}
            onBlur={onBlur}

            onKeyUp={onKeyUp}
            onMouseDown={onMouseDown}

            onClick={onChange}
        >
            <div 
                className={styles["checkbox-wrapper"]}
            >
                <div
                    className={styles["checkbox"]}
                >
                    {state === Parted ? (
                        <IconMinusLarge
                            className={styles["check-icon"]}
                        />
                    ) : (
                        <IconCheckmark
                            className={styles["check-icon"]}
                        />
                    )}
                </div>
            </div>
            {switch children {
                | None => React.null
                | Some(c) =>
                    <span 
                        className={styles["caption"]}
                    >
                        {c}
                    </span>
            }}
        </div>
    </div>
}
