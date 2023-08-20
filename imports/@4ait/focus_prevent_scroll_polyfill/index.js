let supported = false;
document.createElement('i').focus({
    get preventScroll() {
        supported = true;
    },
});
if (!supported) {
    let original = HTMLElement.prototype.focus;
    Element.prototype.focus = HTMLElement.prototype.focus = function(options){
        if (options.preventScroll) {
            const map = new Map();
            let p = this;
            p = p.parentNode;
            while (p)
            {
                map.set(p, [p.scrollLeft, p.scrollTop]);
                p = p.parentNode;
            }
            original.apply(this, arguments);
            map.forEach(function(pos, el){
                // todo: test: only if changed? does it trigger scroll?
                // IE flickers
                el.scrollLeft = pos[0]
                el.scrollTop  = pos[1]
            });
        } else {
            original.apply(this, arguments);
        }
    }
}
