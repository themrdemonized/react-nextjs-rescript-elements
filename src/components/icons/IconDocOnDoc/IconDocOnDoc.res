%%private(@module("./IconDocOnDoc.module.scss") external styles: {..} = "default")


@react.component
let make = (
    ~props: ReactDOM.domProps={}
) => {
    <IconComponent
        props
    >
        <svg viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M5.5 2.1499H9.97118L12.75 5.16639V12.3999C13.5784 12.3999 14.25 11.7283 14.25 10.8999V4.58078L10.6288 0.649902H7C6.17157 0.649902 5.5 1.32148 5.5 2.1499Z" fill="currentColor"/>
            <path fillRule="evenodd" clipRule="evenodd" d="M3.5 3.6499C2.5335 3.6499 1.75 4.4334 1.75 5.3999V13.6499C1.75 14.6164 2.5335 15.3999 3.5 15.3999H9.5C10.4665 15.3999 11.25 14.6164 11.25 13.6499V7.58078L7.62882 3.6499H3.5ZM3.25 5.3999C3.25 5.26183 3.36193 5.1499 3.5 5.1499H6.97118L9.75 8.16639V13.6499C9.75 13.788 9.63807 13.8999 9.5 13.8999H3.5C3.36193 13.8999 3.25 13.788 3.25 13.6499V5.3999Z" fill="currentColor"/>
        </svg>
    </IconComponent>
}
