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
  ~updateModelValue: (states) => unit,
  ~children: option<React.element>=?,
  
  ~props: ReactDOM.domProps={}
  ) => {
    let className = Utils.getClassNameFromProps(props)
    let filteredProps = Utils.filterProps(props)

    let (isFocused, setIsFocused) = React.useState(() => false)
    let onFocus = (_) => {
        if !disabled {
            setIsFocused(_ => true)
        }
    }

    let (state, setState) = React.useState(() => switch mode {
        | Normal => modelValue === True ? True : False
        | Parted => modelValue
    })
    
    let onBlur = (_) => {
        setIsFocused(_ => false)
    }

    let onChange = (_) => {
        if !disabled {
            setState(s => s === True ? False : True)
            updateModelValue(state)
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

    let onDoubleClick = (e) => {
        e->ReactEvent.Mouse.preventDefault
    }

    <div
        {...filteredProps}
    >
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
            tabIndex={disabled ? 0 : 0}

            onFocus={onFocus}
            onBlur={onBlur}

            onKeyUp={onKeyUp}
            onMouseDown={onMouseDown}
            onDoubleClick={onDoubleClick}

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
                            props={className: {styles["check-icon"]}}
                        />
                    ) : (
                        <IconCheckmark
                            props={className: {styles["check-icon"]}}
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
