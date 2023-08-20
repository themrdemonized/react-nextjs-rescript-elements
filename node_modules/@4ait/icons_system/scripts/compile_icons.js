const fs = require('fs');

fs.readdir("icons", (err, files) => {
    files.forEach(fileName => {
        //fs.rm("icons/" + fileName, {}, ()=>{});
    });
})

const templateIconComponent = fs.readFileSync("src/TemplateIconComponent.vue").toString();

fs.readdir("raw_icons_svg", (err, files) => {
    files.forEach(fileName => {

        const svgSource = fs.readFileSync("raw_icons_svg/" + fileName).toString();

        const svgSourceProcessed = (svgSource
            .replace(/(<svg.*)([\s\r\t\n]+width[\s\r\t\n]*="[^"]+")([^>]+>)/g, '$1$3')
            .replace(/(<svg.*)([\s\r\t\n]+height[\s\r\t\n]*="[^"]+")([^>]+>)/g, '$1$3')
            .replace(/[\s\r\t\n]+(stroke|fill)[\s\r\t\n]*="(black|#000)"/g, ' $1="currentColor"'));

        let componentName =
            fileName.slice(0, -4).replace(/\.([a-z])/g, function (m, w) {
                return w.toUpperCase();
            }).replace('.', '');

        componentName = componentName.charAt(0).toUpperCase() + componentName.slice(1)

        componentName = "Icon" + componentName;

        const componentSource = templateIconComponent
            .replace('__ICON_SVG__', svgSourceProcessed);

        fs.writeFile("icons/" + componentName + ".vue", componentSource, () => {})

    });
});
