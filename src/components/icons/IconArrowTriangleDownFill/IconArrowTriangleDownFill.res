%%private(@module("./IconArrowTriangleDownFill.module.scss") external styles: {..} = "default")


@react.component
let make = (
    ~style: ReactDOM.Style.t=ReactDOM.Style.make(()),
    ~className = ""
) => {
    <IconComponent
        style={style}
        className={className}
    >
        <svg 
            viewBox="0 0 16 16"
            fill="none" 
            xmlns="http://www.w3.org/2000/svg"
        >
            <path
                d="M13 6.5L8 11.5L3 6.5L13 6.5Z"
                fill="currentColor"
            />
        </svg>
    </IconComponent>
}
