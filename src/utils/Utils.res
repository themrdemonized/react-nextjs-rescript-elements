let getClassNameFromProps = (props: ReactDOM.domProps) : string => {
    switch props {
        | {className: ?None} => ""
        | {className: ?Some(c)} => c
    }
}

let filterProps = (props: ReactDOM.domProps) : ReactDOM.domProps => {
    let res: ReactDOM.domProps = {
        ...props,
        className: ?None,
    }
    res
}

let getTradePalleteClass = () : string => {
    "foura__trade_elements__elements_palette"
}
