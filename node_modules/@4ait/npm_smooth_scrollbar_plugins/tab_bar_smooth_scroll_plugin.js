import { ScrollbarPlugin } from 'smooth-scrollbar';

export default class TabBarSmoothScrollPlugin extends ScrollbarPlugin {
    static pluginName = 'tabBarSmoothScrollPlugin';

    transformDelta(delta, fromEvent) {
        if (!/wheel/.test(fromEvent.type)) {
            return delta;
        }

        const { x, y } = delta;

        return {
            y: 0,
            x: Math.abs(x) > Math.abs(y) ? x : y,
        };
    }
}
