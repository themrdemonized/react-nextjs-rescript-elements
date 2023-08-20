%%private(@module("./IconPlusSmall.module.scss") external styles: {..} = "default")


@react.component
let make = (
    ~props: ReactDOM.domProps={}
) => {
    <IconComponent
        props
    >
        <svg viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path 
                fillRule="evenodd"
                clipRule="evenodd"
                d="M7.4 8.6V11.8C7.4 11.9105 7.48954 12 7.6 12H8.4C8.51046 12 8.6 11.9105 8.6 11.8V8.6H11.8C11.9105 8.6 12 8.51046 12 8.4V7.6C12 7.48954 11.9105 7.4 11.8 7.4H8.6V4.2C8.6 4.08954 8.51046 4 8.4 4L7.6 4C7.48954 4 7.4 4.08954 7.4 4.2L7.4 7.4H4.2C4.08954 7.4 4 7.48954 4 7.6L4 8.4C4 8.51046 4.08954 8.6 4.2 8.6H7.4Z" 
                fill="currentColor"/>
        </svg>
  </IconComponent>
}
