%%private(@module("./ButtonComponent.module.scss") external styles: {..} = "default")
@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"

type typeSizes = L | S | M
type typeColors = Primary | Secondary | Tertiary

@react.component
let make = (
  ~type_: option<string>=?,
  ~value: string="",
  ~name: string="",
  ~typeSize: typeSizes=M,
  ~typeColor: typeColors=Primary,
  ~disabled: bool=false,
  ~forceActive: bool=false,
  ~iconWithTextSlot: option<React.element>=?,
  ~iconSingleSlot: option<React.element>=?,
  ~iconDouble1Slot: option<React.element>=?,
  ~iconDouble2Slot: option<React.element>=?,
  ~onClick,
  ~style: ReactDOM.Style.t=ReactDOM.Style.make(()),
  ~className = ""
  ) => {
  let main = React.useRef(Js.Nullable.null)
  let input = React.useRef(Js.Nullable.null)

  React.useEffect1(() => {
    if disabled {
      main.current->Js.Nullable.toOption->Belt.Option.forEach(el => el->blur)
    }
    None
  }, [disabled])

  let inputEl: React.element = switch type_ {
    | Some(t) =>
      <input
        readOnly=true
        ref={ReactDOM.Ref.domRef(input)}
        type_={t}
        name={name}
        value={value}
        className={styles["hidden-input"]}
      />
    | None =>
      React.null
  }

  let slotEl: React.element = switch (iconSingleSlot, iconDouble1Slot, iconWithTextSlot) {
    | (Some(t), _, _) =>
    <div className={styles["icon-single"]}>
      {t}
    </div>
    | (_, Some(t), _) =>
      switch (iconDouble2Slot) {
        | Some(y) =>
          <>
            <div className={styles["icon-double"]}>
              {t}
            </div>
            <div className={styles["icon-double"]}>
              {y}
            </div>
          </>
        | None =>
          <div className={styles["icon-double"]}>
            {t}
          </div>
      }
    | (_, _ , Some(t)) =>
      <div className={styles["icon-with-text"]}>
        {t}
      </div>
    | (_, _, _) =>
      <div className={styles["text"]}>
        {React.string(value)}
      </div>
  }

  let handleClick = (e) => {
    if !disabled {
      switch type_ {
        | Some(_) => input.current->Js.Nullable.toOption->Belt.Option.forEach(el => el->click)
        | None => ()
      }
      // Js.Console.log("clicked")
      onClick(e);
    }
  }
  <>
    <div
      className={cx([
        "foura__trade_elements__elements_palette",
        styles["root"],
        typeSize === L ? styles["large"] : "",
        typeSize === S ? styles["small"] : "",
        iconWithTextSlot !== None ? styles["root-with-icon"] : "",
        iconSingleSlot !== None ? styles["root-with-icon-single"] : "",
        iconDouble1Slot !== None ? styles["root-with-icon-double"] : "",
        className
      ])}
      style={style}
    >
      <div 
        ref={ReactDOM.Ref.domRef(main)}
        tabIndex={disabled ? 0 : 0}
        onClick={handleClick}
        className={cx([
          styles["root-button"],
          disabled ? styles["disabled"] : "",
          typeColor === Secondary ? styles["secondary"] : "",
          typeColor === Tertiary ? styles["tertiary"] : "",
          forceActive ? styles["force-active"] : ""
        ])}
      >
        <div 
          className={styles["content"]}
        >
          {slotEl}
        </div>      
      </div>
      {inputEl}
    </div>
  </>
}
