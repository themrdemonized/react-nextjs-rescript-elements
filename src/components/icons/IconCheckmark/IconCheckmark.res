%%private(@module("./IconCheckmark.module.scss") external styles: {..} = "default")


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
                fillRule="evenodd"
                clipRule="evenodd"
                d="M12.6166 3.11262C12.9905 3.33695 13.1117 3.82188 12.8874 4.19576L7.83482 12.6167C7.70183 12.8384 7.46875 12.9809 7.21084 12.9982C6.95294 13.0156 6.70287 12.9056 6.5414 12.7037L3.17302 8.49323C2.90065 8.15277 2.95585 7.65596 3.29632 7.38359C3.63678 7.11122 4.13359 7.16642 4.40596 7.50688L7.06506 10.8308L11.5335 3.38341C11.7578 3.00953 12.2427 2.8883 12.6166 3.11262Z" 
                fill="currentColor"
            />
        </svg>
  </IconComponent>
}
