%%private(@module("./IconComponent.module.scss") external styles: {..} = "default")


@react.component
let make = (
    ~children,
    ~props: ReactDOM.domProps={}
  ) => {
    let className = Utils.getClassNameFromProps(props)
    let filteredProps = Utils.filterProps(props)
    <div 
        {...filteredProps}
        className={cx([
            styles["icon"],
            className
        ])}
    >
        {children}
    </div>
}
