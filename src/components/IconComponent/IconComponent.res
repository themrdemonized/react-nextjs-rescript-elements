%%private(@module("./IconComponent.module.scss") external styles: {..} = "default")


@react.component
let make = (
    ~children,
    ~style: ReactDOM.Style.t=ReactDOM.Style.make(()),
    ~className = ""
) => {
    <div 
        className={cx([
            styles["icon"],
            className
        ])}
    >
        {children}
    </div>
}
