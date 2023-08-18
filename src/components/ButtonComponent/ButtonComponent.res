%%private(@module("./ButtonComponent.module.scss") external style: {..} = "default")
@send external blur: Dom.element => unit = "blur"

@react.component
let make = (
  ~type_: option<string>=?,
  ~value: string="",
  ~name: string="",
  ~onClick,
  ~typeSize: char='M',
  ~typeColor: string="Primary",
  ~disabled: bool=false,
  ~forceActive: bool=false,
  ~iconWithTextSlot: option<React.element>=?,
  ~iconSingleSlot: option<React.element>=?,
  ~iconDouble1Slot: option<React.element>=?,
  ~iconDouble2Slot: option<React.element>=?,
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
        ref={ReactDOM.Ref.domRef(input)}
        type_={t}
        name={name}
        value={value}
        className={style["hidden-input"]}
      />
    | None =>
      React.null
  }

  let slotEl: React.element = switch (iconSingleSlot, iconDouble1Slot, iconWithTextSlot) {
    | (Some(t), _, _) =>
    <div className={style["icon-single"]}>
      {t}
    </div>
    | (_, Some(t), _) =>
      switch (iconDouble2Slot) {
        | Some(y) =>
          <>
            <div className={style["icon-double"]}>
              {t}
            </div>
            <div className={style["icon-double"]}>
              {y}
            </div>
          </>
        | None =>
          <div className={style["icon-double"]}>
            {t}
          </div>
      }
    | (_, _ , Some(t)) =>
      <div className={style["icon-with-text"]}>
        {t}
      </div>
    | (_, _, _) =>
      <div className={style["text"]}>
        {React.string(value)}
      </div>
  }

  <>
    <div
      className={cx([
        "foura__trade_elements__elements_palette",
        style["root"],
        typeSize === 'L' ? style["large"] : "",
        typeSize === 'S' ? style["small"] : "",
        iconWithTextSlot !== None ? style["root-with-icon"] : "",
        iconSingleSlot !== None ? style["root-with-icon-single"] : "",
        iconDouble1Slot !== None ? style["root-with-icon-double"] : "",
      ])}
    >
      <div 
        ref={ReactDOM.Ref.domRef(main)}
        tabIndex={disabled ? 0 : 0}
        onClick={onClick}
        className={cx([
          style["root-button"],
          disabled ? style["disabled"] : "",
          typeColor === "Secondary" ? style["secondary"] : "",
          typeColor === "Tertiary" ? style["tertiary"] : "",
          forceActive ? style["force-active"] : ""
        ])}
      >
        <div 
          className={style["content"]}
        >
          {slotEl}
        </div>      
      </div>
      {inputEl}
    </div>
  </>
}
