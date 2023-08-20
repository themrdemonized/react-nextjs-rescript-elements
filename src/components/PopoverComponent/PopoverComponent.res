%%private(@module("./PopoverComponent.module.scss") external styles: {..} = "default")
@send external blur: Dom.element => unit = "blur"
@send external click: Dom.element => unit = "click"

type types = M | S
type modes = Normal | Parted
type states = True | False | Parted

@react.component
let make = (
  ~tools: array<string>=[],
  ~clickTool: (string) => ()=(_) => (),
  ~children,
  ~toolsSlots: array<React.element>=[],
  
  ~props: ReactDOM.domProps={}
  ) => {
    let className = Utils.getClassNameFromProps(props)
    let filteredProps = Utils.filterProps(props)
    let hasTools = tools->Belt.Array.length > 0

    let handleClick = (s: string) => {
        clickTool(s)
    }

    let toolsWithDividers = tools
        ->Belt.Array.flatMap((el) => ["divider", el])
        ->Belt.Array.sliceToEnd(1)

    let toolsSlotsWithDivider = toolsSlots
        ->Belt.Array.flatMap((el) => [React.null, el])
        ->Belt.Array.sliceToEnd(1)

    let toolsEl = switch hasTools {
        | false => React.null
        | true => 
            let toolsList = toolsWithDividers->Belt.Array.mapWithIndex((index, el) => {
                let res = switch el {
                    | "divider" =>
                        <div 
                            className={styles["divider-line"]}
                            key={Belt.Int.toString(index)}
                        />
                    | _ => 
                        <div
                            className={styles["tool"]}
                            onClick={_ => handleClick(el)}
                            key={Belt.Int.toString(index)}
                        >
                            {toolsSlotsWithDivider[index]}
                        </div>
                }
                res
            })
            <div 
                className={styles["tools"]}
            >
                {React.array(toolsList)}
            </div>
    }

    <div
        {...filteredProps}
        className={cx([
            Utils.getTradePalleteClass(),
            styles["root"],
            hasTools ? styles["root-with-tools"] : "",
            className
        ])}
    >
        <div
            className={styles["root-popover"]}
        >
            <div 
                className={styles["content"]}
            >
                {children}
            </div>
            {toolsEl}
        </div>
    </div>
}
